function retval = quadrature(a, b, f, eps, whole, l)
    global num_evaluations;
    printf("level = %d\n", l);
    c = (a+b) / 2;
    left = simpson(a, c, f);
    right = simpson(c, b, f);
    num_evaluations++;

    if (abs(left + right - whole) <= 15*eps)
        retval = left + right + (left + right - whole)/15;
    else
        retval = quadrature(a, c, f, eps/2, left, l+1) + quadrature(c, b, f, eps/2, right, l+1)
    endif
endfunction
