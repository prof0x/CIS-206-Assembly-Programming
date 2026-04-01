//Alma Rivera
//Chpt4 PA


#include <stdio.h>

int main(void) {
    int maxAsterik; //int of max number of asteriks for top triangle
    int i; // int i for rows
    int j; //int j for columns

    printf("Enter an integer between 2 and 15: "); //ask user for an integer between 2 and 15, this will be set for max. asteriks
    scanf("%d", &maxAsterik);

    //while loop will run when user inputs a number outside of range and will ask to input another number
    while ((maxAsterik < 2) || (maxAsterik > 15)) { 
        printf("The number must be between 2 and 15, please try again: ");
        scanf("%d", &maxAsterik);
    }

    //once number is between range for loops will run
    if ((maxAsterik >= 2) && (maxAsterik <= 15)) {
        for (i = 1; i <= maxAsterik; ++i) { //begin at first row, and row will increment and will reach maximum number user input
            for (j = 1; j <= i; ++j) { //begin at the first column, whatever i is, system will output number of asteriks. and will increment
                printf("*"); //output *
            }
            printf("\n");
        }

        //other half of triangle
        for (i = maxAsterik -1; i >= 1; i--) { //once maximum is reached, rows will start decrementing. i >= 1 since loop will run and stop once it reaches last row of 1 *
            for (j = 1; j <= i; j++) { // depends on value of i. Whatever i is, j will print * 
                printf("*");
            }
            printf("\n");
        }
    }
    return 0; //end of execution 
}