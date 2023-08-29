#IfWinActive, ahk_class CabinetWClass
!^n::

Gui, Destroy
Gui -Caption +Border
Gui, Font, s10
Gui, Add, Text ,, New folder name:
Gui, Add, Edit , w300 vfoldername, NewFolder
Gui, Add, Button, wp Default, OK
Gui, Show
return

ButtonOK:
Gui, Submit
{
  sleep 20
  ;cut selected files
  send ^x
  sleep 50
  
  ;create new folder with provided name
  send ^+n
  send %foldername%
  send {enter}
  sleep 100
  
  ;enter new folder
  send {enter}
  sleep 300
  
  ;move cut items
  send ^v
  
  ;leave new folder
  send {backspace}
  
  Return
}

GuiEscape:
Gui, Hide
esc := true
Return