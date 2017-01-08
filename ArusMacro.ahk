#SingleInstance, force

OnMessage(6000, "Test")
return

Test(wparam,lparam, msg)
{
;MsgBox, receive  geometryX1 : %wparam%, geometryY1 : %lparam%
global geometryX1 := wparam
global geometryY1 := lparam
}

CoordMode,Pixel,Screen

numMana = 2
numHeal = 3
numDoubleHeal = 4
numImmotal = 5
numIncreaseDamage = 8
numReduceDefece = 7
isFixTap = 0

; Set enviroment
#a::
; How much you want to maintain mp, hp
minHPRate := 0.8
minMPRate := 0.2

conditionHP := 0
conditionMP := 0
conditionGeo2 := 0

startRandTimer := A_TickCount


ImageSearch, standSelfX, standSelfY, 1530, 750, 1616, 805, *transFFFFFF *80 resources/X.bmp
if ErrorLevel=0
{
    MsgBox, X position on self  : %standSelfX%, %standSelfY%
    conditionGeo2 := 1

}


ImageSearch, fullHpX, fullHpY,0,0,A_ScreenWidth,A_ScreenHeight, *80 resources/hpPositionImage.png
If ErrorLevel = 0
{
    conditionHP := 1
    MsgBox, Identify HP Gage Position: %fullHpX%, y : %fullHpY%
}

hpCoverRangeX := fullHpX + 123 * (1-minHPRate)

ImageSearch, fullMpX, fullMpY,0,0,A_ScreenWidth,A_ScreenHeight, *80 resources/mpPositionImage.png
If ErrorLevel = 0
{
    conditionMP := 1
    MsgBox, Identify MP Gage Position: %fullMpX%, y : %fullMpY%
}

mpCoverRangeX := fullMpX + 123 * (1-minMPRate)


if (conditionMP=1 and conditionHP=1 and conditionGeo2=1) {
    MsgBox Realize hp, mp, geometry info.
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



return

#s::
;Fix tap to Right toself
;MsgBox, Result2: %fullHpX%, y : %fullHpY% / %fullMpX%, y : %fullMpY% / %hpCoverRangeX% / %mpCoverRangeX%
ControlSend,,{esc}{tab}{home}{Right}{tab},self

SetTimer, updateSelfGeometry, 300
SetTimer, move, 100
SetTimer, randomMove, 2000
 ; SetTimer, giveHealToTarget, 500
 ; SetTimer, giveDoubleHealToTarget, 5000
 ; SetTimer, giveHealToSelf, 500
 ; SetTimer, giveManaToSelf, 50
return

#d::
gosub, workDamageUp
return

#f::
SetTimer, giveHealToTarget, off
SetTimer, giveDoubleHealToTarget, off
SetTimer, giveHealToSelf, off
SetTimer, giveManaToSelf, off

return

#q::
WinSetTitle,바람의나라,,target
return

#w::
WinSetTitle,바람의나라,,self
return

#e::
ControlSend,,{Up}, 바람의나라
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

updateSelfGeometry:
;msgbox, x: %rangeX100a2% ~ %rangeX100b2% y: : %rangeYtop2% ~ %rangeYBottom2%
X100=0
i:=2
Loop, 2
{

    ImageSearch, xX1001, xY1001, rangeX100a%i%, rangeYtop%i%, rangeX100b%i%, rangeYbottom%i%, *TransFFFFFF *80 resources\%X100%.bmp
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
    ImageSearch, xX101, xY101, rangeX10a%i%, rangeYtop%i%, rangeX10b%i%, rangeYbottom%i%, *TransFFFFFF *80 resources\%X10%.bmp
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
    ImageSearch, xX11, xY11, rangeX1a%i%, rangeYtop%i%, rangeX1b%i%, rangeYbottom%i%, *TransFFFFFF *80 resources\%X1%.bmp
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
    ImageSearch, yX1001, yY1001, rangeY100a%i%, rangeYtop%i%, rangeY100b%i%, rangeYbottom%i%, *TransFFFFFF *80 resources\%Y100%.bmp
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
    ImageSearch, yX101, yY101, rangeY10a%i%, rangeYtop%i%, rangeY10b%i%, rangeYbottom%i%, *TransFFFFFF *80 resources\%Y10%.bmp
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
    ImageSearch, yX11, yY11, rangeY1a%i%, rangeYtop%i%, rangeY1b%i%, rangeYbottom%i%, *TransFFFFFF *80 resources\%Y1%.bmp
    if(ErrorLevel=1){
        Y1:=Y1+1
    }
    else if(ErrorLevel=0){
        break
    }
}
geometryX%i%:=(X100*100)+(X10*10)+(X1)
geometryY%i%:=(Y100*100)+(Y10*10)+(Y1)

gosub, move
;msgBox, result 22222: taget %geometryX1%, %geometryY1% / self %geometryX2%, %geometryY2%
Return

isValidGeometryInfo(){
    distX := geometryX2-geometryX1
    distY := geometryY2-geometryY1
    dist := Sqrt(distX*distX + distY*distY)
    if (dist < 10)
        return True
    Else
        return False
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

move:
; When distance over than max, It is false value.
if(!isValidGeometryInfo()) {
    return;
}
if(geometryY1>geometryY2){
    ControlSend,, {down},self
}
if(geometryY1<geometryY2){
    ControlSend,, {up},self
}
if(geometryX1>geometryX2){
    ControlSend,, {right},self
}
if(geometryX1<geometryX2){
    ControlSend,, {Left},self
}
return

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

