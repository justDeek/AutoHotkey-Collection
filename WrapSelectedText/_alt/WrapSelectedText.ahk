sendMode input
return ; end of auto-execute
;---------------------------

#!l::
goTo, log_info      ;   Log.Info("text")
#!v::
goTo, log_value     ;   Log.Value(() => text)
#!a::
goTo, log_array     ;   Log.Array(text)
#!w::
goTo, log_warn      ;   Log.Warn(text)
#!e::
goTo, log_error     ;   Log.Error("text")

!#s::
goTo, wrap_summary ;   ///<summary>text</summary>
!#g::
goTo, wrap_class ; [Summary("text")]

;-----------------------

log_info:
log_value:
log_array:
log_warn:
log_error:
wrap_summary:
wrap_class:
this_label := a_thisLabel
clipboard_text := trim(get_clipboard())
for what, with in { "log_info"     : "Log.Info($""" clipboard_text """);"
                  , "log_value"    : "Log.Value(() => " clipboard_text ");"
                  , "log_array"    : "Log.Array(" clipboard_text ");"
                  , "log_warn"     : "Log.Warn($""" clipboard_text """);"
                  , "log_error"    : "Log.Error($""" clipboard_text """);"
                  , "wrap_summary" : "///<summary>" clipboard_text "</summary>"
                  , "wrap_class"   : "`n///<summary>" clipboard_text "</summary>" "`n[Summary(""" clipboard_text """)]"}
    stringReplace, this_label, this_label, % what, % with, all
new_text := trim(this_label)
goSub, send_wrap
return

send_wrap:
if !inStr(a_thisHotkey, ":") and if (clipboard = "")       ; if hotkey was used
     position := "{Left " round( strLen(new_text) / 2) "}" ; move cursor between symbols
else position := ""
clipboard := new_text

if inStr(clipboard, "Log")
{
  send, {end} `n
}

send % "^{v}" . position
sleep 150
clipboard := revert_clipboard
return

get_clipboard() {
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

    replace_left("/// <summary>")
    replace_left("///<summary>")
    replace_left("/// ")
    replace_left("///")
    replace_left("//")
    replace_right("</summary>")

    return clipboard
}

replace_left(to_replace) {
  global
  if inStr(clipboard, to_replace)
  {
    StringTrimLeft, clipboard, clipboard, strlen(to_replace)
  }
}

replace_right(to_replace) {
  global
  if inStr(clipboard, to_replace)
  {
    StringTrimRight, clipboard, clipboard, strlen(to_replace)
  }
}