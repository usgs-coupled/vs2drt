if (WIN32)
  cmake_minimum_required(VERSION 3.4)
else()
  cmake_minimum_required(VERSION 3.9)
endif()

project(vs2drt C CXX Fortran)

# check for openmp
option(VS2DRT_BUILD_OPENMP "Build OpenMP configuration" "OFF")

# check for MPI
option(VS2DRT_BUILD_MPI "Build MPI configuration (If Enabled, overrides OpenMP option)" "OFF")

# OpenMP
if (VS2DRT_BUILD_OPENMP AND (NOT VS2DRT_BUILD_MPI))
  find_package(OpenMP REQUIRED)
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
  find_package(MPI REQUIRED)
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

# database
set(VS2DRT_DATABASE
  database/Amm.dat
  database/ColdChem.dat
  database/core10.dat
  database/frezchem.dat
  database/iso.dat
  database/llnl.dat
  database/minteq.dat
  database/minteq.v4.dat
  database/phreeqc.dat
  database/pitzer.dat
  database/sit.dat
  database/Tipping_Hurley.dat
  database/wateq4f.dat)

# override database directory on windows
if(WIN32)
  install(FILES ${VS2DRT_DATABASE} DESTINATION database)
else()
  install(FILES ${VS2DRT_DATABASE} DESTINATION ${CMAKE_INSTALL_DOCDIR}/database)
endif()

if (NOT WIN32)
  set(CPACK_GENERATOR TGZ)
endif()

include(CPack)

include(CTest)

add_subdirectory(src)
add_subdirectory(doc)
add_subdirectory(examples)
