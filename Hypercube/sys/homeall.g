; homeall.g
; called to home all axes
;
M400                  ; make sure everything has stopped before we make changes
M915 X Y S2 R0 F0     ; set X and Y to sensitivity 2, do nothing when stall, unfiltered
M574 X1 Y1 S3         ; set endstops to use motor stall

G91                   ; use relative positioning
;G1 Z10 F1200          ; lift Z

G1 S1 X-325 Y-325 F3600 ; move right/back 325mm, stopping at the endstop
G1 X5 Y5            ; move away from home
; X or Y is homed at this point, now home the other axis
G1 S1 X-325 F3600      ; move towards axis minimum 
G1 S1 Y-325 F3600      ; move towards axis minimum 
G1 X5 Y5                      ; move away from home

;G1 Z-10 F1200           ; lower Z
M400                  ; make sure everything has stopped before we reset the motor currents
G90                   ; back to absolute positioning
M574 X1 Y1 S1         ; define active low microswitches

G92 Z0