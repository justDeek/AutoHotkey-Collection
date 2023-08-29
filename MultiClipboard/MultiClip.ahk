; Hotkeys (Ctrl+<Num> = Copy, Ctrl+Shift+<Num> = Cut, Ctrl+Alt+<Num> = Paste)

^1::Copy(1)
^2::Copy(2)
^3::Copy(3)
^4::Copy(4)
^5::Copy(5)
^6::Copy(6)
^7::Copy(7)
^8::Copy(8)
^9::Copy(9)
^0::Copy(0)

^+1::Cut(1)
^+2::Cut(2)
^+3::Cut(3)
^+4::Cut(4)
^+5::Cut(5)
^+6::Cut(6)
^+7::Cut(7)
^+8::Cut(8)
^+9::Cut(9)
^+0::Cut(0)

^!1::Paste(1)
^!2::Paste(2)
^!3::Paste(3)
^!4::Paste(4)
^!5::Paste(5)
^!6::Paste(6)
^!7::Paste(7)
^!8::Paste(8)
^!9::Paste(9)
^!0::Paste(0)

Copy(clipboardID)
{
	global
	oldClipboard := ClipboardAll ; Save the (real) clipboard
	
	Clipboard = ; Erase the clipboard first, or else ClipWait does nothing
	Send ^c
	ClipWait, 2, 1 ; Wait 1s until the clipboard contains any kind of data
	if ErrorLevel 
	{
		Clipboard := oldClipboard ; Restore old (real) clipboard
		return
	}
	
	ClipboardData%clipboardID% := ClipboardAll
	
	Clipboard := oldClipboard ; Restore old (real) clipboard
}

Cut(clipboardID)
{
	global
	local oldClipboard := ClipboardAll ; Save the (real) clipboard
	
	Clipboard = ; Erase the clipboard first, or else ClipWait does nothing
	Send ^x
	ClipWait, 2, 1 ; Wait 1s until the clipboard contains any kind of data
	if ErrorLevel 
	{
		Clipboard := oldClipboard ; Restore old (real) clipboard
		return
	}
	ClipboardData%clipboardID% := ClipboardAll
	
	Clipboard := oldClipboard ; Restore old (real) clipboard
}

Paste(clipboardID)
{
	global
	local oldClipboard := ClipboardAll ; Save the (real) clipboard

	Clipboard := ClipboardData%clipboardID%
	Send ^v

	Clipboard := oldClipboard ; Restore old (real) clipboard
	oldClipboard = 
}