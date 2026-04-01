// Priscilla Leigh
// Chpt4 PA

#include <stdio.h>

int main (void) {

int inputNum; // Variable for number of astericks input from user
int i;        // Variable for first counter
int j;        // Variable for second counter

printf("Enter an integer between 2 to 15: "); // Prompting user to input appropriate number for astericks
scanf("%d", &inputNum);                       // Saving User input number to inputNum

while(inputNum < 2 || inputNum > 15) { //Not sure how many times the user will input an invalid number, so I have used a while loop
    printf("The number must be between 2 and 15. Please try again: "); //Prompting the user to input a number betwee 2-15 again
    scanf("%d", &inputNum);                                            // Saving User input number to inputNum
}
for (i = 0; i < inputNum; ++i) { // This loop will execute as long as the counter is less than the user input. 
                                 // To ensure that the longest astericks line is only printed once, I am not making this inclusive
    for (j = 0; j < i; ++j) {    // This nested loop uses j as a counter and will execute as long as j is less than i
        printf("*");             // When the inner loop executes, "*" is output
    }
    printf("\n");                // After the inner loop is done executing, a newline will be printed
}
for (i = inputNum; i > 0; --i) { //The counter is assigned with the inputNum to ensure that the inner loop executes the inputNum number of times
    for (j = 0; j < i; ++j) {    // Assigning giving j the value of 0 ensures that the astericks will print inputNum number of times
        printf("*");             // When the inner loop executes, "*" is output
    }
    printf("\n");                // After the inner loop is done executing, a newline will be printed            
}
    return 0;
}