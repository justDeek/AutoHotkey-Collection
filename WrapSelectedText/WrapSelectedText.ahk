sendMode input
return ; end of auto-execute

;declare shortcuts
;---------------------------

!b::
goTo, wrap_bold ;      <b>text</b>
!i::
goTo, wrap_italic ;    <i>text</i>
!u::
goTo, wrap_underline ; <u>text</u>

;-----------------------


wrap_bold:
wrap_italic:
wrap_underline:
wrap_summary:
wrap_class:
this_label := a_thisLabel
clipboard_text := trim(get_clipboard())
for what, with in { "wrap_bold"  : "<b>" clipboard_text "</b>"
                  , "wrap_italic"  : "<i>" clipboard_text "</i>"
                  , "wrap_underline"   : "<u>" clipboard_text "</u>"}
    stringReplace, this_label, this_label, % what, % with, all
new_text := trim(this_label)
goSub, send_wrap
return

get_clipboard(){
    global
    if !inStr(a_thisHotkey, ":")    ; if hotkey was used
        {
        revert_clipboard := clipboardAll
        clipboard =
        send ^{c}
        clipWait, 0.3
        if clipboard is space
            clipboard =
        }

    ;clipboard := trim(clipboard)
    return clipboard
}

send_wrap:
if !inStr(a_thisHotkey, ":") and if (clipboard = "")       ; if hotkey was used
     position := "{Left " round( strLen(new_text) / 2) "}" ; move cursor between symbols
else position := ""
clipboard := new_text
send % "^{v}" . position
sleep 150
clipboard := revert_clipboard
return