#!/bin/env bash
set -e

#
# gcc 7.1.0
#
VER=7.1.0

# serial
module purge
module load cmake/3.9.0 gcc/${VER}
rm -rf _gcc-${VER}
ctest -S gcc.cmake -C Release -VV -O gcc-${VER}.log -DBUILD_MPI:BOOL=OFF -DBUILD_OPENMP:BOOL=OFF -DGCC_VER:STRING=${VER}

# openmp
module purge
module load cmake/3.9.0 gcc/${VER}
rm -rf _gcc-${VER}_openmp
ctest -S gcc.cmake -C Release -VV -O gcc-${VER}-openmp.log -DBUILD_MPI:BOOL=OFF -DBUILD_OPENMP:BOOL=ON -DGCC_VER:STRING=${VER}

# mpi
module purge
module load cmake/3.9.0 gcc/${VER} openmpi/3.0.0-gcc${VER}
rm -rf _gcc-${VER}_mpi
ctest -S gcc.cmake -C Release -VV -O gcc-${VER}-mpi.log -DBUILD_MPI:BOOL=ON -DBUILD_OPENMP:BOOL=OFF -DGCC_VER:STRING=${VER}

#
# gcc 6.1
#
VER=6.1

# serial
module purge
module load cmake/3.9.0 gcc/${VER}
rm -rf _gcc-${VER}
ctest -S gcc.cmake -C Release -VV -O gcc-${VER}.log -DBUILD_MPI:BOOL=OFF -DBUILD_OPENMP:BOOL=OFF -DGCC_VER:STRING=${VER}

# openmp
module purge
module load cmake/3.9.0 gcc/${VER}
rm -rf _gcc-${VER}_openmp
ctest -S gcc.cmake -C Release -VV -O gcc-${VER}-openmp.log -DBUILD_MPI:BOOL=OFF -DBUILD_OPENMP:BOOL=ON -DGCC_VER:STRING=${VER}

# mpi
# commit 8586c20 fails
# w/o ZLIB_ROOT yields the following link error (vs2drt_mpi):
# /cxfs/projects/spack/opt/spack/linux-scientific6-x86_64/gcc-6.1.0/libxml2-2.9.4-4beqwsumsysby4zmjngzjzgirfhlkek3/lib/libxml2.so.2: undefined reference to `gzopen64@ZLIB_1.2.3.3'
module purge
module load cmake/3.9.0 openmpi/1.10.2-gcc${VER}.0
rm -rf _gcc-${VER}_mpi
# export ZLIB_ROOT=/cxfs/projects/spack/opt/spack/linux-scientific6-x86_64/gcc-6.1.0/zlib-1.2.11-ybmzdn63hza4u56ny7uqbngjzj57gajo
# using ZLIB_ROOT requires LD_LIBARY_PATH to be modified:
# export LD_LIBARY_PATH=ZLIB_ROOT/lib:$LD_LIBRARY_PATH
# see ~charlton/modulefiles/openmpi-src/1.10.2-gcc6.1.0
ctest -S gcc.cmake -C Release -VV -O gcc-${VER}-mpi.log -DBUILD_MPI:BOOL=ON -DBUILD_OPENMP:BOOL=OFF -DGCC_VER:STRING=${VER}
# unset ZLIB_ROOT

#
# intel_psxe-2015
#

# serial
module purge
module load cmake/3.9.0 intel/psxe-2015
rm -rf _intel_psxe-2015
ctest -S intel_psxe-2015.cmake -C Release -VV -O intel_psxe-2015.log -DBUILD_MPI:BOOL=OFF -DBUILD_OPENMP:BOOL=OFF

# openmp
module purge
module load cmake/3.9.0 intel/psxe-2015
rm -rf _intel_psxe-2015_openmp
ctest -S intel_psxe-2015.cmake -C Release -VV -O intel_psxe-2015-openmp.log -DBUILD_MPI:BOOL=OFF -DBUILD_OPENMP:BOOL=ON

# mpi
module purge
module load cmake/3.9.0 intel/psxe-2015
rm -rf _intel_psxe-2015_mpi
ctest -S intel_psxe-2015.cmake -C Release -VV -O intel_psxe-2015-mpi.log -DBUILD_MPI:BOOL=ON -DBUILD_OPENMP:BOOL=OFF

#
# unload all modules
#
module purge
