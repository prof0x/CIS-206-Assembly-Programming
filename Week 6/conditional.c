#include <stdio.h>

int main(){

    int grade = 90;

    if(grade >= 90)
        printf("You got an A.");
    else if(grade >= 80)
        printf("You got an B.");
    else if(grade >= 70)
        printf("You got an C.");
    else
        printf("You did not get a passing score.");
    

    return 0;
}