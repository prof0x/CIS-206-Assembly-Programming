// in C our strategy is simple
    int a = 89;
    printf("%d", a);

    // in ASM we have to convert each digit to it's ascii value before we print

    int index = 2;
    char buffer[3];
    buffer[2] = '\0';
    
    int c = 89;
    int quotient = c;
    int remainder;

    do {
        int divisor = 10;
        int temp = quotient;
        quotient = temp/divisor;
        remainder = temp % divisor;
        buffer[index-1] = remainder + '0';
        index--;
    } while (quotient > 0);
    
    printf("%s\n", buffer);