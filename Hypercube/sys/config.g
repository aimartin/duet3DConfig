; Configuration file for Duet WiFi
; executed by the firmware on start-up

; General preferences
G90                                     							; send absolute coordinates...
M83                                     							; ...but relative extruder moves
M550 P"Hypercube"                       							; set printer name
G21																	; Work in Millimetres
M669 K1                                 							; select CoreXY mode
M555 P2 															; set compatibility with Marlin

; Network
M552 S1                                 							; enable network
M586 P0 S1                              							; enable HTTP
M586 P1 S1                              							; disable FTP
M586 P2 S0                              							; disable Telnet

; Drives
M569 P0 S1                              							; physical drive 0 goes forwards (X)
M569 P1 S1                              							; physical drive 1 goes forwards (Y)

M569 P3 S0                              							; physical drive 3 goes forwards (Extruder)

M569 P2 S1                              							; physical drive 2 goes forwards (Z Right)
M569 P4 S0                              							; physical drive 4 goes forwards (Z Left)

M584 X0 Y1 Z4:2 E3                      							; set drive mapping ZLeft:4 ZRight:2
M671 X-50:335 Y165:160
M350 X256 Y256 I0                       							; configure microstepping without interpolation for X and Y
M350 Z256 I0														; configure microstepping without interpolation for Z
M350 E16 I1                             							; configure microstepping with interpolation for Extruder

M92 X1280.00 Y1280.00 Z6400.00 E144.83  							; set steps per mm
M566 X900.00 Y900.00 Z12.00 E120.00     							; set maximum instantaneous speed changes (mm/min)
M203 X6000.00 Y6000.00 Z200.00 E2500.00 							; set maximum speeds (mm/min)
M201 X700.00 Y700.00 Z50.00 E250.00     							; set accelerations (mm/s^2)
M906 X1400 Y1400 Z1000 E1300 I30          							; set motor currents (mA) and motor idle factor in per cent
M84 S30                                 							; Set idle timeout

; Axis Limits
M208 X0 Y-5 Z0 S1                       							; set axis minima
M208 X275 Y300 Z260 S0                  							; set axis maxima

; Endstops
M574 X1 S3 															; set endstops controlled by motor stall detection
M574 Y1 S3                               							; set endstops controlled by motor stall detection


; Z-Probe
M307 H3 A-1 C-1 D-1 												; DISABLE HEATER 3 for BLTouch
M98 P/macros/Z_Config												; Execute macro for Z config


; Heaters
M140 H0
M308 S0 P"bed_temp" Y"thermistor" T100000 B4138 R4700  				; set thermistor + ADC parameters for Bed
M950 H0 C"bedheat" T0												; create heater for Bed
M307 H0 A194.6 C473.2 D1.4 S1.00 V24.2 B0							; heating parameters for Bed
M143 H0 S80     													; set Temperature Limit for Bed to 80
         
M308 S1 P"e0_temp" Y"thermistor" T100000 B4750 C7.060000e-8 R4700	; set thermistor + ADC parameters for heater 1
M950 H1 C"e0_heat" T1												; create heater for Extruder 1
M307 H1 A593.1 C230.0 D4.6 S1.00 V24.0 B0							; heating parameters for Extruder 1
M143 H1 S245                            							; set temperature limit for Extruder to 245C

; Fans
M950 F0 C"fan0"														; create Fan0 (Layer Fan)
M106 P0 S0 I0 F500 H-1                  							; set fan 0 value, PWM signal inversion and frequency. Thermostatic control is turned off

M950 F1 C"fan1"														; create Fan1 (E3D Fan)
M106 P1 S1 I0 F500 H1 T45               							; set fan 1 value, PWM signal inversion and frequency. Thermostatic control is turned on


; Tools
M563 P0 D0 H1 F0                        							; define tool 0
G10 P0 X0 Y0 Z0                         							; set tool 0 axis offsets
G10 P0 R0 S0                            							; set initial tool 0 active and standby temperatures to 0C

; Custom settings are not defined

