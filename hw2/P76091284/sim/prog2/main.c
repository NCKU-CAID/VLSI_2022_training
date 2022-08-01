int ripple(int a0,int a1,int *sum){
    int carry = 0;
    int total = 0;
    int i;
    for(i = 0; i < 32; i++){
        int bit0 = (a0 >> i) & 1;
        int bit1 = (a1 >> i) & 1;
        int sum_bit = bit0 ^ bit1 ^ carry;
        carry = (bit0 & bit1) | (bit0 & carry) | (bit1 & carry);
        total  = total + (sum_bit << i);
    }
    *sum = total;
    return carry;
}
int sign_detect(int num, int *sign){
    if(num >= 0){
        *sign = 1;
        return num;
    }
    else{
        *sign = 0;
        return (~num + 1);
    }
}

int main(void){
    extern int mul1;
    extern int mul2;
    // extern long long  mul1;
    // extern long long  mul2;

    extern int _test_start;
    int high, low, i, j;
    int mp_sign=1, mc_sign=1;

    int multiplier = sign_detect(mul1, &mp_sign);
    int multiplicand = sign_detect(mul2, &mc_sign);

    for(i=0;i<32;i++){
        if(multiplicand & 1){
            int carry = 0;
            int tmp = multiplier << i ;
            carry = ripple(low, tmp, &low);
            int y = i==0 ? 0: multiplier >> (32-i);
            high = high + y + carry;
        }
        multiplicand = multiplicand >> 1;
    }
    if(mp_sign ^ mc_sign){
        high = ~high;
        low = ~low;
        int carry = ripple(low,1,&low);
        high = high + carry;
    }

    /*
    long long mul1_1, mul2_1;

    mul1_1 = mul1 << 32;
    mul1_1 = mul1_1 >> 32;

    mul2_1 = mul2 << 32;
    mul2_1 = mul2_1 >> 32;

    long long product = mul1_1 * mul2_1;

    int low  = product;
    int high = product >> 32;
    */
    (&_test_start)[0] = low;
    (&_test_start)[1] = high;

    return 0;
}

