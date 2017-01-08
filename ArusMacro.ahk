#SingleInstance, force
OnMessage(7000, "receiveSelfGeo")
OnMessage(6000, "receiveTargetGeo")
return

receiveTargetGeo(wparam,lparam, msg){

if (wparam = 0 and lparam = 0)
    Return
if (wparam = 299 and lparam = 299)
    Return

;MsgBox, receive  geometryX1 : %wparam%, geometryY1 : %lparam%
global geometryX1 := wparam
global geometryY1 := lparam

}

receiveSelfGeo(wparam, lparam) {
MsgBox, receive from self  geometryX1 : %wparam%, geometryY1 : %lparam%
if (wparam = 0 and lparam = 0)
    Return
if (wparam = 299 and lparam = 299)
    Return

global geometryX2 = wparam
global geometryY2 = lparam

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

ImageSearch, fullHpX, fullHpY,0,0,A_ScreenWidth,A_ScreenHeight, *80 resources/hpPositionImage.png
If ErrorLevel = 0
{
    conditionHP := 1
    ;MsgBox, Identify HP Gage Position: %fullHpX%, y : %fullHpY%
}

hpCoverRangeX := fullHpX + 123 * (1-minHPRate)

ImageSearch, fullMpX, fullMpY,0,0,A_ScreenWidth,A_ScreenHeight, *80 resources/mpPositionImage.png
If ErrorLevel = 0
{
    conditionMP := 1
    ;MsgBox, Identify MP Gage Position: %fullMpX%, y : %fullMpY%
}

mpCoverRangeX := fullMpX + 123 * (1-minMPRate)

if (conditionMP=1 and conditionHP=1) {
    ;MsgBox Realize hp, mp, geometry info.
}

return

#s::
;Fix tap to Right toself
;MsgBox, Result2: %fullHpX%, y : %fullHpY% / %fullMpX%, y : %fullMpY% / %hpCoverRangeX% / %mpCoverRangeX%
ControlSend,,{esc}{tab}{home}{Right}{tab},self
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

;If you can't change baram processName, Save your file .Encoding to euc-kr
#q::
WinSetTitle,바람의나라,,target
return

^w::
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

move:
; When distance over than max, It is false value.
; if(!isValidGeometryInfo()) {
;     return
; }

;msgBox, final result : taget %geometryX1%, %geometryY1% / self %geometryX2%, %geometryY2% / dist: %dist%
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

isValidGeometryInfo(){
    ;msgBox, isValidGeometryInfo result : taget %geometryX1%, %geometryY1% / self %geometryX2%, %geometryY2% / dist: %dist%
    if(geometryX1 * geometryY1 * geometryX2 * geometryY2 < 0){
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

