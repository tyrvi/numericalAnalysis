% Thais Minet
% 1/29/18
% Lab 2 - Bisection Algorithm
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

function retval = bisection(f, a, b, tol, nMax)
    n = 1;
    while (n <= nMax)
        printf("iteration %d\n", n);
        c = a + (b - a) ./ 2
        err = (b - a) ./ 2
        if (f(c) == 0 | err < tol)
            retval = c;
            return;
        endif
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
