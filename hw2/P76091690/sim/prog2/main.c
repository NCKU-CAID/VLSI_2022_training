int signmul (int x, int *flag) {
    int res;
    if (x < 0) {
        res = ~x + 1;
        *flag = 1;
    }
    else {
        res = x;
        *flag = 0;
    } 
    return res;
}

int main(void) {
    extern int mul1;
    extern int mul2;
    extern int _test_start;
    int ans1 = 0, ans0 = 0;
    int mcand, mul;
    int m1, m2;
    int pprod = 0;
    int carry = 0;

    mcand = signmul(mul1, &m1);
    mul   = signmul(mul2, &m2);

    int a = 0, b = 0, cout = 0, s = 0;
    int tmp = 0;
    int i = 0, j = 0;
    for(i = 0; i < 32; i++){
        if(mul & 1){
            pprod = mcand << i ;          
            cout = 0;
            for (j = 0; j < 32; j++) {
                a = (pprod >> j) & 1;
                b = (ans0 >> j) & 1;
                s = a ^ b ^ cout;
                cout = (a & b) | (a & cout) | (b & cout);
                tmp = tmp + (s << j);
            }
            ans0 = tmp;
            int other = 0;
            if (i != 0)
                other = mcand >> (32 - i);
            ans1 = ans1 + cout + other;
            tmp = 0;
        }
        mul = mul >> 1;
    }
    if(m1 ^ m2) {
        ans1 = ~ans1;
        ans0 = ~ans0;
        tmp  = 0;
        a = ans0 & 1;
        s = a ^ 1 ^ 0;
        cout = a & 1;
        tmp = tmp + s;
        for(j = 1; j < 32; j++){
            a = (ans0 >> j) & 1;
            s = a ^ 0 ^ cout;
            cout = a & cout;
            tmp  = tmp + (s << j);
        }
        ans0 = tmp;
        ans1 = ans1 + cout;
    }

    (&_test_start)[0] = ans0;
    (&_test_start)[1] = ans1;
    return 0; 
}
/*
long long signext(int x) {
    if (x & 0x80000000)
        return 0xffffffff80000000 | x;
    else 
        return x;
}

int main(void){
    extern int mul1;
    extern int mul2;
    extern int _test_start;
    int ans0, ans1;
    long long a, b, res;

    a = signext(mul1);
    b = signext(mul2);
    res = a * b;
    ans0 = res & 0x00000000ffffffff;
    ans1 = res >> 32;

    (&_test_start)[0] = ans0;
    (&_test_start)[1] = ans1;
    return 0; 
}
*/

