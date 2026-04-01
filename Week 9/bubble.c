#include <stdio.h>
#include "bubble.h"

int main() {

    int arr[] = { 5, 4, 3, 2, 1 }; // worst case scenario because we have to reorder every element
    // int arr[] = { 1, 2, 3, 4, 5 };  // best case scenario because array is already sorted
    // int arr[] = { 5, 2, 1, 4, 3 };  // average case scenario
    int n = sizeof(arr)/sizeof(arr[0]);

    // function call
    bubblesort(arr, n); // arguments: arr, n

    return 0;
}

