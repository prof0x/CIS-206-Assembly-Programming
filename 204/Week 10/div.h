#include <errno.h>

int div(int a, int b);

int div(int a, int b){
    if(b != 0)
        return a / b;
    else{
        errno = EDOM;
        return 0;
    }
}