Run, %A_AHKPath% %A_ScriptDir%\receiver.ahk,,,Instance#1_pid
WinWait, ahk_pid %Instance#1_pid%  ; wait for main script window to be created

F1::
DetectHiddenWindows, On   ; main script window is hidden
WinGet, hwnd#1, ID, ahk_pid %Instance#1_pid%
SendMessage,  6000, , , , ahk_id %hwnd#1%
return