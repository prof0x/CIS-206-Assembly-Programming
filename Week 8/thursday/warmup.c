#include <stdio.h>

void set_to_ten_by_val(int a, int b);
void set_to_ten_by_ref(int* a, int* b);

int main(){

    int result;
    int firstNum = 3; // reserves memory for 1 int and initializes it to 3
    int secondNum = 5; // reserves memory for 1 int and initializes it to 5
        
    set_to_ten_by_val(firstNum, secondNum);
    printf("%d %d\n", firstNum, secondNum); // 3, 5
    
    set_to_ten_by_ref(&firstNum, &secondNum);
    printf("%d %d\n", firstNum, secondNum); // 10, 10

    return 0;
}

// passed by value (a copy of the value)
void set_to_ten_by_val(int a, int b){

    a = 10;
    b = 10;

}

void set_to_ten_by_ref(int* a, int* b){

    *a = 10;
    *b = 10;

}