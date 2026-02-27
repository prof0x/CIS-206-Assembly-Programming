#include <stdio.h>
#include <stdbool.h>

int main(){
    int TrueInt = 1;
    int FalseInt = 0;

    bool TrueBool = true;
    bool FalseBool = false;

    if(TrueInt == TrueBool){
        printf("1 (int) is equivalent to True (bool)\n");
    }

    return 0;
}