; bed.g
; called to perform automatic bed compensation via G32
;
; generated by RepRapFirmware Configuration Tool on Tue Feb 27 2018 21:33:13 GMT+0100 (CET)
M98 P/macros/ZConfig

;M98 P/macros/InicialCalibracion

;M561 ; clear any bed transform
;G28

;G29

;M98 P/macros/FinalCalibracion
G28 Z
G30 P0 X0 Y80 Z-99999 ; probe near a leadscrew
G30 P1 X190 Y80 Z-99999 S2 ; probe near a leadscrew
G28 Z
;G29