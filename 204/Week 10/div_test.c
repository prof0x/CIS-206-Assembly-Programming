#include <stdio.h>
#include <assert.h>
#include "div.h"

int main(){
    assert(div(1,1) == 1); // general case
    assert(div(1,2) == 0); // general case
    assert(div(1,3) == 0); // general case
    assert(div(2,1) == 2); // general case
    assert(div(2,2) == 1); // general case
    assert(div(10,10) == 1); // general case
    assert(div(0, 0) == 0); // edge cases
    assert(div(1, 0) == 0); // edge cases
    assert(div(2, 0) == 0); // edge cases
    assert(div(3, 0) == 0); // edge cases
    assert(div(4, 0) == 0); // edge cases
    assert(div(5, 0) == 0); // edge cases

    printf("All your tests pass!!\n");

    return 0;

}