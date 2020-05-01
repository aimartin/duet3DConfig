; homey.g
; called to home the Y axis
;
M400                  	; make sure everything has stopped before we make changes
M915 Y S4 R0 F0     	; set X and Y to sensitivity 2, do nothing when stall, unfiltered
M574 Y1 S4         	; set endstops to use motor stall

G91                   	; use relative positioning
;G1 Z10 F1200           ; lift Z

G1 H1 Y-325 F3600 	; move right/back 325mm, stopping at the endstop
G1 Y5            	; move away from home

M400                  	; make sure everything has stopped before we reset the motor currents
G90                   	; back to absolute positioning

