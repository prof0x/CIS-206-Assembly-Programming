// function prototype
void bubblesort(int *arr, int n);

// function definition / declaration
void bubblesort(int *arr, int n){ // parameters: int *arr, int n
    int count = 0;
    int comparisons = 0;
    int total_swaps = 0;

    for(int i = 0; i < n-1; i++) {
        int swaps = 0;

        for(int j = 0; j < n - 1 - i; j++){
           // if the left side is greater (ascending sort)
            if(arr[j] > arr[j+1]){
                // swap them
                int temp = arr[j];
                arr[j] = arr[j+1];
                arr[j+1] = temp;
                swaps++;
           }
           comparisons++;

        }

        count++;
        total_swaps += swaps;
        if(swaps == 0)
            break;

    }

    for(int i = 0; i < n; i++){
        printf("%d, ", arr[i]);
    }

    printf("\nTotal loops: %d\n", count);
    printf("Total comparisons: %d\n", comparisons);
    printf("Total swaps: %d\n", total_swaps);

    return; // return without any value
}