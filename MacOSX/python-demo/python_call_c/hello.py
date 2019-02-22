"""
Test for python call c.
"""

import ctypes


def load_dll():
    """
    Load dll by ctypes.CDLL.
    """
    lib = ctypes.CDLL("./libhello.so")
    # lib = ctypes.cdll.LoadLibrary("./libhello.so")
    lib.hello()
