#include <stdio.h>
#include <stdbool.h>
#include "diffUserInput.h"

// function definition / declaration
int diffUserInput(){
    int userNumber; 
    int difference = 0;
    int highest = 0;
    int lowest = 0;

    do {
        printf("Please enter any whole number (99 to exit): ");
        scanf("%d", &userNumber);
        
        // 99 is our exit condition
        if(userNumber == 99){
            break;
        }

        if(userNumber > highest)
            highest = userNumber;
        else if(userNumber < lowest)
            lowest = userNumber;

        difference = highest - lowest;        

    } while(true);

    return difference;
}