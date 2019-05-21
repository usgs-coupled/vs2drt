EXTRA_DIST=CMakeLists.txt \
           database/CMakeLists.txt \
           src/CMakeLists.txt \
           src/PhreeqcRM/CMakeLists.txt

AM_CPPFLAGS=-I$(srcdir)/src/PhreeqcRM/src \
            -I$(srcdir)/src/PhreeqcRM/src/IPhreeqcPhast \
            -I$(srcdir)/src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc \
            -I$(srcdir)/src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp \
            -I$(srcdir)/src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/common \
            -I$(srcdir)/src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/PhreeqcKeywords

AM_FCFLAGS=-I$(srcdir)/src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc
SUBDIRS = doc examples

if BUILD_MPI
bin_PROGRAMS = vs2drt-mpi
FCDEFS=-DUSE_MPI
else
if BUILD_OPENMP
bin_PROGRAMS = vs2drt-openmp
FCDEFS=-DUSE_OPENMP
else
bin_PROGRAMS = vs2drt-ser
endif #BUILD_OPENMP
endif #BUILD_MPI 

databasedir=$(datadir)/doc/$(PACKAGE_TARNAME)-$(VERSION)/database

dist_database_DATA=$(DATABASE)

DATABASE=\
        database/Amm.dat\
        database/ColdChem.dat\
        database/core10.dat\
        database/frezchem.dat\
        database/iso.dat\
        database/llnl.dat\
        database/minteq.dat\
        database/minteq.v4.dat\
        database/phreeqc.dat\
        database/pitzer.dat\
        database/sit.dat\
        database/Tipping_Hurley.dat\
        database/wateq4f.dat

VS2DRT_SRC=\
	.depend\
	src/mgmres.f90\
	src/modules.f90\
	src/parallel_solute_transport.F90\
	src/vs2dt3_3_reactive_withoutArgus1.F90\
	src/PhreeqcRM/src/RM_interface_C.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqcPhast.cxx\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/IPhreeqc.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/IPhreeqc.f90.inc\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/IPhreeqcCallbacks.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/fwrap2.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/fwrap6.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/fwrap5.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/Var.c\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/IPhreeqcLib.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/Var.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/Solution.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/System.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/cvdense.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/spread.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/PhreeqcKeywords\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/PhreeqcKeywords/Keywords.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/PhreeqcKeywords/Keywords.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/sundialsmath.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/nvector.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/cl1.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/Use.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/Exchange.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/nvector.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/GasPhase.cxx\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/cl1mp.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/prep.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/sit.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/Pressure.cxx\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/ChartObject.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/StorageBin.cxx\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/Serializer.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/cxxKinetics.cxx\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/nvector_serial.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/read.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/GasComp.cxx\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/SurfaceCharge.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/ChartHandler.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/Temperature.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/Serializer.cxx\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/StorageBinList.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/utilities.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/SolutionIsotope.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/PPassemblage.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/ISolution.cxx\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/sundialsmath.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/dense.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/phqalloc.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/UserPunch.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/runner.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/Temperature.cxx\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/advection.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/SS.cxx\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/cxxMix.cxx\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/Form1.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/runner.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/pitzer.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/ChartHandler.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/Reaction.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/SScomp.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/ExchComp.cxx\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/SelectedOutput.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/PBasic.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/SelectedOutput.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/SolutionIsotope.cxx\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/Phreeqc.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/SSassemblage.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/kinetics.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/SSassemblage.cxx\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/Reaction.cxx\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/inverse.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/PBasic.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/gases.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/pitzer_structures.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/Exchange.cxx\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/CurveObject.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/NA.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/input.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/SurfaceCharge.cxx\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/dumper.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/KineticsComp.cxx\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/PHRQ_io_output.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/cxxKinetics.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/ISolutionComp.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/NumKeyword.cxx\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/parse.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/dumper.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/ISolutionComp.cxx\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/integrate.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/CurveObject.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/phqalloc.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/cvdense.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/StorageBin.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/PPassemblage.cxx\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/SurfaceComp.cxx\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/GasPhase.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/smalldense.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/nvector_serial.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/print.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/cvode.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/cvode.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/step.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/isotopes.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/basicsubs.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/ExchComp.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/dense.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/Surface.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/Solution.cxx\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/UserPunch.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/NumKeyword.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/ReadClass.cxx\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/smalldense.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/readtr.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/Phreeqc.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/GasComp.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/tidy.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/System.cxx\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/ISolution.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/tally.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/structures.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/SScomp.cxx\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/Use.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/ChartObject.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/SS.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/Pressure.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/transport.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/model.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/NameDouble.cxx\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/SurfaceComp.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/mainsubs.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/Dictionary.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/global_structures.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/KineticsComp.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/NameDouble.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/sundialstypes.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/PPassemblageComp.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/cxxMix.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/Dictionary.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/StorageBinList.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/PPassemblageComp.cxx\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/Surface.cxx\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/common/Utils.cxx\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/common/phrqtype.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/common/Utils.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/common/PHRQ_base.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/common/PHRQ_io.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/common/Parser.cxx\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/common/Parser.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/common/PHRQ_base.cxx\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/phreeqcpp/common/PHRQ_io.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/fwrap3.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/thread.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/fwrap.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/IPhreeqc_interface.F90\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/fwrap.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/fwrap1.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/ErrorReporter.hxx\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/IPhreeqc.f.inc\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/IPhreeqc_interface_F.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/IPhreeqc.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/CSelectedOutput.hxx\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/Debug.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/CSelectedOutput.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/IPhreeqc_interface_F.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/fwrap7.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/CVar.hxx\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/fwrap8.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/Version.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/fwrap4.cpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/fimpl.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqc/IPhreeqc.hpp\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqcPhast.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqcPhast.f90.inc\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqcPhastLib.h\
	src/PhreeqcRM/src/IPhreeqcPhast/IPhreeqcPhastLib.cpp\
	src/PhreeqcRM/src/RM_interface.F90\
	src/PhreeqcRM/src/PhreeqcRM.cpp\
	src/PhreeqcRM/src/RM_interface_F.cpp\
	src/PhreeqcRM/src/PhreeqcRM.h\
	src/PhreeqcRM/src/RM_interface_F.h\
	src/PhreeqcRM/src/RM_interface_C.h\
	src/PhreeqcRM/src/IrmResult.h\
	src/FileHandler.cpp\
	src/Call_RM.F90\
	src/FileHandler.h\
	src/Pointers_to_fortran.h

vs2drt_openmp_SOURCES=$(VS2DRT_SRC)

vs2drt_mpi_SOURCES=$(VS2DRT_SRC)

vs2drt_ser_SOURCES=$(VS2DRT_SRC)

vs2drt_openmp_LDADD = $(FCLIBS)

vs2drt_mpi_LDADD = $(FCLIBS)

vs2drt_ser_LDADD = $(FCLIBS)

# We must override the default PPFCCOMPILE since ifort can't
# handle the FC_FUNC define correctly so $(DEFS) is replaced
# by $(FCDEFS)
#
PPFCCOMPILE = $(FC) $(FCDEFS) $(DEFAULT_INCLUDES) $(INCLUDES) \
	$(AM_CPPFLAGS) $(CPPFLAGS) $(AM_FCFLAGS) $(FCFLAGS)

# compile all C files as C++
#
COMPILE = $(CXXCOMPILE)

CLEANFILES=\
	bf.$(F90_MODEXT)\
	compnam.$(F90_MODEXT)\
	coordin.$(F90_MODEXT)\
	disch.$(F90_MODEXT)\
	dumm1.$(F90_MODEXT)\
	dumm2.$(F90_MODEXT)\
	dumm3.$(F90_MODEXT)\
	dumm.$(F90_MODEXT)\
	equat.$(F90_MODEXT)\
	equats.$(F90_MODEXT)\
	gmres1.$(F90_MODEXT)\
	hcon.$(F90_MODEXT)\
	idumm.$(F90_MODEXT)\
	ihdumm.$(F90_MODEXT)\
	iphreeqc.$(F90_MODEXT)\
	isdumm.$(F90_MODEXT)\
	itemblo.$(F90_MODEXT)\
	itemtxb.$(F90_MODEXT)\
	itexs.$(F90_MODEXT)\
	jtxx.$(F90_MODEXT)\
	kcon.$(F90_MODEXT)\
	mprop.$(F90_MODEXT)\
	phreecc.$(F90_MODEXT)\
	phreeqcrm.$(F90_MODEXT)\
	pit.$(F90_MODEXT)\
	plott.$(F90_MODEXT)\
	press.$(F90_MODEXT)\
	pricon.$(F90_MODEXT)\
	ptet.$(F90_MODEXT)\
	react.$(F90_MODEXT)\
	reduce_time.$(F90_MODEXT)\
	rpropsh.$(F90_MODEXT)\
	rspac.$(F90_MODEXT)\
	scon.$(F90_MODEXT)\
	sip.$(F90_MODEXT)\
	solindex.$(F90_MODEXT)\
	solmass.$(F90_MODEXT)\
	spfc.$(F90_MODEXT)\
	tempcc.$(F90_MODEXT)\
	temp.$(F90_MODEXT)\
	trxv.$(F90_MODEXT)\
	trxxh.$(F90_MODEXT)\
	trxx.$(F90_MODEXT)\
	trxy0.$(F90_MODEXT)\
	trxy1.$(F90_MODEXT)\
	trxy2.$(F90_MODEXT)\
	vs2dt_rm.$(F90_MODEXT)


include .depend

