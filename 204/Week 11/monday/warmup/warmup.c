#include <stdio.h>
#include "diffUserInput.h" // contains function prototype and links to function definitions

int main(){
                 // function call
    int result = diffUserInput();

    printf("The difference between your highest and lowest numbers is %d.\n", result);
    
    return 0;
}