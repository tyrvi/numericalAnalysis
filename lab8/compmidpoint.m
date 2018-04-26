function retval = compmidpoint(a, b, f, h)
    # h = (b-a)/(n+2);

    n = (b-a)/h - 2;
    sum = 0;

    printf("h = %.10f\n", h);
    for j = 0:(n/2)
        printf("j = %d | 2*j = %d\nXj = %.10f\n", j, 2*j, a + (2*j+1)*h);
        sum += f(a + (2*j+1)*h);
    endfor

    printf("sum = %.10f\n", sum);
    retval = 2*h*sum;
    printf("ans = %.10f\n\n", retval);
    
endfunction
