#include <stdio.h>

int main(){

    int result = 0;
    result = sum(1, 2, 3, 4, 5, 6);
    return 0;
}

int add6(int a, int b, int c, int d, int e, int f){
    // a would be stored in rdi
    // b would be stored in rsi
    // c would be stored in rdx
    // d would be stored in rcx
    // e would be stored in r8
    // f would be stored in r9
    
    printf("%d %d %d %d %d %d\n", a, b, c, d, e, f);
    int sum_value = a+b;
    return sum_value; // return value is stored in rax
}