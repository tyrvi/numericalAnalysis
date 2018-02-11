% Thais Minet
% 2/10/18
% Lab 4 - Newton's method & secant method
%
% Usage: newton(2, f, fprime, 10.^(-4), 100)
%
% Input:
% - p0 is the initial approximation
% - f is the function which we are trying to find the root of
% - fprime is the derivative of f
% - tol is the error tolerance for the result
% - nMax is the maximum number of iterations
%
% Output:
% - retval is the result of the approximation


function retval = newton(p0, f, fprime, tol, nMax)
    i = 0;
    p = 0;
    while (i < nMax)
        printf("ITERATION %d\n", i);
        p = p0 - f(p0) ./ fprime(p0);
        err = abs(p - p0);
        printf("p = %f\nerr = %f\n", p, err);
        if (err < tol)
            retval = p;
            printf("\nans = %f\n\n", retval);
            return;
        endif
        i++;
        p0 = p;
        printf("p0 = %f\n\n", p0);
    endwhile
    error("ERROR: method failed after %d iterations\n". i);    
endfunction
