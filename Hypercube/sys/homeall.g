;*** Home X and Y Axis --------------------------------------------------
M400						; Make sure everything has stopped before we make changes
G91                         			; Relative coordinates
G1 Z10 F6000                 			; Lower bed to avoid hot end dragging in bed.
M106 P1 S0					; Disable E3D Fan 
M913 X80 Y80					; Reduce motor current to 70%

;G1 Y-350 F3000 S1     				; Move up to 350mm in the -Y direction until the homing switches are triggered
G1 S1 Y-350 F4000     				; Move up to 350mm in the -Y direction
;G1 Y6 F600               			; Move slowly 6mm in +Y direction
;G1 Y-10 S1             			; Move up to 10mm in the -Y direction until the homing switches are triggered

G1 Y0 F3000					; Move Y to 0
G1 X-350 F3000 S1     				; Move up to 350mm in the -X direction until the homing switches are triggered
;G1 X6 F600               			; Move slowly 6mm in +X direction
;G1 X-10 S1             			; Move up to 10mm in the -X direction until the homing switches are triggered

G90                         			; Absolute coordinates
M400						; Make sure everything has stopped before we reset the motor currents
M913 X100 Y100					; Motor currents back to normal
G1 X0 Y0 F3000					; Go to the Testing Point

G91
G1 Z-10
G90
;*** Configure Z Probe -------------------------------------------------- THIS OVERRIDES THE CONFIGURATION OF CONFIG.G!
M98 P/macros/ZConfig

;*** Home Z Axis --------------------------------------------------------
M98 P/macros/Home_Z