function retval = compsimpson(a, b, f, n)
    h = (b-a)/n;
    printf("h = %.10f\n", h);
    
    even = 0;
    odd = 0;

    for j = 1:n-1
        if (mod(j, 2) == 0)
            even += f(a+j*h);
        else
            odd += f(a+j*h);
        endif
    endfor

    fa = f(a);
    fb = f(b);
    printf("f(a) = %.10f\nf(b) = %.10f\n", fa, fb);
    printf("even sum = %.10f\nodd sum = %.10f\n", even, odd);
    retval = (h/3)*(fa + 2*even + 4*odd + fb);
    printf("ans = %.10f\n", retval);
    
endfunction
