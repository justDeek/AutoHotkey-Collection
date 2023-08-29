#SingleInstance Force
if !A_IsAdmin { ; must be first in script  ; see *verb in AHK help --- here the context-menu Run as Administrator 
  try Run *RunAs "%A_ScriptFullPath%" 
  catch 
    MsgBox, You clicked Cancel when asked to elevate the script`nPlease Run this again with admin rights.
  ExitApp
} ;

;Shortcode Reference: ^ = Ctrl | + = Shift | ! = Alt | # = Win

;------------------ Arrow Key Shortcuts ------------------

;Alt + Arrow Keys
!Left::Send {Home} ;moves to line start
!Right::Send {End} ;moves to line end
!Up::Send {LCtrl down}{LShift down}{Up}{LCtrl up}{LShift up} ;move line up
!Down::Send {LCtrl down}{LShift down}{Down}{LCtrl up}{LShift up} ;move line down

;Ctrl + Arrow Keys
^Up::Send {Up}{Up} ;go two lines up
^Down::Send {Down}{Down} ;go two lines down

;Alt + Ctrl + Arrow Keys
!^Left::Send {LCtrl down}{Left}{Left}{LCtrl up} ;move two words to the left
!^Right::Send {LCtrl down}{Right}{Right}{LCtrl up} ;move two words to the right
!^Up::Send {LCtrl down}{Home}{LCtrl up} ;move to doc start
!^Down::Send {LCtrl down}{End}{LCtrl up} ;move to doc end

;Alt + Win + Arrow Keys
!#Left::Send {LCtrl down}{Left}{Left}{Left}{LCtrl up} ;move three words to the left
!#Right::Send {LCtrl down}{Right}{Right}{Right}{LCtrl up} ;move three words to the right
!#Up::Send {LCtrl down}{LShift down}{Up}{Up}{LCtrl up}{LShift up} ;move two lines up
!#Down::Send {LCtrl down}{LShift down}{Down}{Down}{LCtrl up}{LShift up} ;move two lines down

;Alt + Shift + Arrow Keys
!+Left::Send {LShift down}{Home}{LShift up} ;select till start of line
!+Right::Send {LShift down}{End}{LShift up} ;select till end of line
!+Up::Send {LCtrl down}{LShift down}{Home}{LCtrl up}{LShift up} ;select to doc start
!+Down::Send {LCtrl down}{LShift down}{End}{LCtrl up}{LShift up} ;select to doc end

;Ctrl + Shift + Arrow Keys
^+Up::Send {Up}{Up}{Up} ;go three lines up (replaces moving a line up)
^+Down::Send {Down}{Down}{Down} ;go three lines down (replaces moving a line up)


;------------------ Special Shortcuts ------------------

;Alt + Shift + <Special Key>
!+a::Send {Home}{LShift down}{End}{LShift up} ;select whole line

;Alt + <Special Key>
!BS::Send {LShift down}{Home}{LShift up}{Del} ;delete till start of line
!Delete::Send {LShift down}{End}{LShift up}{Del} ;delete till end of line

;Ctrl + <Key> to Alt + <Key> adaptations - duplicates some Ctrl+Key shortcuts using the Alt key for convenience
!a::Send {LCtrl down}{a}{LCtrl up} ;select all
!x::Send {Home}{LShift down}{End}{LShift up}{LCtrl down}{x}{LCtrl up}{Del} ;cut whole line
!y::Send {LCtrl down}{z}{LCtrl up} ;undo
!z::Send {LCtrl down}{y}{LCtrl up} ;redo
!s::Send {LCtrl down}{s}{LCtrl up} ;save
!f::Send {LCtrl down}{f}{LCtrl up} ;find
;!d::Send {LCtrl down}{d}{LCtrl up} ;duplicate line

;!^c::Send {LCtrl down}{c}{v}{v}{LCtrl up} ;duplicate (copy and paste twice)
;!^v::Send {LCtrl down}{v}{v}{LCtrl up} ;paste twice