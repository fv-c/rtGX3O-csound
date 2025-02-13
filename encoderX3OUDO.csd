opcode encoderX3O, a[], aaa ;SIG, AZI, ELEV

    ain1,aAzi0,aEle0 xin

    aEnc[] init 16

    iPI = 4 * taninv(1.0)

    aEle = aEle0 * iPI / 180
    aAzi = aAzi0 * iPI / 180

    ;ACN - SN3D
    ;0 order
    aEnc[0] = ain1
  
    ;1 order
    aEnc[1] = ain1 * sin(aAzi) * cos(aEle) 
    aEnc[2] = ain1 * sin(aEle)
    aEnc[3] = ain1 * cos(aAzi) * cos(aEle)
    
    ;2 order
    aEnc[4] = ain1 * sqrt(3/4) * sin(2 * aAzi) * (cos(aEle))^2
    aEnc[5] = ain1 * sqrt(3/4) * sin(aAzi) * sin(2 * aEle)
    aEnc[6] = ain1 * (1/2) * (3 * (sin(aEle))^2-1)
    aEnc[7] = ain1 * sqrt(3/4) * cos(aAzi) * sin(2 * aEle)
    aEnc[8] = ain1 * sqrt(3/4) * cos(2 * aAzi) * (cos(aEle))^2
  
    ;3 order
    aEnc[9] = ain1 * sqrt(5/8) * sin(3 * aAzi) * (cos(aEle))^3
    aEnc[10] = ain1 * sqrt(15/4) * sin(2 * aAzi) * sin(aEle) * (cos(aEle))^2
    aEnc[11] = ain1 * sqrt(3/8) * sin(aAzi) * cos(aEle) * (5 * (sin(aEle))^2 - 1)
    aEnc[12] = ain1 * (1/2) * sin(aEle) * (5 * (sin(aEle))^2 - 3)
    aEnc[13] = ain1 * sqrt(3/8) * cos(aAzi) * cos(aEle) * (5 * (sin(aEle))^2 - 1)
    aEnc[14] = ain1 * sqrt(15/4) * cos(2 * aAzi) * sin(aEle) * (cos(aEle))^2
    aEnc[15] = ain1 * sqrt(5/8) * cos(3 * aAzi) * (cos(aEle))^3

    xout aEnc

endop