from libc.stdlib cimport malloc,free

cdef class Matrix:
    cdef:
        unsigned int nrows, ncols
        double *_matrix
    def __cinit__(self, nr, nc): #This is called once, before __init__ or __new__
        self.nrows = nr
        self.ncols = nc
        self._matrix = <double*>malloc(nr * nc * sizeof(double)) #Allocating memory
        if self._matrix == NULL:
            raise MemoryError()
        self._init_matrix_ones()

    cdef _init_matrix_ones(self):
        cdef int i
        for i in range(self.nrows * self.ncols):
            self._matrix[i] = 1.

    def __dealloc__(self): #This is called once
        if self._matrix != NULL:
            free(self._matrix)


cdef class MyMatrix(Matrix):
    def __init__(self,nr,nc):
        super(MyMatrix,self).__init__()
    cpdef sum(self):
        cdef:
            double s = 0.
            int i = 0
            int N = self.nrows*self.ncols
        for i in range(N):
            s += self._matrix[i]
        return s
