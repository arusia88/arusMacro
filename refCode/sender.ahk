; Run, %A_AHKPath% %A_ScriptDir%\receiver.ahk,,,Instance#1_pid
; WinWait, ahk_pid %Instance#1_pid%  ; wait for main script window to be created

F1::
SetTitleMatchMode, 2
DetectHiddenWindows, On   ; main script window is hidden
; WinGet, hwnd#1, ID, ahk_pid %Instance#1_pid%
SendMessage,  7000, a, b, ,ArusMacro
SendMessage,  6000, a, b, ,receiver
return

F2::
SetTimer, callLoop, 100
Return

F3::
j:=1
k:=1
Return

callLoop:
j++
k:=100
Loop, %k%
{
	i++
	Sleep, 1
}
MsgBox, what number : %j%, k: %k%
Return