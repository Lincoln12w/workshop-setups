#!/usr/bin/env python
"""
Description:
    Modify the pdf files.

Author: lincoln12w
Github: https://github.com/Lincoln12w

Module:

APIs:

Examples:

    python pdf-modify.py test.pdf 0         # remove the first page of the pdf.

Modify History
--------------
00a 24oct17 lzw create.
01a 20mar18 lzw never raised the exception in `generic.py:632`.
"""

import sys

from PyPDF2 import PdfFileReader, PdfFileMerger, PdfFileWriter


def rmPages(filename, pages):
    with open(filename, 'rb') as pdffile:
        originfile = PdfFileReader(pdffile)
        newfile = PdfFileMerger()
        write = PdfFileWriter()
        for index in range(originfile.getNumPages()):
            if index not in pages:
                newfile.append(originfile, pages=(index, index+1))

    with open(filename[:-4] + "-new.pdf", "wb") as newpdf:
        newfile.write(newpdf)

if __name__ == '__main__':

    filename = sys.argv[1]
    pages = [int(page) for page in sys.argv[2:]]
    rmPages(filename, pages)
