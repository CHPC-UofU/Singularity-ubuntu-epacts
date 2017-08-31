# Ubuntu container for EPACTS

Installation based on https://genome.sph.umich.edu/wiki/EPACTS#Installation_Details

## Caveats

- Works with Ubuntu 16.04, but not with 16.10, due to gcc 6.2 having issues building the Eigen C++ library.
- also needed to do a few replacements for the configure and Makefile of EPACTS
- getting the reference files via EPACTS download scripts did not work, so had to wget them manually
