int main(void){

    extern int div1;
    extern int div2;
    extern int _test_start;
    int temp;

    while(div2 != 0){
        if(div1 < div2){
            temp = div1;
            div1 = div2;
            div2 = temp;
        }
        else {
            temp = div1;
            div1 = div2;
            div2 = temp - div1;
        }
    }
    (&_test_start)[0] = div1;

    return 0;
}