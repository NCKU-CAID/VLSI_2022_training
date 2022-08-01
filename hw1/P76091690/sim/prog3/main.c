unsigned int GCD(unsigned int u, unsigned int v) {
    if (u == v)
        return u;
    if (u == 0)
        return v;
    if (v == 0)
        return u;
    if (!(u & 1)) { 
        if (v & 1)
            return GCD((u >> 1), v);
        else
            return (GCD((u >> 1), (v >> 1))) << 1;
    } else {
        if (!(v & 1))
            return GCD(u, (v >> 1));
        if (u > v)
            return GCD(((u - v) >> 1), v);
        else
            return GCD(((v - u) >> 1), u);
    }
}
int main (void) {
    extern int _test_start;
    extern int div1, div2;
    int res;
    res = GCD(div1, div2);
    (&_test_start)[0] = res;
    return 0;
}