opcode manageBuffer, ak, aikk
        aInputSignal, iBuffer, kProxSec, kRandomPerc xin

        ;-------------------------------------------------------
        ; WRITE POINT
        ;-------------------------------------------------------
        
        aPhase phasor sr / ftlen(iBuffer)

        aWritePoint = int(aPhase * ftlen(iBuffer))
                    tablew aInputSignal, aWritePoint, iBuffer

        ;-------------------------------------------------------
        ; READ POINT
        ;-------------------------------------------------------

        kReadNoise gauss kRandomPerc

        kReadPoint = aWritePoint - (sr * kProxSec) + int(kReadNoise)
        if kReadPoint < 0 then
            kReadPoint += ftlen(iBuffer)
        endif

        xout aWritePoint, kReadPoint
endop