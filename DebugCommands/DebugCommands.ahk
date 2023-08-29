#Persistent

;Logging

^!d:: ;Ctrl+Alt+D
	Send Debug.Log("");
	Send, {Left 3}
Return

^!w:: ;Ctrl+Alt+W
	Send Debug.LogWarning("");
	Send, {Left 3}
Return

^!e:: ;Ctrl+Alt+E
	Send Debug.LogError("");
	Send, {Left 3}
Return


;Attributes

^!h:: ;Ctrl+Alt+H
	Send [Header("")]
	Send, {Left 3}
Return

^!t:: ;Ctrl+Alt+T
	Send [Tooltip("")]
	Send, {Left 3}
Return