// Jonathan Falvo
//Chpt4 PA

#include <stdio.h>

int main(){

int astPrompt;                                                      // Number for Asterisk Triangle
int o;                                                              // o is our outer loop ascending
int i;                                                              // i is our inner loop ascending
int od;                                                             // od is our outter loop descending
int id;                                                             // id is our inner loop descending

printf("Enter an integer that is between 2 and 15: ");              // Initial Prompt
scanf("%d", &astPrompt);                                            // First input for a number

while(astPrompt < 2 || astPrompt > 15) {                            // Loop for catching invalid numbers
    printf("The number must be between 2 and 15, please try again: ");
    scanf("%d", &astPrompt);
}
                                                                    // Triangle Building Begins
for(o = 0; o < astPrompt; ++o) {                                    // Outer Loop Ascending *Footnote 1*
    for(i = 0; i <= o; i++) {                                       // Inner Loop Ascending *Footnote 2*
        printf("*");
    }
    printf("\n");
}
for(od = astPrompt - 1; od >= 1; --od) {                            // Outer Loop Descending *Footnote 3*
    for(id = 1; id <= od; ++id) {                                   // Inner Loop Descending *Footnote 4
        printf("*");
    }
    printf("\n");
}
return 0;
}

/*  1. for(o = 0; o < astPrompt; ++o) { // With our opening or outer beginning loop, what we see is 
      int o starting at 0. This is iteration 1. We then want o to be less than the number we had the user input 
      so that the triangle isn't bigger or smaller than the number of astPrompt. Of course, ++o is so that we 
      can keep incrementing until o reaches the number of astPrompt.

    2. for(i = 0; i <= o; i++) { // Our next loop, i = 0 so that we can start at 1 again. i is going to
      be less than or equal to o so that each iteration of this eventually prints a larger amount than the last
      iteration. We want to also increment i each time.

    3. for(od = astPrompt - 1; od >= 1; --od) { // We see that od will then equal our max value that was input
      by the user. However, because we want to now decrease it, we want to subtract it by 1 for each pass through.
      At the base of the triangle, we do still want to print an asterisk so od >= 1 will print that asterisk at
      the base once we get there.

    4. for(id = 1; id <= od; ++id) { // What we see here is that id is going to be starting at 1. It starts at
      1 because it needs to print the exact number of stars as what the outer loop allows. Essentially, id = 1
      means that it will match with od's number. In turn, id <= od means that the value is descending so that
      we are getting less stars on the remaining rows. ++id prevents us from reaching an infinite loop. The ++
      increment allows us to eventually reach od so that the program will eventually end. */