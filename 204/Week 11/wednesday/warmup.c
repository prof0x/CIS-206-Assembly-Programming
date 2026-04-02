#include <stdio.h>
#include "swap/swap.h"
#include "copy.h"

int main(){
    int a = 1; // a becomes a handle to some place in memory
    int b = 2; // b "

    // WARMUP pt. 1: write a function that "pretends" to swap a & b
    // WARMUP pt. 2: modify your function definition and function call 
    //               so that it actually performs the swap
    swap(&a, &b); // swap(0x100A, 0x100F)

    printf("a=%d\n", a); // a=2 
    printf("b=%d\n", b); // b=1 

    unswap(&a, &b); // swap(0x100A, 0x100F)

    copy();

    printf("a=%d\n", a); // a=2 
    printf("b=%d\n", b); // b=1 
}
