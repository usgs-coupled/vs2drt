FORTRAN_SOURCES+=$(shell find src -name "*.f90" -o -name "*.F90" | egrep -v "/Tests/" | sed 's^\./^^g')

depend .depend:
	@makedepf90 $(FORTRAN_SOURCES) | sed 's/\.o/\.\$$\(OBJEXT\)/g' | sort > .depend
