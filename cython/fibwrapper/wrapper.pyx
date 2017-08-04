cdef extern from "cfib.h":
    double cfib(int n)

def fibc(n):
    return cfib(n)
