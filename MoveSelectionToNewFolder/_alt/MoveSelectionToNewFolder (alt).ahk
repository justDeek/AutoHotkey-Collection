#IfWinActive, ahk_class CabinetWClass ;allows the script only inside a windows explorer

!^n::

inputbox, folderName, Create new Folder, New folder name:
If (folderName="") {
  return
}
sleep 50

clipboard:=""
targetDir:=""

;copy selected files
Send, ^c

;move the files to the target folder
Loop Parse, clipboard, `n
{
  ;get the directory of the first clipboard item
  if (targetDir = "")
  {
    ;get folder path of current item
    Send +{F10}a ;context menu->copy path
    ClipWait
    SplitPath, clipboard, , OutDir
    targetDir := StrReplace(OutDir "\" folderName, """")
    ;msgbox, %targetDir%
    
    ;check if target folder exists. If not, create it.
    if (!fileExist(targetDir))
    {
      FileCreateDir, %targetDir%
      if ErrorLevel
      {
        MsgBox, 48, Error, An error occurred when creating the directory.`n`n%targetDir%
        return
      }
      
      sleep 50
    }
  }
 
  currFile := a_loopfield
  ;msgbox, %currFile%
 
  ;check if the current item is a folder, otherwise move it as a file
  if(instr(fileExist(currFile),"D"))
  {
    msgbox, "Is folder"
    SplitPath, currFile, currFileFolderName  ;Extract only the folder name from its full path.
    FileCopyDir, %currFile%, %targetDir%\%currFileFolderName%
  }
  else
  {
   msgbox, %currFile% -> %targetDir%\
   FileCopy, %currFile%, %targetDir%\
  }
}

;clear clipboard afterwards
clipboard:=""

return