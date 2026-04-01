#include <stdio.h>

typedef struct {
    char name[256];   // 256 byte char array
    long age;         // 64 bit integer (8 byte int)
} student;

int main(){
    student s1 = {"Gerret", 18};
    printf("%s %ld\n", s1.name, s1.age);
}