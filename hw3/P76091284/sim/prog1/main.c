int main(void) {
  extern int array_size;
  extern short array_addr;
  extern short _test_start;

    int i,j;

    for(i=0;i<array_size-1 ;i=i+1){
        int swap = 1;
        for(j=0;j<array_size-1-i;j++){
            if((&array_addr)[j+1]<(&array_addr)[j]){
                swap = 0;
                (&array_addr)[j+1] ^= (&array_addr)[j];
                (&array_addr)[j] ^= (&array_addr)[j+1];
                (&array_addr)[j+1] ^= (&array_addr)[j];
            }
        }
        if(swap) break;
    }
    for(i=0;i<array_size;i++){
        (&_test_start)[i] = (&array_addr)[i];
    }
    return 0;
}
