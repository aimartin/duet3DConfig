; File that will be executed after a Stall is detected
M400			; Make sure everything has stopped before we make changes
G10			; Execute Retraction
G91                     ; Relative coordinates
G1 Z10 F6000            ; Lower bed to avoid hot end crashing with the part
G90			; Absolute coordinates
G28 Y			; Home Y
G28 X			; Home X
G1 R1 Z5 F6000 		; go to 5mm above position of the last print move
G11			; Execute UnRetraction
G1 R1 			; go back to the last print move
M83 			; relative extruder moves