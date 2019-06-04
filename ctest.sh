#!/bin/env bash
set -e

for CMAKE_VER in 3.10.1
do
    # GCC
    for GCC_VER in 6.1 7.1.0
    do
    	# serial
    	module purge
    	module load cmake/${CMAKE_VER}
    	module load gcc/${GCC_VER}
    	ctest -S gcc.cmake -C Release -VV -O cmake-${CMAKE_VER}-gcc-${GCC_VER}.log -DBUILD_MPI:BOOL=OFF -DBUILD_OPENMP:BOOL=OFF -DCMAKE_VER:STRING=${CMAKE_VER} -DGCC_VER:STRING=${GCC_VER}

    	# openmp
    	module purge
    	module load cmake/${CMAKE_VER}
    	module load gcc/${GCC_VER}
    	ctest -S gcc.cmake -C Release -VV -O cmake-${CMAKE_VER}-gcc-${GCC_VER}-openmp.log -DBUILD_MPI:BOOL=OFF -DBUILD_OPENMP:BOOL=ON -DCMAKE_VER:STRING=${CMAKE_VER} -DGCC_VER:STRING=${GCC_VER}
    done

    # mpi (openmpi)
    for OPENMPI in openmpi/1.10.2-gcc6.1.0 openmpi/2.1.2-gcc7.1.0  openmpi/3.0.0-gcc7.1.0 openmpi/1.10.2-gcc7.1.0 # openmpi/1.8.8-gcc6.1.0
    do
    	module purge
    	module load cmake/${CMAKE_VER}
    	module load ${OPENMPI}
    	OPEN_MPI=$(echo ${OPENMPI} | sed -e s^/^_^g)
    	ctest -S gcc.cmake -C Release -VV -O cmake-${CMAKE_VER}-${OPEN_MPI}.log -DBUILD_MPI:BOOL=ON -DBUILD_OPENMP:BOOL=OFF -DCMAKE_VER:STRING=${CMAKE_VER} -DOPEN_MPI:STRING=${OPEN_MPI}

    	# both mpi and openmp
    	module purge
    	module load cmake/${CMAKE_VER}
    	module load ${OPENMPI}
    	OPEN_MPI=$(echo ${OPENMPI} | sed -e s^/^_^g)
    	ctest -S gcc.cmake -C Release -VV -O cmake-${CMAKE_VER}-${OPEN_MPI}-openmp.log -DBUILD_MPI:BOOL=ON -DBUILD_OPENMP:BOOL=ON -DCMAKE_VER:STRING=${CMAKE_VER} -DOPEN_MPI:STRING=${OPEN_MPI}
    done


    # INTEL
    for INTEL_VER in 2015 2017u2 2018u1 2018u3
    do
    	# serial
    	module purge
    	module load cmake/${CMAKE_VER}
    	module load intel/psxe-${INTEL_VER}
    	ctest -S intel.cmake -C Release -VV -O cmake-${CMAKE_VER}-intel_psxe-${INTEL_VER}.log -DBUILD_MPI:BOOL=OFF -DBUILD_OPENMP:BOOL=OFF -DCMAKE_VER:STRING=${CMAKE_VER} -DINTEL_VER:STRING=${INTEL_VER}

        # openmp
    	module purge
    	module load cmake/${CMAKE_VER}
    	module load intel/psxe-${INTEL_VER}
    	ctest -S intel.cmake -C Release -VV -O cmake-${CMAKE_VER}-intel_psxe-${INTEL_VER}-openmp.log -DBUILD_MPI:BOOL=OFF -DBUILD_OPENMP:BOOL=ON -DCMAKE_VER:STRING=${CMAKE_VER} -DINTEL_VER:STRING=${INTEL_VER}
	
        # mpi
    	module purge
    	module load cmake/${CMAKE_VER}
    	module load intel/psxe-${INTEL_VER}
    	ctest -S intel.cmake -C Release -VV -O cmake-${CMAKE_VER}-intel_psxe-${INTEL_VER}-mpi.log -DBUILD_MPI:BOOL=ON -DBUILD_OPENMP:BOOL=OFF -DCMAKE_VER:STRING=${CMAKE_VER} -DINTEL_VER:STRING=${INTEL_VER}

	# both mpi and openmp
	module purge
	module load cmake/${CMAKE_VER}
	module load intel/psxe-${INTEL_VER}
	ctest -S intel.cmake -C Release -VV -O cmake-${CMAKE_VER}-intel_psxe-${INTEL_VER}-mpi-openmp.log -DBUILD_MPI:BOOL=ON -DBUILD_OPENMP:BOOL=ON -DCMAKE_VER:STRING=${CMAKE_VER} -DINTEL_VER:STRING=${INTEL_VER}
    done
done
