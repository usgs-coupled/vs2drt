<#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.61])
AC_INIT([vs2drt], [1.1.1-10000], [rwhealy@usgs.gov])
##LT_INIT
AC_CONFIG_AUX_DIR([config])
AC_CONFIG_MACRO_DIR([m4])

AM_INIT_AUTOMAKE([-Wall -Werror foreign no-define subdir-objects])
AC_CONFIG_SRCDIR([src/vs2dt3_3_reactive_withoutArgus1.F90])

# enable silent rules when available (automake 1.11 or later).
m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])

AC_CANONICAL_HOST

# PhreeqcRM defines
AC_DEFINE([SWIG_SHARED_OBJ], , [Must be set for PhreeqcRM])
AC_DEFINE([USE_PHRQ_ALLOC], , [Must be set for PhreeqcRM])
AC_DEFINE([NDEBUG], , [Must be set for PhreeqcRM])

# check for --with-mpi
# If --with-mpi=auto is used, try to find MPI, but use standard C compiler if it is not found.
# If --with-mpi=yes is used, try to find MPI and fail if it isn't found.
# If --with-mpi=no is used, use a standard C compiler instead.
AC_ARG_WITH(mpi, [AS_HELP_STRING([--with-mpi],
    [compile with MPI (parallelization) support. If none is found,
    MPI is not used. Default: no])
],,[with_mpi=no])


# Checks for programs.
AX_PROG_CXX_MPI([test x"$with_mpi" != xno],[use_mpi=yes],[
  use_mpi=no
  if test x"$with_mpi" = xyes; then
    AC_MSG_ERROR([MPI compiler requested, but couldn't use MPI.])
  fi
])
AC_PROG_AWK
AM_PROG_AR
AC_PROG_LN_S
AC_PROG_CPP
AC_PROG_F77
AC_PROG_CXX
AX_PROG_FC_MPI([test x"$with_mpi" != xno],[use_mpi=yes],[
  use_mpi=no
  if test x"$with_mpi" = xyes; then
    AC_MSG_ERROR([MPI compiler requested, but couldn't use MPI.])
  fi
])
AC_FC_LIBRARY_LDFLAGS
AC_FC_WRAPPERS
AC_FC_MAIN
AC_PROG_INSTALL
AC_PROG_LN_S
AC_PROG_MAKE_SET
##AC_PROG_LIBTOOL
LT_INIT

# determine f90 module suffix
AX_F90_MODULE_EXTENSION
F90_MODEXT=mod
if test x$ax_cv_f90_modext != xunknown ; then
  F90_MODEXT=$ax_cv_f90_modext  
fi
AC_SUBST(F90_MODEXT)

# Checks for libraries.
if test x"$with_mpi" = xyes; then
  enable_openmp=no
fi

if test x"$enable_openmp" != xno; then
  AC_LANG_PUSH(C++)
  AC_OPENMP
  AC_LANG_POP(C++)
  AC_SUBST(AM_CXXFLAGS, $OPENMP_CXXFLAGS)
fi

# Checks for header files.
AC_CHECK_HEADERS([float.h limits.h memory.h stddef.h stdlib.h])

# Checks for typedefs, structures, and compiler characteristics.
AC_TYPE_SIZE_T

# Checks for library functions.
AC_FUNC_MALLOC
AC_FUNC_REALLOC
AC_FUNC_STRTOD

# libc functions
AC_CHECK_FUNCS([memmove], , AC_ERROR([memmove not found in libc]))
AC_CHECK_FUNCS([memset],  , AC_ERROR([memset not found in libc]))
AC_CHECK_FUNCS([strchr],  , AC_ERROR([strchr not found in libc]))
AC_CHECK_FUNCS([strcspn], , AC_ERROR([strcspn not found in libc]))
AC_CHECK_FUNCS([strtol],  , AC_ERROR([strtol not found in libc]))

# libm functions
AC_CHECK_FUNCS([floor],   , AC_CHECK_LIB(m, floor, , AC_ERROR([cannot find floor])) )
AC_CHECK_FUNCS([pow],     , AC_CHECK_LIB(m, pow,   , AC_ERROR([cannot find pow])) )
AC_CHECK_FUNCS([sqrt],    , AC_CHECK_LIB(m, sqrt,  , AC_ERROR([cannot find sqrt])) )

case $host_os in
     solaris*)
	CXXFLAGS="$CXXFLAGS -library=stlport4"
	LDFLAGS="$LDFLAGS -library=stlport4"
	;;
esac

# isfinite
AC_LANG_PUSH(C++)
AC_CACHE_CHECK([for isfinite], ac_cv_isfinite,
 [AC_TRY_LINK([#include <math.h>],
 [double x; int y; y = isfinite(x);],
 ac_cv_isfinite=yes,
 ac_cv_isfinite=no
)])
if test x"$ac_cv_isfinite" = x"yes"; then
  AC_DEFINE(HAVE_ISFINITE, [], [Has isfinite])
fi
AC_LANG_POP(C++)

# finite
AC_LANG_PUSH(C++)
AC_CACHE_CHECK([for finite], ac_cv_finite,
 [AC_TRY_LINK([#include <math.h>],
 [double x; int y; y = finite(x);],
 ac_cv_finite=yes,
 ac_cv_finite=no
)])
if test x"$ac_cv_finite" = x"yes"; then
  AC_DEFINE(HAVE_FINITE, [], [Has finite])
fi
AC_LANG_POP(C++)

# isnan
AC_CHECK_FUNCS([isnan],    , AC_CHECK_LIB(m, isnan))

AM_CONDITIONAL([PHREEQCRM_TEST_FORTRAN], [test "Xno" = "Xyes"])
AM_CONDITIONAL([BUILD_OPENMP], [test "X$enable_openmp" != "Xno"])
AM_CONDITIONAL([BUILD_MPI], [test "X$with_mpi" = "Xyes"])

# set vs2drt suffix
if test "X$with_mpi" != "Xno"; then
  AC_DEFINE([USE_MPI], [] , [Set to use MPI])
  PHAST_SUFFIX=mpi
  MPIEXEC=mpiexec
  MPIEXEC_NUMPROC_FLAG=-np
else
  if test "X$enable_openmp" != "Xno"; then
    AC_DEFINE([USE_OPENMP], [], [Set to to use OpenMP])
    PHAST_SUFFIX=openmp
  else
    PHAST_SUFFIX=ser
  fi
fi
AC_SUBST(PHAST_SUFFIX)
AC_SUBST(MPIEXEC)
AC_SUBST(MPIEXEC_NUMPROC_FLAG)

AC_CONFIG_FILES([
  Makefile
])

##AC_CONFIG_SUBDIRS([src/PhreeqcRM])

AC_OUTPUT
echo "*************************************"
echo "Summary:"
echo "C++ Compiler                 = $CXX"
echo "CPPFLAGS                     = $CPPFLAGS"
echo "CXXFLAGS                     = $CXXFLAGS"
echo "Fortran Compiler             = $FC"
echo "Fortran Libs                 = $FCLIBS"
echo "LDFLAGS                      = $LDFLAGS"
if test "X$enable_openmp" != "Xno"; then
  echo "Enable OpenMP                = yes"
else
  echo "Enable OpenMP                = no"
fi
echo "Enable MPI                   = $with_mpi"
echo "*************************************"

