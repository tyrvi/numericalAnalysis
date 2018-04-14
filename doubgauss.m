%doublegauss
%performs Gaussian Quadrature on a double integral
%arguments are the function, the constant limits of integration, the functional limits of integration and positive intgers
%m,n<6. (This means my implementation has degree of accuracy (precision) 9.)

function J = doubgauss(func, a, b, cx, dx, m, n)

    if max(m,n)>5               %by adding more information for r and c below, you can make this higher, i.e. get better precision.
        error('Last two arguments may be at most 5.')
    else
        

        
        r=zeros(5,5);               %creating a matrix with the Legendre polynomial roots in position (n,i)
        r(2,1)=.5773502692;         %clearly, this is easily extended to higher degree precision by simply looking up the appropriate information
        r(2,2)=-.5773502692;
        r(3,1)=.7745966692;
        r(3,3)=-.7745966692;
        r(4,1)=.8611363116;
        r(4,2)=.3399810436;
        r(4,3)=-.3399810436;
        r(4,4)=-.8611363116;
        r(5,1)=.9061798459;
        r(5,2)=.5384693101;
        r(5,4)=-.5384693101;
        r(5,5)=-.9061798459;

        c=zeros(5,5);           % creating a matrix with the optimal coefficients obtained by integrating a Lagrande coefficient over the interval (-1,1)
        c(2,1)=1;
        c(2,2)=1;
        c(3,1)=.5555555556;
        c(3,2)=.8888888889;
        c(3,3)=.5555555556;
        c(4,1)=.3478548451;
        c(4,2)=.6521451549;
        c(4,3)=.6521451549;
        c(4,4)=.3478548451;
        c(5,1)=.2369268850;
        c(5,2)=.4786286705;
        c(5,3)=.5688888889;         
        c(5,4)=.4786286705;
        c(5,5)=.2369268850;

        J=0;
        h1=(b-a)/2;             % the short hand for the change of variables
        h2=(b+a)/2;

        for i=1:m
            JX=0;
            x=h1*r(m,i)+h2;     % change of variables to use the Legendre roots
            c1=cx(x);           % the limits of the inner integral differ for each outer integral node
            d1=dx(x);
            k1=(d1-c1)/2;       % the short hand for the change of variables, these change with every outer integral node
            k2=(d1+c1)/2;
            for j=1:n
                y = k1*r(n,j)+k2;           % change of variables given our choice of node for x
                JX=JX+c(n,j)*func(x,y);     % computing the approximation for the integral with respect to y given a fixed x, the change of measure (multiplying by k1) is held until after the sum (reduces multiplications)
            end
            J=J+c(m,i)*k1*JX;       % Now update the approximation for this x node and move the next x-node. (here the change of measure applied (k1)) 
        end
        J=h1*J;                 %this is the approximation with the appropriate change of measure scaling 
end

## function retval = doubgauss(a, b, c, d, f, m, n)
##     C = [0, 0, 0, 0; 1, 1, 0, 0; 0.5555555556, 0.8888888889, 0.5555555556, 0; 0.3478548451, 0.6521451549, 0.6521451549, 0.3478548451];
##     R = [0, 0, 0, 0; 0.5773502692, -0.5773502692, 0, 0; 0.7745966692, 0, -0.7745966692, 0; 0.8611363116, 0.3399810436, -0.3399810436, -0.8611363116];

    
    
## endfunction
