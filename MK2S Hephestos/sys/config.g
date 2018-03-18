; Configuration file for Duet WiFi (firmware version 1.20 or newer)
; executed by the firmware on start-up
;
; generated by RepRapFirmware Configuration Tool on Tue Feb 27 2018 21:33:13 GMT+0100 (CET)

;*** Communication and general ------------------------------------------
M111 S0 					; Debugging off
G90                                             ; Send absolute coordinates...
M83                                             ; ...but relative extruder moves
G21 						; Work in millimetres
M550 PHephestos MK2S                            ; Set machine name
M552 S1                                         ; Enable network
M586 P0 S1                                      ; Enable HTTP
M586 P1 S1                                      ; Enable FTP
M586 P2 S0                                      ; Disable Telnet

;*** Machine configuration ----------------------------------------------
M569 P0 S1                                      ; X Drive 0 goes forward
M569 P1 S1                                      ; Y Drive 1 goes forward
M569 P2 S1                                      ; Z Drive 2 goes forward (Izquierdo)
M569 P4 S1					; Z Drive 4 goes forward (Derecho)
M569 P3 S0                                      ; E0 Drive 3 goes backwards (Bondtech)
M584 X0 Y1 Z2:4 E3				; Driver 0 controls X motor, 1 controls Y, 2 and 4 controls Z, 3 controls E0
M208 X-40 Y-35 Z0 S1                            ; Set axis minima
M208 X190 Y180 Z150 S0                          ; Set axis maxima
M671 X-65:X265 Y80:Y80 S3  			; Driver2 Z POS (-65,100), Driver4 Z POS (265,Y100), Max Correction 2mm

;*** Mechanics ----------------------------------------------------------
M350 X256 Y256 I0                               ; Configure microstepping without interpolation for X and Y
M350 Z256 I0                                    ; Configure microstepping with interpolation for Z 
M350 E16 I0					; Configure microstepping without interpolation for E
M92 X1280 Y1280 Z6400 E415                      ; Set steps per mm
M566 X600 Y600 Z24 E1500                        ; Set maximum instantaneous speed changes (mm/min)
M203 X6000 Y6000 Z300 E3600                     ; Set maximum speeds (mm/min)
M201 X1200 Y1200 Z500 E10000                    ; Set accelerations (mm/s^2)
M906 X1100 Y1100 Z800 E450 I30                  ; Set motor currents (mA) and motor idle factor in per cent
M84 S30                                         ; Set idle timeout

;*** endstop configuration ----------------------------------------------
M574 Y1 S1 					; Set endstop configuration (Y endstops only, active high mode)
M915 P0 S12 F0 H200 R1				; Configure Stall Detection - Drive 0 (X), Sensibility 3, Unfiltered (F0), 200 Min Steps, Inform (R1)
M574 X1 S3					; Set endstop configuration (X endstops only, Motor Load mode)

; Heaters
M140 H-1                       			; Disable heated bed
;M301 H0 S1.00 P10 I0.1 D200 T0.4 W180 B30      ; Use PID on bed heater (may require further tuning)
;M305 P0 T100000 B3950 C0 R4700                 ; Set thermistor + ADC parameters for heater 0
;M143 H0 S120                                   ; Set temperature limit for heater 0 to 120C
M307 H1 A575.0 C225.7 D3.7 S1.00 V12.1 B0	; Use PID on Main Heater - Heater 1 model: gain 575.0, time constant 225.7, dead time 3.7, max PWM 1.00, calibration voltage 12.1, mode PID
M305 P1 T100000 B4750 C7.060000e-8 R4700        ; Set thermistor + ADC parameters for heater 1
M143 H1 S280                                    ; Set temperature limit for heater 1 to 280C

;***Fans ----------------------------------------------------------------
M106 P0 S0 I0 F500 H-1                          ; Set fan 0 value, PWM signal inversion and frequency. Thermostatic control is turned off - Blower Fan
M106 P1 S1 I0 F500 H1 T50                       ; Set fan 1 value, PWM signal inversion and frequency. Thermostatic control is turned on - E3D Fan
M106 P2 S1 I0 F500 H1 T50                       ; Set fan 2 value, PWM signal inversion and frequency. Thermostatic control is turned on - Extruder Fan

;*** Thermistors and heaters --------------------------------------------
M563 P0 D0 H1                                   ; Define tool 0
G10 P0 X0 Y0 Z0                                 ; Set tool 0 axis offsets
G10 P0 R0 S0                                    ; Set initial tool 0 active and standby temperatures to 0C
M207 S4.5 F11500 Z0.15				; Retraction Settings (4.5mm, 190mm/s, Z lift 0.15)

; Automatic power saving
M911 S10 R11 P"M913 X0 Y0 G91 M83 G1 Z3 E-5 F1000" ; Set voltage thresholds and actions to run on power loss

;*** Configure Z Probe -------------------------------------------------
M98 P/macros/ZConfig