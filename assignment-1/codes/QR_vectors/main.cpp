#include <iostream>
using namespace std;
#include <cstdlib>
#include <ctime>
#include <cmath>
#include <vector>
typedef vector<double> vd; // vd -> 1-D vector of doubles
typedef vector<vector<double>> vdd; // vdd -> 2-D vector of doubles
#include "./utils.hpp"

// Returns a vector of Eigen values
vd qr(vdd x){
    vdd Q, R, prev;
    // Iterate till the diagonal stabilizes
    do{
        householder(x, R, Q);
        vdd Q_T = Q;
        matrix_transpose(Q_T);
        prev = x;
        x = matrix_mul(Q_T, matrix_mul(x, Q));
    }
    while(!converged(x, prev));

    vd eigenValues(x.size());
    for(int i = 0; i < x.size(); i++){
        eigenValues[i] = x[i][i];
    }
    return eigenValues;
}

int main(){
    clock_t start, end;
    start = clock();
    vdd X = {{1, 2, 4, 8}, 
            {1, 3, 9, 27}, 
            {1, 4, 16, 64}, 
            {1, 5, 25, 125}};

    vd eigenValues = qr(X);

    printf("Eigen Values: ");
    double res = 1.0;
    for(int i = 0; i < eigenValues.size(); i++){
        cout << eigenValues[i] << " ";
        res *= eigenValues[i];
    }
    cout << "\nAbsolute value of the product: " << (double)abs(res) << "\n";
    end = clock();
    cout << "\nTime taken: " << (1000.0 * (end - start)) / CLOCKS_PER_SEC << "ms\n";

    return 0;
}