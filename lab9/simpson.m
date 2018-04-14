function retval = simpson(a, b, f)
    c = (a+b) ./ 2;
    h3 = abs(b-a) ./ 6;
    ret = h3*(f(a) + 4*f(c) + f(b));
    % printf("S(%0.10f, %0.10f) = %0.15f\n", a, b, ret);
    retval = ret;    
endfunction
