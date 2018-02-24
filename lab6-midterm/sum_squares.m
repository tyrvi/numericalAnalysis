% Thais Minet
% 2/24/18
% Lab 6 - midterm exam
%
% Usage: sum_squares(cmax)
%
% Input:
% - cmax maximum iteration
%
% Output:
% - sum is the result of the approximation

function sum = sum_squares(cmax)
    if (cmax > 0 & cmax < 40)
        sum = 0;
        count = 1;
        while (count <= cmax)
            printf("count = %d\n", count);
            root = sqrt(count);
            diff = root - floor(root);
            printf("root = %f\ndiff = %f\n", root, diff);
            if (diff == 0)
                sum += count;
            endif
            printf("sum = %f\n\n", sum);
            count++;
        endwhile
        return;
    else
        error("ERROR: method failed cmax must be between 0 and 40");
        return;
    endif
endfunction

% This is a lot quicker O(1) compared to O(n)
## function sum = sum_squares(cmax)
##     if (cmax > 0 & cmax < 40)
##         n = floor(sqrt(cmax));
##         sum = (n*(n+1)*(2*n+1))/6;
##     else
##         error("ERROR: method failed cmax must be between 0 and 40");
##         return;
##     endif
## endfunction
