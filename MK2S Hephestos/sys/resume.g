; resume.g
; called before a print from SD card is resumed
;
; generated by RepRapFirmware Configuration Tool on Tue Feb 27 2018 21:33:13 GMT+0100 (CET)
G1 R1 Z5 F6000 ; go to 5mm above position of the last print move
G1 R1          ; go back to the last print move
M83            ; relative extruder moves
;G1 E10 F3600   ; extrude 10mm of filament