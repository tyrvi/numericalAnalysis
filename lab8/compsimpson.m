function retval = compsimpson(a, b, f, n)
    h = (b-a)/n;
    printf("h = %.10f\n", h);
    
    even = 0;
    odd = 0;

    for j = 1:n-1
        if (mod(j, 2) == 0)
            printf("Even: a + j*h = %.5f + %d * %.5f = %.15f\n", a, j, h, a+j*h);
            printf("f(a + j*h) = %.15f\n\n", f(a+j*h));
            
            even += f(a+j*h);
        else
            printf("Odd: a + j*h = %.5f + %d * %.5f = %.15f\n", a, j, h, a+j*h);
            printf("f(a + j*h) = %.15f\n\n", f(a+j*h));
            
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
