SET(vs2drt_DOC
NOTICE.TXT
PhreeqcI.pdf
README
RELEASE.txt
VS2D.pdf
VS2DH.pdf
VS2DI.pdf
VS2DRT_Input_Instructions.pdf
VS2DT.pdf
phreeqc3.pdf
)

if (WIN32)
  install(FILES ${vs2drt_DOC} DESTINATION doc)
else()
  install(FILES ${vs2drt_DOC} DESTINATION ${CMAKE_INSTALL_DOCDIR}/doc)
endif()
