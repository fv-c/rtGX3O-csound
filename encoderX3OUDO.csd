opcode encoderX3O, a[], akk ;SIG, AZI, ELEV

    ain1,kAzi0,kEle0 xin

    aEnc[] init 16

    iPI = 4 * taninv(1.0)

    kEle = kEle0 * iPI / 180
    kAzi = kAzi0 * iPI / 180

    ;ACN - SN3D
    ;0 order
    aEnc[0] = ain1
  
    ;1 order
    aEnc[1] = ain1 * sin(kAzi) * cos(kEle) 
    aEnc[2] = ain1 * sin(kEle)
    aEnc[3] = ain1 * cos(kAzi) * cos(kEle)
    
    ;2 order
    aEnc[4] = ain1 * sqrt(3/4) * sin(2 * kAzi) * (cos(kEle))^2
    aEnc[5] = ain1 * sqrt(3/4) * sin(kAzi) * sin(2 * kEle)
    aEnc[6] = ain1 * (1/2) * (3 * (sin(kEle))^2-1)
    aEnc[7] = ain1 * sqrt(3/4) * cos(kAzi) * sin(2 * kEle)
    aEnc[8] = ain1 * sqrt(3/4) * cos(2 * kAzi) * (cos(kEle))^2
  
    ;3 order
    aEnc[9] = ain1 * sqrt(5/8) * sin(3 * kAzi) * (cos(kEle))^3
    aEnc[10] = ain1 * sqrt(15/4) * sin(2 * kAzi) * sin(kEle) * (cos(kEle))^2
    aEnc[11] = ain1 * sqrt(3/8) * sin(kAzi) * cos(kEle) * (5 * (sin(kEle))^2 - 1)
    aEnc[12] = ain1 * (1/2) * sin(kEle) * (5 * (sin(kEle))^2 - 3)
    aEnc[13] = ain1 * sqrt(3/8) * cos(kAzi) * cos(kEle) * (5 * (sin(kEle))^2 - 1)
    aEnc[14] = ain1 * sqrt(15/4) * cos(2 * kAzi) * sin(kEle) * (cos(kEle))^2
    aEnc[15] = ain1 * sqrt(5/8) * cos(3 * kAzi) * (cos(kEle))^3

    xout aEnc

endop