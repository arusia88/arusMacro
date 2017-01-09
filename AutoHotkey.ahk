; Run, %A_AHKPath% %A_ScriptDir%\updateSelfGeometry.ahk

Run, %A_AHKPath% %A_ScriptDir%\ArusMacro.ahk,,,Instance#1_pid
WinWait, ahk_pid %Instance#1_pid%  ; wait for main script window to be created

CoordMode,Pixel,Screen

#z::
gosub, findTarget
SetTimer, sendGeometry, 3000

Return

findTarget:
gosub, findPositionX
gosub, updateTargetGeometry
MsgBox, target position : %geometryX1%, %geometryY1%
Return

sendGeometry:
gosub, updateTargetGeometry
gosub, sendTargetGeometry
return

findPositionX:

WinGetPos, findTargetX, findTargetY, findTargetWidth, findTargetHeight, target
ImageSearch, standTargetX, standTargetY, findTargetX+880, findTargetY+750, findTargetX+findTargetWidth, findTargetY+findTargetHeight, *transFFFFFF *80 resources/X.bmp

standX := standTargetX
standY := standTargetY

rangeX100a1:= standX + 20
rangeX100b1:= standX + 28
rangeX10a1:= standX + 29
rangeX10b1:= standX + 37
rangeX1a1:= standX + 38
rangeX1b1:= standX + 46
rangeY100a1:= standX + 78
rangeY100b1:= standX + 86
rangeY10a1:= standX + 87
rangeY10b1:= standX + 95
rangeY1a1:= standX + 96
rangeY1b1:= standX + 104
rangeYtop1:= standY
rangeYbottom1:= standY + 10

geometryX1 := 0
geometryY1 := 0

Return

updateTargetGeometry:
j:=1
TX100=0
Loop, 2
{

    ImageSearch, xX1001, xY1001, rangeX100a%j%, rangeYtop%j%, rangeX100b%j%, rangeYbottom%j%, *TransFFFFFF *80 resources\%TX100%.bmp
    if(ErrorLevel=1){
        TX100:=TX100+1
        ;MsgBox, find 100!!
    }
    else if(ErrorLevel=0){
        ;MsgBox, find 100!!
        break
    }
}
TX10=0
Loop, 9
{
    ImageSearch, xX101, xY101, rangeX10a%j%, rangeYtop%j%, rangeX10b%j%, rangeYbottom%j%, *TransFFFFFF *80 resources\%TX10%.bmp
    if(ErrorLevel=1){
        TX10:=TX10+1
    }
    else if(ErrorLevel=0){
        break
    }
}
TX1=0
Loop, 9
{
    ImageSearch, xX11, xY11, rangeX1a%j%, rangeYtop%j%, rangeX1b%j%, rangeYbottom%j%, *TransFFFFFF *80 resources\%TX1%.bmp
    if(ErrorLevel=1){
        TX1:=TX1+1
    }
    else if(ErrorLevel=0){
        break
    }
}
TY100=0
Loop, 2
{
    ImageSearch, yX1001, yY1001, rangeY100a%j%, rangeYtop%j%, rangeY100b%j%, rangeYbottom%j%, *TransFFFFFF *80 resources\%TY100%.bmp
    if(ErrorLevel=1){
        TY100:=TY100+1
    }
    else if(ErrorLevel=0){
        break
    }
}
TY10=0
Loop, 9
{
    ImageSearch, yX101, yY101, rangeY10a%j%, rangeYtop%j%, rangeY10b%j%, rangeYbottom%j%, *TransFFFFFF *80 resources\%TY10%.bmp
    if(ErrorLevel=1){
        TY10:=TY10+1
    }
    else if(ErrorLevel=0){
        break
    }
}
TY1=0
Loop, 9
{
    ImageSearch, yX11, yY11, rangeY1a%j%, rangeYtop%j%, rangeY1b%j%, rangeYbottom%j%, *TransFFFFFF *80 resources\%TY1%.bmp
    if(ErrorLevel=1){
        TY1:=TY1+1
    }
    else if(ErrorLevel=0){
        break
    }
}
geometryX%j%:=(TX100*100)+(TX10*10)+(TX1)
geometryY%j%:=(TY100*100)+(TY10*10)+(TY1)
return

sendTargetGeometry:
DetectHiddenWindows, On   ; main script window is hidden
WinGet, hwnd#1, ID, ahk_pid %Instance#1_pid%
SendMessage,  6000, geometryX1, geometryY1, , ahk_id %hwnd#1%
return

