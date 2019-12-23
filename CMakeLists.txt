cmake_minimum_required(VERSION 3.16)

project(vs2drt C CXX Fortran)

# check for openmp
option(VS2DRT_BUILD_OPENMP "Build OpenMP configuration" "OFF")

# check for MPI
option(VS2DRT_BUILD_MPI "Build MPI configuration" "OFF")

# OpenMP
if (VS2DRT_BUILD_OPENMP)
  find_package(OpenMP REQUIRED)

###   # based on https://cliutils.gitlab.io/modern-cmake/chapters/packages/OpenMP.html
###   if(NOT TARGET OpenMP::OpenMP_CXX)
###     # CMake < 3.9
###     find_package(Threads REQUIRED)
### 
###     add_library(OpenMP::OpenMP_CXX IMPORTED INTERFACE)
### 
###     set_property(TARGET OpenMP::OpenMP_CXX
###       PROPERTY INTERFACE_COMPILE_OPTIONS ${OpenMP_CXX_FLAGS})
### 
###     # Only works if the same flag is passed to the linker; use CMake 3.9+ otherwise (Intel, AppleClang)
###     set_property(TARGET OpenMP::OpenMP_CXX
###       PROPERTY INTERFACE_LINK_LIBRARIES ${OpenMP_CXX_FLAGS} Threads::Threads)
### 
###     # set OpenMP_CXX_FLAGS
###     if (OPENMP_FOUND AND DEFINED OpenMP_CXX_FLAGS)
###       set(OpenMP_CXX_FOUND OPENMP_FOUND)
###     endif()
###   endif()

###   if(NOT TARGET OpenMP::OpenMP_Fortran)
###     # CMake < 3.9
###     find_package(Threads REQUIRED)
### 
###     add_library(OpenMP::OpenMP_Fortran IMPORTED INTERFACE)
### 
###     set_property(TARGET OpenMP::OpenMP_Fortran
###       PROPERTY INTERFACE_COMPILE_OPTIONS ${OpenMP_Fortran_FLAGS})
### 
###     # Only works if the same flag is passed to the linker; use CMake 3.9+ otherwise (Intel, AppleClang)
###     set_property(TARGET OpenMP::OpenMP_Fortran
###       PROPERTY INTERFACE_LINK_LIBRARIES ${OpenMP_Fortran_FLAGS} Threads::Threads)
### 
###     # set OpenMP_Fortran_FLAGS
###     if (OPENMP_FOUND AND DEFINED OpenMP_Fortran_FLAGS)
###       set(OpenMP_Fortran_FOUND OPENMP_FOUND)
###     endif()
###   endif()

  if (OpenMP_CXX_FOUND)
    add_definitions(-DUSE_OPENMP)
    if (DEFINED ENV{OPENMP_SUFFIX})
       set(OPENMP_SUFFIX $ENV{OPENMP_SUFFIX})
    else()
       set(OPENMP_SUFFIX _openmp)
    endif()
  endif()
else()
    remove_definitions(-DUSE_OPENMP)
endif()

# MPI
if (VS2DRT_BUILD_MPI)
##{{
  if(MSVC)
    SET(MPI_Fortran_LINK_FLAGS ${MPI_Fortran_LINK_FLAGS} "/NODEFAULTLIB:LIBCMT.lib")
  endif()
##}}
  find_package(MPI REQUIRED)

###   # based on https://cliutils.gitlab.io/modern-cmake/chapters/packages/MPI.html
###   if (NOT TARGET MPI::MPI_CXX)
###     # CMake < 3.9
###     cmake_policy(SET CMP0004 OLD)
###     add_library(MPI::MPI_CXX IMPORTED INTERFACE)
###     cmake_policy(SET CMP0004 NEW)
### 
###     set_property(TARGET MPI::MPI_CXX
###       PROPERTY INTERFACE_COMPILE_OPTIONS ${MPI_CXX_COMPILE_FLAGS})
### 
###     set_property(TARGET MPI::MPI_CXX
###       PROPERTY INTERFACE_INCLUDE_DIRECTORIES "${MPI_CXX_INCLUDE_PATH}")
### 
###     set_property(TARGET MPI::MPI_CXX
###       PROPERTY INTERFACE_LINK_LIBRARIES ${MPI_CXX_LINK_FLAGS} ${MPI_CXX_LIBRARIES})
###   endif()

###   if (NOT TARGET MPI::MPI_Fortran)
###     # CMake < 3.9
###     cmake_policy(SET CMP0004 OLD)
###     add_library(MPI::MPI_Fortran IMPORTED INTERFACE)
###     cmake_policy(SET CMP0004 NEW)
### 
###     set_property(TARGET MPI::MPI_Fortran
###       PROPERTY INTERFACE_COMPILE_OPTIONS ${MPI_Fortran_COMPILE_FLAGS})
### 
###     set_property(TARGET MPI::MPI_Fortran
###       PROPERTY INTERFACE_INCLUDE_DIRECTORIES "${MPI_Fortran_INCLUDE_PATH}")
### 
###     set_property(TARGET MPI::MPI_Fortran
###       PROPERTY INTERFACE_LINK_LIBRARIES ${MPI_Fortran_LINK_FLAGS} ${MPI_Fortran_LIBRARIES})
###   endif()

  if (MPI_CXX_FOUND)
    add_definitions(-DUSE_MPI)
    include_directories(${MPI_CXX_INCLUDE_PATH})
    set(PHREEQCRM_BUILD_MPI ON CACHE INTERNAL "Build MPI configuration" FORCE)
    if (DEFINED ENV{MPI_SUFFIX})
       set(MPI_SUFFIX $ENV{MPI_SUFFIX})
    else()
       set(MPI_SUFFIX _mpi)
    endif()
  endif()
else()
  remove_definitions(-DUSE_MPI)
  set(PHREEQCRM_BUILD_MPI OFF CACHE INTERNAL "Build MPI configuration" FORCE)
endif()

if (VS2DRT_BUILD_OPENMP AND VS2DRT_BUILD_MPI)
  remove_definitions(-DUSE_OPENMP)  # PhreeqcRM can only handle VS2DRT_BUILD_OPENMP or VS2DRT_BUILD_MPI
  set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -DUSE_OPENMP")
endif()

# CPACK
set(CPACK_GENERATOR WIX)
set(CPACK_PACKAGE_NAME "vs2drt")
set(CPACK_PACKAGE_VENDOR "U.S. Geological Survey")
set(CPACK_PACKAGE_VERSION_MAJOR "1")
set(CPACK_PACKAGE_VERSION_MINOR "4")
set(CPACK_PACKAGE_VERSION_PATCH "0")
set(CPACK_PACKAGE_VERSION "${CPACK_PACKAGE_VERSION_MAJOR}.${CPACK_PACKAGE_VERSION_MINOR}.${CPACK_PACKAGE_VERSION_PATCH}")
set(CPACK_WIX_UPGRADE_GUID "01A3E7D5-388A-42A3-81E7-9916FFA4D62D")
set(CPACK_WIX_PATCH_FILE "${CMAKE_CURRENT_SOURCE_DIR}/msi/patch.xml")
set(CPACK_PACKAGE_INSTALL_DIRECTORY "USGS/${CPACK_PACKAGE_NAME}-${CPACK_PACKAGE_VERSION}")
set(CPACK_PACKAGE_FILE_NAME "${CPACK_PACKAGE_NAME}-${CPACK_PACKAGE_VERSION}-x64")
set(CPACK_WIX_LICENSE_RTF "${CMAKE_CURRENT_SOURCE_DIR}/msi/License.rtf")

if (VS2DRT_BUILD_OPENMP AND (NOT VS2DRT_BUILD_MPI) AND OpenMP_CXX_FOUND)
  if (MSVC11)
    set(CPACK_WIX_TEMPLATE "${CMAKE_CURRENT_SOURCE_DIR}/msi/WIX.MSVC11.template.in")    
  endif()
endif()

include(GNUInstallDirs)

# overide docdir on windows
if(WIN32 AND NOT CMAKE_INSTALL_DOCDIR)
  set(CMAKE_INSTALL_DOCDIR "" CACHE PATH "documentation root (doc)")
  set(CMAKE_INSTALL_DOCDIR "doc")
endif()

if (NOT WIN32)
  set(CPACK_GENERATOR TGZ)
endif()

include(CPack)

#include(CTest)

add_subdirectory(database)
add_subdirectory(src)
add_subdirectory(doc)
add_subdirectory(examples)
