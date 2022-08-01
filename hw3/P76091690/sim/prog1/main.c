int main(void ){
    extern short  _test_start;
    extern int array_size;
    extern short  array_addr; 
    int i,j;

    for(i=0;i<array_size-1 ;i=i+1){
        for(j=0;j<array_size-1-i;j++){
            if((&array_addr)[j+1]<(&array_addr)[j]){
                (&array_addr)[j+1] ^= (&array_addr)[j];
                (&array_addr)[j] ^= (&array_addr)[j+1];
                (&array_addr)[j+1] ^= (&array_addr)[j];
            }
        }
         (&_test_start)[j] = (&array_addr)[j];
    }
    (&_test_start)[0] = (&array_addr)[0];
    return 0;
}