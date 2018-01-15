% Thais Minet
% 1/15/18
% Lab 1B Homework Assignment

function quadraticFormula
  printf("Calculates the real roots of a quadratic equation ax^2 + bx + c\n");
  a = input("a = ");
  b = input("b = ");
  c = input("c = ");
  
  % check for division by 0 and complex roots
  if a == 0
    error("ERROR a = 0")
  elseif (b*b - 4*a*c < 0)
    error("ERROR equation contains complex root")
  endif
  
  denominator = 2*a
  sqRoot = sqrt(b*b - 4*a*c)
  positiveNumerator = -b + sqRoot
  negativeNumerator = -b - sqRoot
  root1 = positiveNumerator / denominator
  root2 = negativeNumerator / denominator
  
  %printf("root1 = %f\nroot2 = %f\n", root1, root2)
  
endfunction