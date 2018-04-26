function retval = comptrap(a, b, f, h)
    mid = 0;

    # h = (b-a)/n;

    n = (b-a)/h;
    printf("h = %.10f\n", h);
    for j = 1:n-1
        mid += f(a+j*h);
    endfor
    printf("midpoint sum = %.10f\n", mid);
    fa = f(a);
    fb = f(b);
    printf("f(a) = %.10f\nf(b) = %.10f\n", fa, fb);
    retval = (h/2)*(fa + 2*mid + fb);
    printf("ans = %.10f\n", retval);
endfunction
