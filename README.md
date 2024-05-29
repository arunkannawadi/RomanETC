# RomanETC

GitHub repository for Roman Space Telescope wide-field Galaxy Survey Exposure Time Calculator (wfGSETC)

This is an unofficial copy of Roman Space Telescope Exposure Time Calculator (ETC)
written by @hirata10 and hosted by NASA at https://roman.ipac.caltech.edu/sims/tools/wfDepc/wfDepc.html.
The original code is intended to be a stand-alone executable.
The code here will be modified to support both application mode as well as
library mode to be used with other software, in C and in Python.

## Installation
The source code is a collection of multiple calculators with a large number of shared utility functions.
The code can be compiled in different modes, depending on the desired output by setting the appropriate flags.
The code is fully self-contained and has no dependencies other than the standard C library.
A Makefile is provided to simplify the compilation process.
Running

```bash
make WL_EXE
```

is equivalent to

```bash
gcc exptimecalc.c -lm -Wall -O3 -o wletc.exe -DWL_MODE -DWL_CUT_DEFAULT -DOUT_WL_CAT -DIN_DLON -DOUT_EXTRA_PSF_PROPERTIES -DMY_WL_EXTRAFIELDS
```

as described in the manual.

Additional flags can be passed in as appropriate as follows:

```bash
make PZCAL_LIB ADDITIONAL_FLAGS="-DTILT_BACK"
```

Please see Section 2 (Compiling the Code) in the manual for more details and available flags.

## References

The reference for the ETC is: Christopher M Hirata, Neil Gehrels, Jean-Paul Kneib, Jeffrey Kruk, Jason Rhodes, Yun Wang, Julien Zoubian, "The WFIRST Galaxy Survey Exposure Time Calculator" 2012 (arXiv:1204.5151).
Please also indicate the version you used.
