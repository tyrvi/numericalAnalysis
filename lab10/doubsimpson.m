function retval = doubsimpson(f, a, b, c, d, m, n)
    h = (b-a)/n;
    j1 = 0;
    j2 = 0;
    j3 = 0;

    for i = 0:n
        x = a + i*h;
        hx = (d(x) - c(x))/m;
        k1 = f(x, c(x)) + f(x, d(x));
        k2 = 0;
        k3 = 0;
        for j = 1:(m-1)
            y = c(x) + j*hx;
            q = f(x, y);
            if (mod(j, 2) == 0)
                k2 += q;
            else
                k3 += q;
            endif
        end
        l = (k1 + 2*k2 + 4*k3) * (hx/3);
        if (i == 0 || i == n)
            j1 = j1+l;
        elseif (mod(i, 2) == 0)
            j2 += l;
        else
            j3 += l;
        endif        
    end
    j = (h/3)*(j1 + 2*j2 + 4*j3);
    retval = j;
endfunction
