from distutils.core import setup,Extension
from Cython.Build import cythonize

ext = Extension("wrapper", ["wrapper.pyx","./cfib.c"],
        include_dirs=["."])

setup(name="histogram",
        ext_modules=cythonize(ext))
