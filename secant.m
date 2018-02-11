% Thais Minet
% 2/10/18
% Lab 4 - Newton's method & secant method
%
% Usage: newton(2, f, fprime, 10.^(-4), 100)
%
% Input:
% - p0 is the initial approximation
% - p1 is the second initial approximation
% - f is a function
% - tol is the error tolerance for the result
% - nMax is the maximum number of iterations
%
% Output:
% - retval is the result of the approximation


function retval = secant(p0, p1, f, tol, nMax)
    i = 1;
    q0 = f(p0);
    q1 = f(p1);
    p = 0;
    while (i < nMax)
        printf("ITERATION %d\n", i);
        printf("p0 = %f; p1 = %f\n", p0, p1);
        printf("q0 = %f; q1 = %f\n", q0, q1);
        p = p1 - (q1*(p1 - p0)) / (q1 - q0);
        err = abs(p - p1);
        printf("p = %f\nerr = %f\n\n", p, err);
        if (err < tol)
            retval = p;
            printf("ans = %f\n\n", retval);
            return;
        endif
        i++;
        p0 = p1;
        q0 = q1;
        p1 = p;
        q1 = f(p);
    endwhile
    error("ERROR: method failed after %d iterations\n". i);    
endfunction
