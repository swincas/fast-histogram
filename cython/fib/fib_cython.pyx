cimport cython

def fib_cython_dynamic(n):
    a, b = 0.0, 1.0
    for i in range(n):
        a, b = a+b, a
    return a

cpdef fib_cython_static(int n):
    cdef:
        double a=0.0, b=1.0
        int i;
    for i in range(n):
        a, b = a + b, a
    return a

@cython.boundscheck(False)
@cython.wraparound(False)
cpdef fib_cython_opt(int n):
    cdef:
        double a=0.0, b=1.0
        int i;
    for i in range(n):
        a, b = a + b, a
    return a
