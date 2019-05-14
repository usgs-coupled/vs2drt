#!/bin/sh
#
# intel_psxe-2015
#
# serial
module purge
module load cmake/3.9.0 intel/psxe-2015
rm -rf _intel_psxe-2015
ctest -S intel_psxe-2015.cmake -C Release -VV -O intel_psxe-2015.log -DBUILD_MPI:BOOL=OFF -DBUILD_OPENMP:BOOL=OFF
module purge
# openmp
module purge
module load cmake/3.9.0 intel/psxe-2015
rm -rf _intel_psxe-2015_openmp
ctest -S intel_psxe-2015.cmake -C Release -VV -O intel_psxe-2015-openmp.log -DBUILD_MPI:BOOL=OFF -DBUILD_OPENMP:BOOL=ON
module purge
# mpi
module purge
module load cmake/3.9.0 intel/psxe-2015
rm -rf _intel_psxe-2015_mpi
ctest -S intel_psxe-2015.cmake -C Release -VV -O intel_psxe-2015-mpi.log -DBUILD_MPI:BOOL=ON -DBUILD_OPENMP:BOOL=OFF
module purge
