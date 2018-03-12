function retval = quadrature(f, a, b, t, whole)
    c = (a+b)./2;
    left = ((c-a)./3) * (f(a) + 4*f(a + (c-a)./2) + f(c));
    right = ((b-c)./3) * (f(c) + 4*f(c + (b-c)./2) + f(b));
    if (abs(left + right - whole) <= 15*t)
        Q = left + right + (left + right - whole)/15;
    else
        Q = quadrature(f, a, c, t/2, left) + quadrature(f, c, b, t/2, right);
    endif

    retval = Q;
    %l -= 1;
    %Q = ((b-a)./3) * (f(a) + 4*f(a + (b-a)./2) + f(b));
    % printf("level = %d\nS(%.10f, %.10f) = %.10f\n", l, a, b, Q);
    %[v, ier, nfun, err] = quad(f, a, b, t);
    %eps = abs(Q - v);
    ## if (eps > t & l > 0)
    ##     m = (a+b)./2;
    ##     Q = quadrature(f, a, m, t, l) + quadrature(f, m, b, t, l);
    ## endif
    ## retval = Q;
endfunction
