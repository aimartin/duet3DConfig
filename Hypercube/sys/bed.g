;G28 X ; home X
;G28 Y ; home Y
G28 Z ; home Z
G1 X5
G30 P0 X25 Y165 Z-99999 ; probe near a leadscrew, half way along Y axis
G30 P1 X290 Y160 Z-99999 S2 ; probe near a leadscrew and calibrate 2 motors
G28 Z ; home Z
;G29 ; Mesh Bed Levelling