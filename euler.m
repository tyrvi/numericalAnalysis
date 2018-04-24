function [w, t] = euler(a, b, f, alpha, n)
    h = (b - a) / n
    t(1, 1) = a;
    w(1, 1) = alpha;

    for i = 1:n
        w(i+1, 1) = w(i, 1) + h*f(t(i, 1), w(i, 1));
        t(i+1, 1) = a + i*h;
    end

    t
    w
    
endfunction
