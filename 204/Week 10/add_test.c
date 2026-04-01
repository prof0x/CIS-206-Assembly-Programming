#include <stdio.h>
#include <assert.h>
#include "add.h"

int main(){
    assert(add(0, 0) == 0); // edge cases
    assert(add(10,10) == 20); // general case

}