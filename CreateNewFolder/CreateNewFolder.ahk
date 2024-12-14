#SingleInstance Force
if !A_IsAdmin { ; must be first in script  ; see *verb in AHK help --- here the context-menu Run as Administrator 
  try Run *RunAs "%A_ScriptFullPath%" 
  catch 
    MsgBox, You clicked Cancel when asked to elevate the script`nPlease Run this again with admin rights.
  ExitApp
} ;

;Alt+N - Create a new folder by utilizing the context menu shortcodes
!n::Send {AppsKey}{W}{F}