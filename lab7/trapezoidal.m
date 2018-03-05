function retval = trapezoidal(f, x0, x1)
    h = x1 - x0
    f0 = f(x0)
    f1 = f(x1)
    retval = (h/2)*(f(x0) + f(x1));
    printf("ans = %.10f\n", retval);
    return;
endfunction
