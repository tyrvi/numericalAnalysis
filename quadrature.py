from math import sin, e

def simpsons_rule(f, a, b):
    c = (a+b) / 2.000
    h3 = abs(b-a) / 6.0
    print("S(%0.10f, %0.10f) = %0.10f" % (a, b, h3*(f(a) + 4.0*f(c) + f(b))))
    return h3*(f(a) + 4.0*f(c) + f(b))

def recursive_asr(f, a, b, eps, whole, l):
    "Recursive implementation of adaptive Simpson's rule."
    print("level = %d" % l)
    c = (a+b) / 2.0
    left = simpsons_rule(f,a,c)
    right = simpsons_rule(f,c,b)
    if abs(left + right - whole) <= 15*eps:
        return left + right + (left + right - whole)/15.0
    return recursive_asr(f, a, c, eps/2.0, left, l+1) + recursive_asr(f, c, b, eps/2.0, right, l+1)

def adaptive_simpsons_rule(f, a, b, eps):
    "Calculate integral of f from a to b with max error of eps."
    return recursive_asr(f, a, b, eps, simpsons_rule(f, a, b), 0)


def main():
    print(adaptive_simpsons_rule(lambda x: (e**(2*x))*sin(3*x), 1, 3, 1e-5))

main()
