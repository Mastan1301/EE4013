#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <stdbool.h>
#include <time.h>
#include "./utils.h"

// Returns a pointer to the array of Eigen values
double* qr(mat x){
    mat Q, R, prev;
    // Iterate till the diagonal stabilizes
    do{
        householder(x, &R, &Q);
        mat Q_T = matrix_clone(Q);
        matrix_transpose(Q_T);
        prev = x;
        x = matrix_mul(Q_T, matrix_mul(x, Q));
    }
    while(!converged(x, prev));

    matrix_delete(Q);
    matrix_delete(R);

    double* eigenValues = (double*) malloc(x->n * sizeof(double));
    for(int i = 0; i < x->n; i++){
        eigenValues[i] = at(x->head, i, i)->val; // Eigen values are the diagonal entries
    }
    return eigenValues;
}

int main(){
    clock_t start, end;
    start = clock();
    double R[][4] = {{1, 2, 4, 8}, 
                    {1, 3, 9, 27}, 
                    {1, 4, 16, 64}, 
                    {1, 5, 25, 125}};

    mat x = matrix_copy((double*)R, 4, 4);
    int n = sizeof(R) / sizeof(R[0]);
    double* eigenValues = qr(x);

    printf("Eigen Values: ");
    double res = 1.0;
    for(int i = 0; i < n; i++){
        printf("%lf ", eigenValues[i]);
        res *= eigenValues[i];
    }
    printf("\nAbsolute value of the product: %lf\n", (double)abs(res));
    end = clock();
    printf("\nTime taken: %lf ms\n", (1000.0 * (end - start)) / CLOCKS_PER_SEC);
    
    return 0;
}