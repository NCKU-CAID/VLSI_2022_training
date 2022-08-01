int main(void ){
	
	extern int _test_start;
	extern int array_size;
	extern int array_addr;
	int i, j, temp;

	for(i = 0; i < array_size - 1; i++){
		for(j = i + 1; j < array_size; j++){
			if((&array_addr)[i] > (&array_addr)[j]){
				temp = (&array_addr)[i];
				(&array_addr)[i] = (&array_addr)[j];
				(&array_addr)[j] = temp;
			}
		}
		(&_test_start)[i] = (&array_addr)[i];
	}
	(&_test_start)[i] = (&array_addr)[i];

	return 0;
}
