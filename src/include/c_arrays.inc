C
C   IF NUMBER OF NODES IS GREATER THAN ARRAY DIMENSIONS THEN
C   TERMINATE SIMULATION
C
      IF(NNODES.GT.36000.OR.NXR.GT.6000.OR.NLY.GT.6000) THEN
      WRITE (06,4020) NLY,NXR
      jstop=3
      return
      END IF