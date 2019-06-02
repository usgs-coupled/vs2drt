SET(vs2drt_DOC
VS2DRT_Input_Instructions.pdf
phreeqc3.pdf
PhreeqcI.pdf
VS2DH.pdf
VS2DI.pdf
VS2D.pdf
VS2DT.pdf
)

if (WIN32)
  install(FILES ${vs2drt_DOC} DESTINATION doc)
else()
  install(FILES ${vs2drt_DOC} DESTINATION ${CMAKE_INSTALL_DOCDIR}/doc)
endif()
