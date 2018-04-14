function extrapolation(N1, f, h, x0, n)
    R(1, 1) = N1(f, h, x0); % (f(x0+h) - f(x0-h)) / (2*h);

    for i = 1:n
        printf("i = %d\n", i);
        R
        printf("\n");
        h = h/2;

        R(i+1, 1) = N1(f, h, x0); % (f(x0+h) - f(x0-h)) / (2*h);

        for j = 1:i
            printf("j = %d\n", j);
            printf("(4^%d * R(%d, %d) - R(%d, %d)) / (4^%d - 1)\n", j,i+1, j, i, j, j);
            R(i+1, j+1) = (4.^j * R(i+1, j) - R(i, j)) ./ (4.^j - 1);
            R
        end
    end
    R
    printf("ans = %.10f\n", R(n, n));
    retval = R(n, n);
endfunction
