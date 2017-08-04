import numpy as np
from numbers import Integral
cimport cython
from libc.stdlib cimport malloc,free


@cython.boundscheck(False)
@cython.wraparound(False)
@cython.nonecheck(False)
@cython.initializedcheck(False)
@cython.cdivision(True)
def histogram1d(double[:] x, int nx, tuple min_max):
    cdef:
        long N = x.shape[0]
        long i
        int ix
        double xmin = min_max[0]
        double xmax = min_max[1]
        double normx = 1./(xmax - xmin)
        double tx,fnx
        double[::1] count_array = np.zeros((nx,),dtype=np.double)

    fnx = nx

    for i in range(N):
        tx = x[i]

        if (tx >= xmin and tx < xmax):
            ix = <int>((tx - xmin) * (normx) * fnx)
            count_array[ix] += 1

    return np.asarray(count_array,dtype=np.double)

@cython.boundscheck(False)
@cython.wraparound(False)
@cython.nonecheck(False)
@cython.initializedcheck(False)
@cython.cdivision(True)
def histogram2d(double[:] x, double[:] y, tuple bins, tuple min_max):
    cdef int nx,ny
    nx = bins[0]
    ny = bins[1]

    cdef:
        Py_ssize_t i,ix,iy
        long N = x.shape[0]
        double xmin = min_max[0][0]
        double xmax = min_max[0][1]
        double ymin = min_max[1][0]
        double ymax = min_max[1][1]
        double normx,normy
        double tx,ty
        double[:,::1] count_array = np.zeros((nx,ny), order='C', dtype=np.double)
    
    normx = 1. / (xmax-xmin)
    normy = 1. / (ymax-ymin)

    for i in range(N):
        tx = x[i]
        ty = y[i]

        if (tx >= xmin and tx < xmax and ty >= ymin and ty < ymax):
            ix = <int>((tx - xmin) * normx * nx)
            iy = <int>((ty - ymin) * normy * ny)
            #count_array[iy + ny * ix] += 1.
            count_array[ix,iy] += 1.

    return np.asarray(count_array,dtype=np.double)


