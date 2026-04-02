#include <stdio.h>
#include "swap/swap.h"

void copy();
void copySwap();

void copy(){
    printf("copy()");
}

void copySwap(){
    int a = 2;
    int b = 4;
    swap(&a, &b);
}