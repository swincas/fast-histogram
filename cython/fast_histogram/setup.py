from distutils.core import setup,Extension
from Cython.Build import cythonize
from numpy import get_include

ext = Extension("histogram", ["histogram.pyx"],
        include_dirs=[".",get_include()])

setup(name="histogram",
        ext_modules=cythonize(ext))
