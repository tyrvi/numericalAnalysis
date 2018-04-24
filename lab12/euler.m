function [w, t] = euler(a, b, f, alpha, h)
    h
    n = (b - a) / h
    % h = (b - a) / n
    t(1, 1) = a;
    w(1, 1) = alpha;

    printf("t0 = %.15f \tw0 = %.15f\n\n", t(1, 1), w(1, 1));

    for i = 1:n
        w(i+1, 1) = w(i, 1) + h*f(t(i, 1), w(i, 1));
        t(i+1, 1) = a + i*h;
        printf("t%d = %.15f \tw%d = %.15f\n", i, t(i+1, 1), i, w(i+1, 1));
    end

    t;
    w;
    
endfunction

