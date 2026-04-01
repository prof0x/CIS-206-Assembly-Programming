#include <stdio.h>

int main()
{
    int Num;
    int i;
    int j;
    
    printf("Enter and integer between 2 and 15: ");
    scanf("%d", &Num);
    
    while ((Num < 2) || (Num > 15)) {
        printf("\nEnter and integer between 2 and 15, please try again: ");
        scanf("%d", &Num);
    }
    
    for (i = 1; i <= Num; i++) {
        printf("\n");
        
        for (j = 1; j <= i; j++) {
            printf("* ");
        }
        
    }
    printf("\n");
    
    for (i = Num - 1; i > 0; i--) {
       
       for (j = i; j > 0; j--) {
           printf("* ");
       }
       printf("\n");
   }
    
    return 0;
}