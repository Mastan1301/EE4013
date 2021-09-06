// Header file for the utility functions for QR decomposition of a matrix

void matrix_transpose(vdd& m)
{
	for (int i = 0; i < m.size(); i++) {
		for (int j = 0; j < i; j++) {
			swap(m[i][j], m[j][i]);
		}
	}
}
 
vdd matrix_mul(vdd x, vdd y)
{
	if (x[0].size() != y.size()) return {};
	vdd r(x.size(), vd(y[0].size(), 0));
	for (int i = 0; i < x.size(); i++)
		for (int j = 0; j < y[0].size(); j++)
			for (int k = 0; k < x[0].size(); k++)
				r[i][j] += x[i][k] * y[k][j];
	return r;
}
 
vdd matrix_minor(vdd x, int d)
{
	vdd m(x.size(), vd(x[0].size(), 0));
	for (int i = 0; i < d; i++)
		m[i][i] = 1;
	for (int i = d; i < x.size(); i++)
		for (int j = d; j < x[0].size(); j++)
			m[i][j] = x[i][j];
	return m;
}
 
/* c = a + b * s */
vd vmadd(vd a, vd b, double s, vd& c, int n)
{
	for (int i = 0; i < n; i++)
		c[i] = a[i] + s * b[i];
	return c;
}
 
/* m = I - v v^T */
vdd vmul(vd v, int n)
{
	vdd x(n, vd(n, 0));
	for (int i = 0; i < n; i++)
		for (int j = 0; j < n; j++)
			x[i][j] = -2 *  v[i] * v[j];
	for (int i = 0; i < n; i++)
		x[i][i] += 1;
 
	return x;
}
 
/* ||x|| */
double vnorm(vd x, int n)
{
	double sum = 0;
	for (int i = 0; i < n; i++) sum += x[i] * x[i];
	return sqrt(sum);
}
 
/* y = x / d */
vd vdiv(vd x, double d, vd& y, int n)
{
	for (int i = 0; i < n; i++) y[i] = x[i] / d;
	return y;
}
 
/* take c-th column of m, put in v */
vd mcol(vdd m, vd& v, int c)
{
	for (int i = 0; i < m.size(); i++)
		v[i] = m[i][c];
	return v;
}
 
void matrix_show(vdd m)
{
	for(int i = 0; i < m.size(); i++) {
		for (int j = 0; j < m[0].size(); j++) {
			printf(" %8.3f", m[i][j]);
		}
		printf("\n");
	}
	printf("\n");
}
 
void householder(vdd m, vdd& R, vdd& Q)
{
	vdd q[m.size()];
	vdd z = m, z1;
	for (int k = 0; k < m.size() && k < m.size() - 1; k++) {
		vd e(m.size()), x(m.size());
		double a;
		z1 = matrix_minor(z, k);
		z = z1;
 
		mcol(z, x, k);
		a = vnorm(x, m.size());
		if (m[k][k] > 0) a = -a;
 
		for (int i = 0; i < m.size(); i++)
			e[i] = (i == k) ? 1 : 0;
 
		vmadd(x, e, a, e, m.size());
		vdiv(e, vnorm(e, m.size()), e, m.size());
		q[k] = vmul(e, m.size());
		z1 = matrix_mul(q[k], z);
		z = z1;
	}
	Q = q[0];
	R = matrix_mul(q[0], m);
	for (int i = 1; i < m[0].size() && i < m.size() - 1; i++) {
		z1 = matrix_mul(q[i], Q);
		Q = z1;
	}
	z = matrix_mul(Q, m);
	R = z;
	matrix_transpose(Q);
}

bool converged(vdd a, vdd prev){
    int m = a.size();
    for(int i = 0; i < m; i++){
        if(abs(a[i][i] - prev[i][i]) > 1e-3)
            return false;
    }
    return true;
}

