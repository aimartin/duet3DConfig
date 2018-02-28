; Configuration file for Duet WiFi (firmware version 1.17)
; executed by the firmware on start-up
;
; generated by RepRapFirmware Configuration Tool on Sun Jun 11 2017 22:39:27 GMT+0200 (CEST)

;*** Communication and general ------------------------------------------
M111 S0 					; Debugging off
M550 POkercho's Hypercube 			; Set machine name
M555 P2 					; Set firmware compatibility to look like Marlin
M586 P0 S1 					; Enable HTTP
M586 P1 S1 					; Enable FTP
M586 P2 S0 					; Disable Telnet
G21 						; Work in millimetres
G90 						; Send absolute coordinates...
M83 						; ...but relative extruder moves
M667 S1 					; Select CoreXY mode

;*** Wifi Networking ----------------------------------------------------
M552 S1 					; Enable network

;*** Machine configuration ----------------------------------------------
M569 P0 S0 					; X Drive 0 goes backwards
M569 P1 S0 					; Y Drive 1 goes backwards
M569 P2 S0 					; Z Drive 2 goes backwards
M569 P3 S1 					; E0 Drive 3 goes forward
M569 P4 S0 					; E1 Drive 4 goes backwards
M584 X0 Y1 Z2:4 E3				; Driver 0 controls X motor, 1 controls Y, 2 and 4 controls Z, 3 controls E0
M671 X335:X-45 Y110:Y110 S3			; Driver2 Z POS (335,110), Driver4 Z POS (-45,Y110), Max Correction 2mm
M208 X-5 Y-65 Z0 S1 				; Minima 300x300
M208 X290 Y245 Z200 S0 				; Maxima 300x240

;*** Mechanics ----------------------------------------------------------
M350 X256 Y256 I0 				; Configure microstepping without interpolation for X and Y
M350 Z32 I1 					; Configure microstepping without interpolation for Z
M350 E16 I0 					; Configure microstepping without interpolation for E
M906 X1500 Y1500 Z800 E400 I30 			; Set motor currents (mA) and motor idle factor in per cent
M92 X1280 Y1280 Z800 E415 			; Set steps per mm (E from 98.4882 to 415)
M566 X700 Y700 Z10 E500 			; Set maximum instantaneous speed changes (mm/min) (Cambiado E de 300 a 500) - Cambiado Z a 10
M203 X6000 Y6000 Z500 E7000 			; Set maximum speeds (mm/min) (Cambiado E de 3500 a 6000)
M201 X700 Y700 Z125 E10000 			; Set accelerations (mm/s^2) (Cambiado E de 250 a 10000) Z de 300 a 125
M84 S30 					; Set idle timeout

;*** endstop configuration ----------------------------------------------
M574 X1 S1 					; Set endstop configuration (X endstops only, active high mode)
M915 P0:1 S3 F0 H200 R1				; Configure Stall Detection - Drive 0 and 1 (X-Y), Sensibility 3, Unfiltered (F0), 200 Min Steps, Inform (R1)
M574 Y1 S3					; Set endstop configuration (Y endstops only, Motor Load mode)

;***Fans ----------------------------------------------------------------
M106 P0 S0 I0 F500 H-1 				; Set fan 0 value, PWM signal inversion and frequency. Thermostatic control is turned off - Blower Fan
M106 P1 S1 I0 F500 H1 T135 			; Set fan 1 value, PWM signal inversion and frequency. Thermostatic control is turned on (starts at >135º) - E3D Fan
M106 P2 S1 I0 F500 H-1		 		; Set fan 2 value, PWM signal inversion and frequency. Thermostatic control is turned off - LEDS

;*** Thermistors and heaters --------------------------------------------
M570 H1 P20 T10	S600				; Set Heater 1 Allowed Temp deviation 10ºC in 20s. Abandon print in 600s
M570 H0 P20 T10	S600				; Set Heater 0 Allowed Temp deviation 10ºC in 20s. Abandon print in 600s
M143 S275 					; Set maximum heater temperature to 275C
M143 H0 S125 					; Set the maximum bed temperature to 125C
M305 P0 R4700 T100000 B3950 			; Set thermistor + ADC parameters for heater 0 - BED
M305 P1 T100000 B4725 C7.060000e-8 R4700 	; Set thermistor + ADC parameters for heater 1 - Hotend

;*** Tool definition ---------------------------------------------------
M563 P0 D0 H1 					; Define tool 0
G10 P0 X0 Y0 Z0 				; Set tool 0 axis offsets
G10 P0 R0 S0 					; Set initial tool 0 active and standby temperatures to 0C
M207 S4.5 F11500 Z0.15				; Retraction Settings (4.5mm, 190mm/s, Z lift 0.15)

;*** Pressure Advance -------------------------------------------------- DISABLED
;M572 D0 S0.15					; Set 0.15 seconds of Pressure Advance for Extruder 0

;*** Configure Z Probe -------------------------------------------------
M98 P/macros/ZConfig
