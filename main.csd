<CsoundSynthesizer>
<CsOptions>
-n -d --hardwarebufsamps=256 --realtime -B512 -b128 -odac0
</CsOptions>
<CsInstruments>

;-------------------------------------------------------
;--------------------Global Variables-------------------
;-------------------------------------------------------
sr = 48000
ksmps = 32
nchnls = 2
0dbfs = 1

#include "manageBufferUDO.csd"

gihandle OSCinit 7125


giTabLenSec = 3 ;table duration in seconds
giBuffer ftgen 0, 0, giTabLenSec*sr, 2, 0; table for audio data storage
maxalloc 2, 1 ; allow only one instance of the recording instrument at a time

giWin ftgen 1, 0, 512, 20, 6, 1, 2

gkDur init .1

;-------------------------------------------------------
;--------------------BufferManagement-------------------
;-------------------------------------------------------

instr BufferManagement

gaWritePoint init 0
gkReadPoint init 0
gkProxSec init 1

kRandomPerc = 0.5 * sr

aInputSignal inch 1

;aInputSignal oscili 0.5, 500

gaWritePoint, gkReadPoint manageBuffer aInputSignal, giBuffer, gkProxSec, kRandomPerc

endin

;-------------------------------------------------------
;-------------------------Metro-------------------------
;-------------------------------------------------------

instr Metro

kFrequency = 20

kTrig metro kFrequency

kStartPoint samphold gkReadPoint, kTrig

kDurSH samphold gkDur, kTrig

schedkwhen kTrig, 0, 1000, "Player", 0, kDurSH, kStartPoint

endin

;-------------------------------------------------------
;-------------------------Player------------------------
;-------------------------------------------------------


instr Player

iDur = i(gkDur)
iDurSamp = int(iDur * sr)
istart = i(p4)
iend = (istart+i(iDurSamp))

aPhase line i(p4), iDur, iend

aGrain table aPhase, giBuffer, 0, 0, 1

;aEnv linseg 0, i(gkDur)/2, 1, i(gkDur)/2, 0

aEnvIdx line 0, iDur, 1
aEnv table aEnvIdx, giWin , 1

outs aGrain*aEnv, aGrain*aEnv

endin

;-------------------------------------------------------
;-----------------------OSCListen-----------------------
;-------------------------------------------------------

instr OSCListen
kGotIt OSClisten gihandle, "/rtGX3O/dur", "f", gkDur
if kGotIt == 1 then
  printf "Message Received for '%s' at time %f: kReceiveValue = %d\n",
         1, "/exmp_1/int", times:k(), gkDur
endif
endin


</CsInstruments>
<CsScore>
i   "BufferManagement"  0   604800
i   "Metro"  0   604800
i   "OSCListen"  0   604800
</CsScore>

</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>100</x>
 <y>100</y>
 <width>320</width>
 <height>240</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="background">
  <r>240</r>
  <g>240</g>
  <b>240</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
