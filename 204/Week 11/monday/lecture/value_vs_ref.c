#include <stdio.h>

// a function is limited to modifying variables in it's own scope (by default)
void swap_by_value(int a, int b){                          
   int temp = a;                                                        
    a = b;                                                              
    b = temp;          
    
    printf("a (swapped in swap_by_value): %d\n", a); // 1 // same
    printf("b (swapped in swap_by_value): %d\n\n", b); // 2 // same
}

// unless you give it the memory address of a variable outside of its scope
void swap_by_reference(int *a, int *b){                         
   int temp = *a;                                                       
    *a = *b;                                                            
    *b = temp;

    printf("a (swapped in swap_by_reference): %d\n", *a); // 2 // swapped
    printf("b (swapped in swap_by_reference): %d\n\n", *b); // 1 // swapped
}                                                                           
                                                                        
                                                                        
int main(){                                                             
    int a = 1;                                                          
    int b = 2;                                                          
                                                                        
    printf("a (original): %d\n", a); // 1                                 
    printf("b (original): %d\n\n", b); // 2                               
    
    swap_by_value(a, b); // pass by value (primitive types only - int, float, double, bool, char)
    
    printf("a (but the same in main after swap_by_value): %d\n", a); // 1 // same
    printf("b (but the same in main after swap_by_value): %d\n\n", b); // 2 // same
    
    swap_by_reference(&a, &b); // pass by reference (memory address)
    
    printf("a (still swapped in main after swap_by_reference): %d\n", a); // 2 // swapped
    printf("b (still swapped in main after swap_by_reference): %d\n", b); // 1 // swapped

    return 0;
}



