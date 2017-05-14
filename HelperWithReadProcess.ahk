#SingleInstance, force
CoordMode,Pixel,Screen

Run, %A_AHKPath% %A_ScriptDir%\updateTargetGeometry.ahk
Run, %A_AHKPath% %A_ScriptDir%\sendKeySelf.ahk

OnMessage(6000, "receiveTargetGeo")

targetQueueX = 0
targetQueueY = 0
receiveTargetGeo(wparam,lparam, msg){

    if (isValidGeometryInfo(wparam, lparam) = False)
        Return

    global geometryX1 = wparam
    global geometryY1 = lparam

    Loop {
        gosub, move2
    }


}

; Set enviroment
#a::
gosub, setEnvMacro

return

#s::
;Fix tap to Right toself
;MsgBox, Result2: %fullHpX%, y : %fullHpY% / %fullMpX%, y : %fullMpY% / %hpCoverRangeX% / %mpCoverRangeX%
ControlSend,,{esc}{tab}{home}{Right}{tab},self
Loop {
    gosub, move2
}

; SetTimer, randomMove, 2000
; SetTimer, giveHealToTarget, 500
; SetTimer, giveDoubleHealToTarget, 5000
; SetTimer, giveHealToSelf, 500
; SetTimer, giveManaToSelf, 50
return

#d::
gosub, workDamageUp

return

#f::
SetTimer, move, off
SetTimer, giveHealToTarget, off
SetTimer, giveDoubleHealToTarget, off
SetTimer, giveHealToSelf, off
SetTimer, giveManaToSelf, off
return

;****If you can't change baram processName, Save your file .Encoding to euc-kr
; reload and set
#q::
WinSetTitle,바람의나라,,target
return

#w::
WinSetTitle,바람의나라,,self
return

#e::
ControlSend,,{Up},바람의나라
return



setEnvMacro:
; Number info of skill
numMana = 2
numHeal = 3
numDoubleHeal = 4
numImmotal = 5
numIncreaseDamage = 8
numReduceDefece = 7
isFixTap = 0

; etc info
minHPRate := 0.8
minMPRate := 0.2
conditionHP := 0
conditionMP := 0

; for random move
startRandTimer := A_TickCount

ImageSearch, fullHpX, fullHpY,0,0,A_ScreenWidth,A_ScreenHeight, *80 resources/hpPositionImage.png
If ErrorLevel = 0
{
    conditionHP := 1
}

hpCoverRangeX := fullHpX + 123 * (1-minHPRate)

ImageSearch, fullMpX, fullMpY,0,0,A_ScreenWidth,A_ScreenHeight, *80 resources/mpPositionImage.png
If ErrorLevel = 0
{
    conditionMP := 1
}

mpCoverRangeX := fullMpX + 123 * (1-minMPRate)

WinGetPos, findSelfX, findSelfY, findSelfWidth, findSelfHeight, self
ImageSearch, standSelfX, standSelfY, findSelfX+880, findSelfY+750, findSelfX+findSelfWidth, findSelfY+findSelfHeight, *transFFFFFF *80 resources/X.bmp
if ErrorLevel=0
{
    ;MsgBox, X position on Self : %standSelfX%, %standSelfY%
}

standX := standSelfX
standY := standSelfY

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

gosub, updateSelfGeometry
MsgBox, self Position : %geometryX2%, %geometryY2%


Return

updateSelfGeometry:
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
tempX:=(X100*100)+(X10*10)+(X1)
tempY:=(Y100*100)+(Y10*10)+(Y1)

; When distance over than max, It is false value.
if (isValidGeometryInfo(tempX, tempY) = False) {
    return
}
geometryX2 := tempX
geometryY2 := tempY

Return

move2:
gosub, updateSelfGeometry
if(geometryY1>geometryY2){
    ControlSend,, {down},self
}
if(geometryY1<geometryY2){
    ControlSend,, {up},self
}
if(geometryY1>geometryY2){
    ControlSend,, {down},self
}
if(geometryY1<geometryY2){
    ControlSend,, {up},self
}
Return

move:
; When self geometry arrived target geometry, queuePop
; geometryX1 := queuePop(targetQueueX)
; geometryY1 := queuePop(targetQueueY)
gosub, updateSelfGeometry

totalMoveX := Abs(geometryX1 - geometryX2)
totalMoveY := Abs(geometryY1 - geometryY2)
; msgBox, move result : taget %geometryX1%, %geometryY1% / self %geometryX2%, %geometryY2% / dist: %totalMove%

Loop %totalMoveY%
{
    if(geometryY1>geometryY2){
        ControlSend,, {down},self
    }
    if(geometryY1<geometryY2){
        ControlSend,, {up},self
    }
    Sleep, 400
}
Loop %totalMoveX%
{
    if(geometryX1>geometryX2){
        ControlSend,, {right},self
    }
    if(geometryX1<geometryX2){
        ControlSend,, {Left},self
    }
    Sleep, 400
}

return

isValidGeometryInfo(x, y){
    ;msgBox, isValidGeometryInfo result : taget %geometryX1%, %geometryY1% / self %geometryX2%, %geometryY2% / dist: %dist%
    if(x*y <= 0 or x >= 299 or y >= 299){
        return False
    }
    return true
}
randomMove:
if (prevGeometryX = geometryX2 and prevGeometryY = geometryY2) {
    Random, direction , 1, 4
    if(direction = 1){
        ControlSend,, {down},self
    }
    if(direction = 2){
        ControlSend,, {up},self
    }
    if(direction = 3){
        ControlSend,, {right},self
    }
    if(direction = 4){
        ControlSend,, {Left},self
    }
}
prevGeometryX := geometryX2
prevGeometryY := geometryY2

Return

giveHealToTarget:
if(isFixTap = 0){
    ControlSend,,{tab}{tab},self
    isFixTap := 1
}
ControlSend,,{3},self
return

giveDoubleHealToTarget:
if(isFixTap = 0){
    ControlSend,,{tab}{tab},self
    isFixTap := 1
}
ControlSend,,{4},self
Sleep, 500
ControlSend,,{5},self
return

workDamageUp:
ControlSend,,{8},self
Sleep, 500
ControlSend,,{7},self
return

giveHealToSelf:
CoordMode, Pixel, Screen
ImageSearch,OutX,OutY, fullHpX+1, fullHpY+1, fullHpX+55, fullHpY+10, *80 resources/hpImage.png
if ErrorLevel = 0
{
    ;MsgBox, It's OKay about HP
}
else if ErrorLevel = 1
{
    ;MsgBox, Target need to be getting a HP : %hpCoverRangeX%
    ControlSend,,{Esc}{3}{Home}{Enter},self ;self is my windows name
    ;Release tap
    isFixTap := 0
}
return

giveManaToSelf:
CoordMode, Pixel, Screen
ImageSearch,Out2X,Out2Y, fullMpX+50, fullMpY+1, fullMpX+55, fullMpY+10, *80 resources/mpImage.png
if ErrorLevel = 0
{
    ;MsgBox, It's Okay about MP
}
else if ErrorLevel = 1
{
    ;MsgBox, Target need to be getting a MP : %mpCoverRangeX%
    ControlSend,,{%numMana%},self
}
return

queuePush(ByRef queue, data) {
    StringSplit, OutputArray, queue , `n
    if(OutputArray0 = 0){
        queue = %data%
    }
    queue = %queue%`n%data%
}

queuePop(ByRef queue) {
    StringSplit, OutputArray, queue , `n
    StringTrimLeft, queue, queue, StrLen(OutputArray1)+1
    return %OutputArray1%
}
