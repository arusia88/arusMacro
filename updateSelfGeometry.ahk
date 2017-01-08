F1::
CoordMode,Pixel,Screen
gosub, findPositionX
SetTimer, updateSelfGeometry, 3000

Return

findPositionX:
WinGetPos, findSelfX, findSelfY, findSelfWidth, findSelfHeight, self
ImageSearch, standX, standY, findSelfX+880, findSelfY+750, findSelfX+findSelfWidth, findSelfY+findSelfHeight, *transFFFFFF *80 resources/X.bmp
if ErrorLevel=0
{
    MsgBox, find selfXposition : %standX%, %standY%

}

rangeX100a2:= standX + 20
rangeX100b2:= standX + 28
rangeX10a2:= standX + 29
rangeX10b2:= standX + 37
rangeX1a2:= standX + 38
rangeX1b2:= standX + 46
rangeY100a2:= standX + 78
rangeY100b2:= standX + 86
rangeY10a2:= standX + 87
rangeY10b2:= standX + 95
rangeY1a2:= standX + 96
rangeY1b2:= standX + 104
rangeYtop2:= standY
rangeYbottom2:= standY + 10

geometryX2 := 0
geometryY2 := 0
Return

updateSelfGeometry:
;msgbox, x: %rangeX100a2% ~ %rangeX100b2% y: : %rangeYtop2% ~ %rangeYBottom2%
;
X100=0
Loop, 2
{

    ImageSearch, xX1001, xY1001, rangeX100a2, rangeYtop2, rangeX100b2, rangeYbottom2, *TransFFFFFF *80 resources\%X100%.bmp
    if(ErrorLevel=1){
        X100:=X100+1
        ;MsgBox, find 100!!
    }
    else if(ErrorLevel=0){
        ;MsgBox, find 100!!
        break
    }
}
X10=0
Loop, 9
{
    ImageSearch, xX101, xY101, rangeX10a2, rangeYtop2, rangeX10b2, rangeYbottom2, *TransFFFFFF *80 resources\%X10%.bmp
    if(ErrorLevel=1){
        X10:=X10+1
    }
    else if(ErrorLevel=0){
        break
    }
}
X1=0
Loop, 9
{
    ImageSearch, xX11, xY11, rangeX1a2, rangeYtop2, rangeX1b2, rangeYbottom2, *TransFFFFFF *80 resources\%X1%.bmp
    if(ErrorLevel=1){
        X1:=X1+1
    }
    else if(ErrorLevel=0){
        break
    }
}
Y100=0
Loop, 2
{
    ImageSearch, yX1001, yY1001, rangeY100a2, rangeYtop2, rangeY100b2, rangeYbottom2, *TransFFFFFF *80 resources\%Y100%.bmp
    if(ErrorLevel=1){
        Y100:=Y100+1
    }
    else if(ErrorLevel=0){
        break
    }
}
Y10=0
Loop, 9
{
    ImageSearch, yX101, yY101, rangeY10a2, rangeYtop2, rangeY10b2, rangeYbottom2, *TransFFFFFF *80 resources\%Y10%.bmp
    if(ErrorLevel=1){
        Y10:=Y10+1
    }
    else if(ErrorLevel=0){
        break
    }
}
Y1=0
Loop, 9
{
    ImageSearch, yX11, yY11, rangeY1a2, rangeYtop2, rangeY1b2, rangeYbottom2, *TransFFFFFF *80 resources\%Y1%.bmp
    if(ErrorLevel=1){
        Y1:=Y1+1
    }
    else if(ErrorLevel=0){
        break
    }
}
geometryX2:=(X100*100)+(X10*10)+(X1)
geometryY2:=(Y100*100)+(Y10*10)+(Y1)

SetTitleMatchMode, 2
DetectHiddenWindows, On   ; main script window is hidden
SendMessage,  7000, geometryX2, geometryY2, , ArusMacro

return
