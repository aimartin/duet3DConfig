; homex.g
; called to home the X axis
;
M400                  	; make sure everything has stopped before we make changes
M915 X S2 R0 F0     	; set X and Y to sensitivity 12, do nothing when stall, unfiltered
M574 X1 S4         	; set endstops to use motor stall

G91                   	; use relative positioning
;G1 Z10 F1200           ; lift Z

G1 H1 X-325 F3600 	; move right/back 325mm, stopping at the endstop
G1 X5                   ; move away from home

M400                  ; make sure everything has stopped before we reset the motor currents
G90                   ; back to absolute positioning

