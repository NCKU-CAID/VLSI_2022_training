int gcd(int m, int n) {
	int r;
	while(m != n) {
		if(m > n)
		    m = m - n;
		else
			n = n - m;
	}
	return m;
}

int main(void)
{
	extern int div1;
	extern int div2;
	extern int _test_start;

	int result = gcd(div1, div2);
	(&_test_start)[0] = result;

	return 0;
}
