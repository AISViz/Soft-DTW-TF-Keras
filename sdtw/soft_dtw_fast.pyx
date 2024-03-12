# Author: Jay Kumar

# encoding: utf-8
# cython: cdivision=True
# cython: boundscheck=False
# cython: wraparound=False


cimport numpy as np

from libc.float cimport DBL_MAX
from libc.math cimport exp, log
from libc.string cimport memset


cdef inline double _softmin3(double a,
                             double b,
                             double c,
                             double gamma):
    a /= -gamma
    b /= -gamma
    c /= -gamma

    cdef double max_val = max(max(a, b), c)

    cdef double tmp = 0
    tmp += exp(a - max_val)
    tmp += exp(b - max_val)
    tmp += exp(c - max_val)

    return -gamma * (log(tmp) + max_val)

def py_softmin3(double a, double b,
                             double c,
                             double gamma):
    return _softmin3(a,b,c,gamma)
