
int mul(int a, int b){
  int sign = 1;
  if(a < 0){
    sign = -sign;
    a = -a;
  }
  if(b < 0){
    sign = -sign;
    b = -b;
  }
  int sum = 0;
	while (a) {
		if (a & 1 == 1)
			sum = sum + b;
		a = a >> 1;
		b = b << 1;
	}
  if(sign < 0)
    return -sum;
  return sum;
}

int main(void){
  extern int array_size_i;
  extern int array_size_j;
  extern int array_size_k;
  extern short array_addr;
  extern int _test_start;

  int i, j, k;
  int ans;
  int index_a, index_b, index_c;
  int initial_a, initial_b;

  index_c = 0;
  initial_a = 0;
  initial_b = mul(array_size_i, array_size_k);

  for(i = 0; i < array_size_i; i++){
    for(j = 0; j < array_size_j; j++){
      ans = 0;
      index_a = initial_a;
      index_b = initial_b + j;
      for(k = 0; k < array_size_k; k++){
        ans = ans + mul((&array_addr)[index_a], (&array_addr)[index_b]);
        index_a = index_a + 1;
        index_b = index_b + array_size_j;
      }
      (&_test_start)[index_c] = ans;
      index_c = index_c + 1;
    }
    initial_a = initial_a + array_size_k;
  }

  return 0;
}
