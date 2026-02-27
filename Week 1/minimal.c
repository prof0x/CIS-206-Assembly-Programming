#include <stdio.h>
int main(){
    char var1[100];
    int var2;
    scanf("%s", var1);
    scanf("%d", &var2);
    int var3 =  (1013 << 1);
    int var4 = var3 - var2;


    printf("%s %d\n", var1, var4);

    return 0;
}