// Header file for the utility functions for QR decomposition of a matrix

// Definition of the linked list node
typedef struct Node{
	double val;
	struct Node* below, *next;
} node_t, *node;
 
typedef struct {
	int m, n;
	node head;
} mat_t, *mat;

// Returns the pointer to the node at position (i, j)
node at(node head, int i, int j){
	node curr = head;
	for(int x = 0; x < i; x++, curr = curr->below); // find the row-i
	for(int y = 0; y < j; y++, curr = curr->next); // find the column-j in the row-i
	return curr;
}
 
mat matrix_new(int m, int n)
{
	mat x = (mat_t*)malloc(sizeof(mat_t));
	x->head = (node)malloc(sizeof(node_t));
	node currHead = x->head, curr;
	for(int i = 0; i < m; i++){
		curr = currHead;
		for(int j = 0; j < n - 1; j++){
			curr->val = 0;
			curr->next = (node)malloc(sizeof(node_t));
			curr = curr->next;
		}
		if(i < m - 1){
			currHead->below = (node)malloc(sizeof(node_t));
			currHead = currHead->below;
		}
	}
	x->m = m, x->n = n;
	return x;
}

mat matrix_clone(mat x){
	mat y = matrix_new(x->m, x->n);
	for(int i = 0; i < x->m; i++){
		for(int j = 0; j < x->n; j++){
			at(y->head, i, j)->val = at(x->head, i, j)->val;
		}
	}
	return y;
}
 
void matrix_delete(mat m)
{
	free(m->head);
	free(m);
}
 
void matrix_transpose(mat m)
{
	for (int i = 0; i < m->m; i++) {
		for (int j = 0; j < i; j++) {
			double t = at(m->head, i, j)->val;
			at(m->head, i, j)->val = at(m->head, j, i)->val;
			at(m->head, j, i)->val = t;
		}
	}
}
 
mat matrix_copy(double* a, int m, int n)
{
	mat x = matrix_new(m, n);
	for (int i = 0; i < m; i++)
		for (int j = 0; j < n; j++)
			at(x->head, i, j)->val = *((a + n * i) + j);
	return x;
}
 
mat matrix_mul(mat x, mat y)
{
	if (x->n != y->m) return 0;
	mat r = matrix_new(x->m, y->n);
	for (int i = 0; i < x->m; i++)
		for (int j = 0; j < y->n; j++)
			for (int k = 0; k < x->n; k++)
				at(r->head, i, j)->val += at(x->head, i, k)->val * at(y->head, k, j)->val;
	return r;
}
 
mat matrix_minor(mat x, int d)
{
	mat m = matrix_new(x->m, x->n);
	for (int i = 0; i < d; i++)
		at(m->head, i, i)->val = 1;
	for (int i = d; i < x->m; i++)
		for (int j = d; j < x->n; j++)
			at(m->head, i, j)->val = at(x->head, i, j)->val;
	return m;
}
 
/* c = a + b * s */
double *vmadd(double a[], double b[], double s, double c[], int n)
{
	for (int i = 0; i < n; i++)
		c[i] = a[i] + s * b[i];
	return c;
}
 
/* m = I - v v^T */
mat vmul(double v[], int n)
{
	mat x = matrix_new(n, n);
	for (int i = 0; i < n; i++)
		for (int j = 0; j < n; j++)
			at(x->head, i, j)->val = -2 *  v[i] * v[j];
	for (int i = 0; i < n; i++)
		at(x->head, i, i)->val += 1;
 
	return x;
}
 
/* ||x|| */
double vnorm(double x[], int n)
{
	double sum = 0;
	for (int i = 0; i < n; i++) sum += x[i] * x[i];
	return sqrt(sum);
}
 
/* y = x / d */
double* vdiv(double x[], double d, double y[], int n)
{
	for (int i = 0; i < n; i++) y[i] = x[i] / d;
	return y;
}
 
/* take c-th column of m, put in v */
double* mcol(mat m, double *v, int c)
{
	for (int i = 0; i < m->m; i++)
		v[i] = at(m->head, i, c)->val;
	return v;
}
 
void matrix_show(mat m)
{
	for(int i = 0; i < m->m; i++) {
		for (int j = 0; j < m->n; j++) {
			printf(" %8.3f", at(m->head, i, j)->val);
		}
		printf("\n");
	}
	printf("\n");
}
 
void householder(mat m, mat *R, mat *Q)
{
	mat q[m->m];
	mat z = m, z1;
	for (int k = 0; k < m->n && k < m->m - 1; k++) {
		double e[m->m], x[m->m], a;
		z1 = matrix_minor(z, k);
		if (z != m) matrix_delete(z);
		z = z1;
 
		mcol(z, x, k);
		a = vnorm(x, m->m);
		if (at(m->head, k, k)->val > 0) a = -a;
 
		for (int i = 0; i < m->m; i++)
			e[i] = (i == k) ? 1 : 0;
 
		vmadd(x, e, a, e, m->m);
		vdiv(e, vnorm(e, m->m), e, m->m);
		q[k] = vmul(e, m->m);
		z1 = matrix_mul(q[k], z);
		if (z != m) matrix_delete(z);
		z = z1;
	}
	matrix_delete(z);
	*Q = q[0];
	*R = matrix_mul(q[0], m);
	for (int i = 1; i < m->n && i < m->m - 1; i++) {
		z1 = matrix_mul(q[i], *Q);
		if (i > 1) matrix_delete(*Q);
		*Q = z1;
		matrix_delete(q[i]);
	}
	matrix_delete(q[0]);
	z = matrix_mul(*Q, m);
	matrix_delete(*R);
	*R = z;
	matrix_transpose(*Q);
}

bool converged(mat a, mat prev){
    int m = a->m, n = a->n;
    for(int i = 0; i < m; i++){
        if(abs(at(a->head, i, i)->val - at(prev->head, i, i)->val) > 1e-3)
            return false;
    }
    return true;
}

