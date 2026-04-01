#include <stdio.h>
#include <stdlib.h>

long long fibonacci(int n){
    if (n <=1)
        return n;

    return fibonacci(n-1) + fibonacci(n-2);
}

int main(){
    int n = 173900;
    printf("fib(%d) == %lld\n", n, fibonacci(n));
    return 0;
}