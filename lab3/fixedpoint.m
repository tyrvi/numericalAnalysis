% Thais Minet
% 1/31/18
% Lab 3 - Fixed-point iteration
%
% Usage: fixedpoint(@(x) (x + 1).^(1/3), 1, 10.^-2, 100)
%
% Input:
% - f is a function
% - p0 is the initial approximation
% - tol is the error tolerance for the result
% - nMax is the maximum number of iterations
%
% Output:
% - retval is the fixed point approximation for the function if it 
%   can be found in the maximum number of iterations specified

function retval = fixedpoint(g, p0, tol, nMax)
    i = 1;
    while (i <= nMax)
        printf("\nITERATION %d\n", i);
        printf("p0 = %f\n", p0);
        p = g(p0);
        err = abs(p-p0);
        printf("p = %f\nerr = %f\n", p, err);
        if (err < tol)
            retval = p;
            printf("\nans = %f\n\n", retval);
            return;
        endif
        i++;
        p0 = p;
    endwhile
    error("ERROR: method failed after %d iterations\n", i);
endfunction
