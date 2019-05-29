# examples directory
#
set(EXAMPLES_DIR examples)

# solute-energy/example1
#
set(example_solute_energy_example1dir ${EXAMPLES_DIR}/solute-energy/example1)

set(solute_energy_example1
solute-energy/example1/file07.out
solute-energy/example1/fort.12
solute-energy/example1/obsPoints.out
solute-energy/example1/vs2drt.fil
solute-energy/example1/ReadmeSoluteEnergyExample1.txt
solute-energy/example1/example1.vs2
solute-energy/example1/input.pqi
solute-energy/example1/phreeqc.dat
solute-energy/example1/variables.out
solute-energy/example1/vs2drt.dat
solute-energy/example1/balance.out
solute-energy/example1/pre.chem.txt
solute-energy/example1/pre.log.txt
solute-energy/example1/pre_1.chem.xz.tsv
solute-energy/example1/vs2drt.out
)

if(WIN32)
  install(FILES ${solute_energy_example1} DESTINATION ${example_solute_energy_example1dir})
else()
  install(FILES ${solute_energy_example1} DESTINATION ${CMAKE_INSTALL_DOCDIR}/${example_solute_energy_example1dir})
endif()


# solute/example1
#
set(example_solute_example1dir ${EXAMPLES_DIR}/solute/example1)

set(solute_example1
solute/example1/file07.out
solute/example1/fort.12
solute/example1/input.pqi
solute/example1/obsPoints.out
solute/example1/phreeqc.dat
solute/example1/vs2drt.fil
solute/example1/ReadmeSoluteExample1.txt
solute/example1/balance.out
solute/example1/example1.vs2
solute/example1/pre.log.txt
solute/example1/variables.out
solute/example1/vs2drt.dat
solute/example1/pre.chem.txt
solute/example1/vs2drt.out
)

if(WIN32)
  install(FILES ${solute_example1} DESTINATION ${example_solute_example1dir})
else()
  install(FILES ${solute_example1} DESTINATION ${CMAKE_INSTALL_DOCDIR}/${example_solute_example1dir})
endif()


# solute/example2
#
set(example_solute_example2dir ${EXAMPLES_DIR}/solute/example2)

set(solute_example2
solute/example2/balance.out
solute/example2/file07.out
solute/example2/fort.12
solute/example2/input.pqi
solute/example2/obsPoints.out
solute/example2/phreeqc.dat
solute/example2/vs2drt.fil
solute/example2/ReadmeSoluteExample2.txt
solute/example2/example2.vs2
solute/example2/pre.chem.txt
solute/example2/pre.log.txt
solute/example2/variables.out
solute/example2/vs2drt.dat
solute/example2/vs2drt.out
)

if(WIN32)
  install(FILES ${solute_example2} DESTINATION ${example_solute_example2dir})
else()
  install(FILES ${solute_example2} DESTINATION ${CMAKE_INSTALL_DOCDIR}/${example_solute_example2dir})
endif()


# solute/example3
#
set(example_solute_example3dir ${EXAMPLES_DIR}/solute/example3)

set(solute_example3
solute/example3/balance.out
solute/example3/file07.out
solute/example3/fort.12
solute/example3/input.pqi
solute/example3/obsPoints.out
solute/example3/phreeqc.dat
solute/example3/vs2drt.fil
solute/example3/ReadmeSoluteExample3.txt
solute/example3/example3.vs2
solute/example3/pre.chem.txt
solute/example3/pre.log.txt
solute/example3/variables.out
solute/example3/vs2drt.dat
solute/example3/vs2drt.out
)

if(WIN32)
  install(FILES ${solute_example3} DESTINATION ${example_solute_example3dir})
else()
  install(FILES ${solute_example3} DESTINATION ${CMAKE_INSTALL_DOCDIR}/${example_solute_example3dir})
endif()


# solute/example4
#
set(example_solute_example4dir ${EXAMPLES_DIR}/solute/example4)

set(solute_example4
solute/example4/ReadmeSoluteExample4.txt
solute/example4/balance.out
solute/example4/file07.out
solute/example4/fort.12
solute/example4/phreeqc.dat
solute/example4/vs2drt.fil
solute/example4/example4.vs2
solute/example4/input.pqi
solute/example4/obsPoints.out
solute/example4/pre.chem.txt
solute/example4/pre.log.txt
solute/example4/variables.out
solute/example4/vs2drt.dat
solute/example4/vs2drt.out
)

if(WIN32)
  install(FILES ${solute_example4} DESTINATION ${example_solute_example4dir})
else()
  install(FILES ${solute_example4} DESTINATION ${CMAKE_INSTALL_DOCDIR}/${example_solute_example4dir})
endif()


# solute/example5
#
set(example_solute_example5dir ${EXAMPLES_DIR}/solute/example5)

set(solute_example5
solute/example5/ReadmeSoluteExample5.txt
solute/example5/file07.out
solute/example5/fort.12
solute/example5/input.pqi
solute/example5/phreeqc.dat
solute/example5/vs2drt.fil
solute/example5/balance.out
solute/example5/example5.vs2
solute/example5/obsPoints.out
solute/example5/pre.chem.txt
solute/example5/pre.log.txt
solute/example5/variables.out
solute/example5/vs2drt.dat
solute/example5/vs2drt.out
)

if(WIN32)
  install(FILES ${solute_example5} DESTINATION ${example_solute_example5dir})
else()
  install(FILES ${solute_example5} DESTINATION ${CMAKE_INSTALL_DOCDIR}/${example_solute_example5dir})
endif()


# energy/example1
#
set(example_energy_example1dir ${EXAMPLES_DIR}/energy/example1)

set(energy_example1
energy/example1/ReadmeEnergyExample1.txt
energy/example1/balance.out
energy/example1/example1.vs2
energy/example1/file07.out
energy/example1/fort.12
energy/example1/obsPoints.out
energy/example1/variables.out
energy/example1/vs2drt.dat
energy/example1/vs2drt.fil
energy/example1/vs2drt.out
)

if(WIN32)
  install(FILES ${energy_example1} DESTINATION ${example_energy_example1dir})
else()
  install(FILES ${energy_example1} DESTINATION ${CMAKE_INSTALL_DOCDIR}/${example_energy_example1dir})
endif()


# energy/example2
#
set(example_energy_example2dir ${EXAMPLES_DIR}/energy/example2)

set(energy_example2
energy/example2/ReadmeEnergyExample2.txt
energy/example2/balance.out
energy/example2/example2.vs2
energy/example2/file07.out
energy/example2/fort.12
energy/example2/obsPoints.out
energy/example2/variables.out
energy/example2/vs2drt.dat
energy/example2/vs2drt.fil
energy/example2/vs2drt.out
)

if(WIN32)
  install(FILES ${energy_example2} DESTINATION ${example_energy_example2dir})
else()
  install(FILES ${energy_example2} DESTINATION ${CMAKE_INSTALL_DOCDIR}/${example_energy_example2dir})
endif()


# energy/example3
#
set(example_energy_example3dir ${EXAMPLES_DIR}/energy/example3)

set(energy_example3
energy/example3/ReadmeEnergyExample3.txt
energy/example3/balance.out
energy/example3/example3.vs2
energy/example3/file07.out
energy/example3/fort.12
energy/example3/obsPoints.out
energy/example3/variables.out
energy/example3/vs2drt.dat
energy/example3/vs2drt.fil
energy/example3/vs2drt.out
)

if(WIN32)
  install(FILES ${energy_example3} DESTINATION ${example_energy_example3dir})
else()
  install(FILES ${energy_example3} DESTINATION ${CMAKE_INSTALL_DOCDIR}/${example_energy_example3dir})
endif()



# flow/example1
#
set(example_flow_example1dir ${EXAMPLES_DIR}/flow/example1)

set(flow_example1
flow/example1/ReadmeFlowExample1.txt
flow/example1/balance.out
flow/example1/example1.vs2
flow/example1/file07.out
flow/example1/fort.12
flow/example1/obsPoints.out
flow/example1/vs2drt.dat
flow/example1/vs2drt.fil
flow/example1/variables.out
flow/example1/vs2drt.out
)

if(WIN32)
  install(FILES ${flow_example1} DESTINATION ${example_flow_example1dir})
else()
  install(FILES ${flow_example1} DESTINATION ${CMAKE_INSTALL_DOCDIR}/${example_flow_example1dir})
endif()

# flow/example2
#
set(example_flow_example2dir ${EXAMPLES_DIR}/flow/example2)

set(flow_example2
flow/example2/ReadmeFlowExample2.txt
flow/example2/balance.out
flow/example2/example2.vs2
flow/example2/file07.out
flow/example2/fort.12
flow/example2/obsPoints.out
flow/example2/variables.out
flow/example2/vs2drt.dat
flow/example2/vs2drt.fil
flow/example2/vs2drt.out
)

if(WIN32)
  install(FILES ${flow_example2} DESTINATION ${example_flow_example2dir})
else()
  install(FILES ${flow_example2} DESTINATION ${CMAKE_INSTALL_DOCDIR}/${example_flow_example2dir})
endif()


# flow/example3
#
set(example_flow_example3dir ${EXAMPLES_DIR}/flow/example3)

set(flow_example3
flow/example3/ReadmeFlowExample3.txt
flow/example3/balance.out
flow/example3/example3.vs2
flow/example3/file07.out
flow/example3/fort.12
flow/example3/obsPoints.out
flow/example3/variables.out
flow/example3/vs2drt.dat
flow/example3/vs2drt.fil
flow/example3/vs2drt.out
)

if(WIN32)
  install(FILES ${flow_example3} DESTINATION ${example_flow_example3dir})
else()
  install(FILES ${flow_example3} DESTINATION ${CMAKE_INSTALL_DOCDIR}/${example_flow_example3dir})
endif()


# tutorial1
#
set(example_tutorial1dir ${EXAMPLES_DIR}/tutorial1)

set(tutorial1
tutorial1/ReadmeTutorial1.txt
tutorial1/balance.out
tutorial1/file07.out
tutorial1/fort.12
tutorial1/obsPoints.out
tutorial1/phreeqc.dat
tutorial1/pre.chem.txt
tutorial1/pre.log.txt
tutorial1/pre_1.chem.xz.tsv
tutorial1/tutorial.pqi
tutorial1/tutorial1.vs2
tutorial1/variables.out
tutorial1/vs2drt.dat
tutorial1/vs2drt.fil
tutorial1/vs2drt.out
)

if(WIN32)
  install(FILES ${tutorial1} DESTINATION ${example_tutorial1dir})
else()
  install(FILES ${tutorial1} DESTINATION ${CMAKE_INSTALL_DOCDIR}/${example_tutorial1dir})
endif()
