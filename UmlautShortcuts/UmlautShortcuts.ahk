#SingleInstance Force
if !A_IsAdmin { ; must be first in script  ; see *verb in AHK help --- here the context-menu Run as Administrator 
  try Run *RunAs "%A_ScriptFullPath%" 
  catch 
    MsgBox, You clicked Cancel when asked to elevate the script`nPlease Run this again with admin rights.
  ExitApp
} ;

; Allows to write Umlauts on english keyboard layout

; Windows + <letter>
#a::Send {ASC 0228}
#o::Send {ASC 0246}
#u::Send {ASC 0252}
#s::Send {ASC 0223}

; Capital variants
#+a::Send {ASC 0196}
#+o::Send {ASC 0214}
#+u::Send {ASC 0220}