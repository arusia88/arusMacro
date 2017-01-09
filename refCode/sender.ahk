; ; Run, %A_AHKPath% %A_ScriptDir%\receiver.ahk,,,Instance#1_pid
; ; WinWait, ahk_pid %Instance#1_pid%  ; wait for main script window to be created

; F1::
; SetTitleMatchMode, 2
; DetectHiddenWindows, On   ; main script window is hidden
; ; WinGet, hwnd#1, ID, ahk_pid %Instance#1_pid%
; SendMessage,  7000, a, b, ,ArusMacro
; SendMessage,  6000, a, b, ,receiver
; return

; F2::
; SetTimer, callLoop, 100
; Return

; F3::
; j:=1
; k:=1
; Return

; callLoop:
; j++
; k:=100
; Loop, %k%
; {
; 	i++
; 	Sleep, 1
; }
; MsgBox, what number : %j%, k: %k%
; Return


F1::
i++
MsgBox, queuePush %i%

queuePush(queue, i)
Return

F2::
data := queuePop(queue)

MsgBox, queuePop : %queue%
Return

queuePush(ByRef queue, data) {
	StringSplit, OutputArray, queue , `n
	if(OutputArray0 = 0){
		MsgBox, output len : 0
		queue = %data%
		} 
	queue = %queue%`n%data%
}

queuePop(ByRef queue) {
	StringSplit, OutputArray, queue , `n
	StringTrimLeft, queue, queue, 2
	return %OutputArray0%
}



