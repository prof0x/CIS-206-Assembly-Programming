#include <stdio.h>
// Cantrice Sykes
int main(void) {
    int maxStars;
    int row;
    int asterisk;

    //Keep asking until input is between 2 and 15 */
    do {
        printf("Enter number of stars (2-15): ");
        scanf("%d", &maxStars);
    } while (maxStars < 2 || maxStars > 15);

    // Row starts 1 and keeps increasing by 1 until row becomes greater than maxStars.
    for (row = 1; row <= maxStars; row++) {
        for (asterisk = 0; asterisk < row; asterisk++) {
            printf("*");
        }
        printf("\n");
    }

    // row starts @ maxstars -1 loops until row is equal to or less than1  subtract each loop
    for (row = maxStars - 1; row >= 1; row = row - 1) {
        for (asterisk = 1; asterisk <= row; asterisk++) {
            printf("*");
            }
            printf("\n");
    }

    return 0;
}
