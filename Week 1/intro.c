#include <stdio.h>

int main(void){
    // char x = 42;
        
    __asm__ (
        "movl $42, %0"
        : "=r" (x)
    );

    printf("%d\n",  x/0);
    return 0;
}