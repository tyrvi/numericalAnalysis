% Thais Minet
% 1/29/18
% Lab 2 - Bisection Algoritmh
%
% Usage: bisection(@(x) x.^2-3, 1, 2, 10.^-4, 30)
%
% Input:
% - f is a function
% - a is the lower bound of the search interval
% - b is the upper bound of the search interval
% - tol is the error tolerance for the result
% - nMax is the maximum number of iterations
%
% Output:
% - retval is the zero of the function if it can be found in
%   the maximum number of iterations specified

function retval = bisection2(f, a, b, tol, nMax)
    n = 1;
    while (n <= nMax)
        printf("iteration %d\n", n);
        printf("[a, b] = [%.15f, %.15f]\n", a, b);
        c = a + (b - a) ./ 2;
        printf("c = %.15f\n", c);
        err = (b - a) ./ 2;
        printf("f(c) = %.15f err = %.15f\n", f(c), err);
        if (f(c) == 0 | err < tol)
            printf("retval = %.15f\n", c);
            retval = c;
            return;
        endif
        printf("f(a)*f(c) = %.15f\n", f(c).*f(a));
        if (f(c) .* f(a) > 0)
            a = c
        else
            b = c
        endif
        n++;
        printf("\n");
    endwhile
    error("ERROR: method failure");
endfunction
