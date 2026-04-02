#include <stdio.h>

// intention is to swap the values of x and y                           // The call stack lives in your RAM
void swap(int a, int b){ 
    // int a
    // int b                                                            // ┌─────────────────────────┐​ 
    int temp = a;                                                       // │ swap() scope            │
    a = b;                                                              // │ a = 2  // 4-bytes       │
    b = temp;                                                           // │ b = 1  // 4-bytes       │
}                                                                       // │ temp = 1                │ 
                                                                        // │ return address → back   │
                                                                        // │ to main()               │​    
int main(){                                                             // ├─────────────────────────┤← top of stack
    int a = 1;                                                          // │ main() scope            │
    int b = 2;                                                          // │ a = 1  // 4-bytes       │
                                                                        // │ b = 2  // 4-bytes       │
    printf("a (before): %d\n", a); // 1                                 // │ return address → OS     │
    printf("b (before): %d\n\n", b); // 2                               // └─────────────────────────┘ ← bottom of stack
    
    swap(a, b); // pass by value (primitive types only - int, float, double, bool, char)
    
    printf("a (after): %d\n", a); // 1 // same
    printf("b (after): %d\n", b); // 2 // same

    return 0;
}

// ************************************************************************************
// ANOTHER FILE
// ************************************************************************************

// void swap(int *a, int *b){ // a = 1; // b = 2;                          // ┌─────────────────────────┐​ 
//    int temp = *a;                                                       // │ swap() scope            │
//     *a = *b;                                                            // │ a = 0x0100              │
//     *b = temp;                                                          // │ b = 0x0104              │
//                                                                         // │ temp = 0x0108           │                                                                       // │ temp = 1                │ 
// }                                                                       // │ return address → back   │
//                                                                         // │ to main()               │​    
// int main(){                                                             // ├─────────────────────────┤← top of stack
//     int a = 1;                                                          // │ main() scope            │
//     int b = 2;                                                          // │ a = 0x0100              │
//                                                                         // │ b = 0x0104              │
//     printf("a (before): %d\n", a); // 1                                 // │ return address → OS     │
//     printf("b (before): %d\n\n", b); // 2                               // └─────────────────────────┘ ← bottom of stack
    
//     (swap(&a, &b)); // pass by reference (a memory address)

    
//     printf("a (after): %d\n", a); // 2 // swapped
//     printf("b (after): %d\n", b); // 1 // swapped

//     return 0;
// }



