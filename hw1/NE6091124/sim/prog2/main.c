int main(void){

    extern int mul1;
    extern int mul2;
    extern int _test_start;

    int high, low, i;
    long long int a, b, result;

    if(mul1 > 0)
        a = mul1;
    else
        a = 0xffffffff00000000 | mul1;

    if(mul2 > 0)
        b = mul2;
    else
        b = 0xffffffff00000000 | mul2;

    result = a * b;

    low = result;
    high = result >> 32;

    (&_test_start)[0] = low;
    (&_test_start)[1] = high;

    return 0;
}
