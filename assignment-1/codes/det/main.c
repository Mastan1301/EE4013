#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int sign(int x, int y){
    if((x + y) % 2)
        return -1;
    return 1;
}

int* cofactorMatrix(int* R, int x, int y, int n){
    int* res = (int*)malloc((n - 1) * (n - 1) * sizeof(int));
    
    int ti = 0, tj = 0;
    for(int i = 0; i < n; i++){
        if(i == x)  
            continue;

        for(int j = 0; j < n; j++){
            if(j == y)
                continue;

            *((res + (n - 1) * ti) + tj) = *((R + i * n) + j);
            tj = (tj + 1) % (n - 1);
        }
        ti++;
    }

    return res;
}

int detRecursive(int* R, int n){
    if(n == 1){
        return *R;
    }
    
    int ans = 0;
    for(int j = 0; j < n; j++){
        int* cof = cofactorMatrix(R, 0, j, n);
        ans += sign(0, j) * *((R + n * 0) + j) * detRecursive((int*)cof, n - 1);
    } 
    return ans;  
}

int main(){
    clock_t start, end;
    start = clock();
    int R[][4] = {{1, 2, 4, 8}, 
                  {1, 3, 9, 27}, 
                  {1, 4, 16, 64}, 
                  {1, 5, 25, 125}};

    int n = sizeof(R) / sizeof(R[0]);
    printf("Absolute value of Eigen values:%d\n", abs(detRecursive((int*)R, n)));
    end = clock();
    printf("\nTime taken: %lf ms\n", (1000.0 * (end - start)) / CLOCKS_PER_SEC);
}