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
!Left::Send {Home} ;move caret to line start
!Right::Send {End} ;move caret to line end
;!Up::Send {LAlt down}{LShift down}{Up}{LAlt up}{LShift up} ;move line up
;!Down::Send {LAlt down}{LShift down}{Down}{LAlt up}{LShift up} ;move line down

;Alt + Numpad Arrow Keys
!Numpad4::Send {Home} ;move caret to line start
!Numpad6::Send {End} ;move caret to line end
;!Numpad8::Send {LAlt down}{LShift down}{Up}{LAlt up}{LShift up} ;move line up
;!Numpad2::Send {LAlt down}{LShift down}{Down}{LAlt up}{LShift up} ;move line down

;Ctrl + Arrow Keys
^Up::Send {Up}{Up} ;move caret two lines up
^Down::Send {Down}{Down} ;move caret two lines down

;Alt + Ctrl + Arrow Keys
!^Left::Send {LCtrl down}{Left}{Left}{LCtrl up} ;move caret two words to the left
!^Right::Send {LCtrl down}{Right}{Right}{LCtrl up} ;move caret two words to the right
!^Up::Send {LCtrl down}{Home}{LCtrl up} ;move caret to doc start
!^Down::Send {LCtrl down}{End}{LCtrl up} ;move caret to doc end

;Alt + Shift + Arrow Keys
!+Left::Send {LShift down}{Home}{LShift up} ;select till start of line
!+Right::Send {LShift down}{End}{LShift up} ;select till end of line
!+Up::Send {LCtrl down}{LShift down}{Home}{LCtrl up}{LShift up} ;select to doc start
!+Down::Send {LCtrl down}{LShift down}{End}{LCtrl up}{LShift up} ;select to doc end

;Alt + Shift + Numpad Arrow Keys
!+Numpad4::Send {LShift down}{Home}{LShift up} ;select till start of line
!+Numpad6::Send {LShift down}{End}{LShift up} ;select till end of line
!+Numpad8::Send {LCtrl down}{LShift down}{Home}{LCtrl up}{LShift up} ;select to doc start
!+Numpad2::Send {LCtrl down}{LShift down}{End}{LCtrl up}{LShift up} ;select to doc end


;------------------ Special Shortcuts ------------------

;Alt + Ctrl + <Key>
!^a::Send {Home}{LShift down}{End}{LShift up} ;select whole line

;Alt + <Special Key>
!BS::Send {LShift down}{Home}{LShift up}{Del} ;delete till start of line
!Delete::Send {LShift down}{End}{LShift up}{Del} ;delete till end of line

;Misc
!x::Send {Home}{LShift down}{End}{LShift up}{LCtrl down}{x}{LCtrl up}{Del} ;cut whole line
;!^c::Send {LCtrl down}{c}{v}{v}{LCtrl up} ;duplicate (copy and paste twice)