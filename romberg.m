function retval = romberg(a, b, f, n)
    h = (b-a) ./ (2.^(0:n-1));
    h

    R(1,1) = ((b-a)/2) * (f(a) + f(b));
    printf("R(1, 1) = %.10f\n", R(1,1));
    for j = 2:n
        sum = 0;
        printf("\nh = %.10f\n", h(j));
        for i = 1:2.^(j-2)
            printf("X%d = %.10f\nf(X%d) = %.10f\n", i, a + (2*i - 1) * h(j), i, f(a + (2*i - 1) * h(j)));
            sum += f(a + (2*i - 1) * h(j));
        endfor

        R(j,1) = R(j-1, 1)/2 + h(j)*sum;
        printf("R(%d, 1) = (1/2)*R(%d, 1) + h*(f(Xi))\n", j, j-1);
        printf("R(%d, 1) = %.10f\n", j, R(j,1));
        for k = 2:j
            R(j,k) = (4.^(k-1) * R(j,k-1) - R(j-1, k-1)) ./ (4.^(k-1) - 1);
            printf("R(%d, %d) = R(%d, %d) + (1/%d)(R(%d, %d) - R(%d, %d))\n", j, k, j, k-1, 4.^(k-1) - 1, j, k-1, j-1, k-1);
            printf("R(%d, %d) = %.10f\n", j, k, R(j, k));
        endfor

    endfor
    R
    retval = R(n,n);
endfunction
