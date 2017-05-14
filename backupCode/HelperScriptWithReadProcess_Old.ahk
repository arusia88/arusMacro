
#SingleInstance, force
CoordMode,Pixel,Screen

; Set enviroment
#a::
gosub, setEnvMacro

return

#s::
;Fix tap to Right toself
;MsgBox, Result2: %fullHpX%, y : %fullHpY% / %fullMpX%, y : %fullMpY% / %hpCoverRangeX% / %mpCoverRangeX%
ControlSend,,{esc}{tab}{home}{Right}{tab},self
SetTimer, move, 100
; SetTimer, sendDirectionKey, 10

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

WinGet, tpid , PID, target
WinGet, spid , PID, self

Return

move:
updatePosition(targetX, targetY, tpid)
updatePosition(selfX, selfY, spid)

; totalMoveX := Abs(targetX - selfX)
; totalMoveY := Abs(targetY - selfY)

; msgBox, move result : taget %targetX%, %targetY% / self %selfX%,  selfY% / dist: %totalMove%

if(targetY > selfY){
    ControlSend,, {down},self
}
if(targetY < selfY){
    ControlSend,, {up},self
}

if(targetX>selfX){
    ControlSend,, {right},self
}
if(targetX<selfX){
    ControlSend,, {Left},self
}
Sleep, 100


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

updatePosition(Byref x, ByRef y, pid) {

    SetFormat, integer, Hex
    baseaddr := ReadMemory(0xA9C3D8, pid)
    xaddr := baseaddr + 0x590E98
    yaddr := baseaddr + 0x590E9C

    SetFormat, Integer, Dec
    x := ReadMemory(xaddr, pid)
    y := ReadMemory(yaddr, pid)
}

isValidGeometryInfo(x, y){
    ;msgBox, isValidGeometryInfo result : taget %geometryX1%, %geometryY1% / self %geometryX2%, %geometryY2% / dist: %dist%
    if(x*y <= 0 or x >= 299 or y >= 299){
        return False
    }
    return true
}

ReadMemory(MADDRESS,pid) {

VarSetCapacity(MVALUE,4,0)
ProcessHandle := DllCall("OpenProcess", "Int", 24, "Char", 0, "UInt", pid, "UInt")
DllCall("ReadProcessMemory","UInt",ProcessHandle,"UInt",MADDRESS,"Str",MVALUE,"UInt",4,"UInt *",0)

Loop 4
result += *(&MVALUE + A_Index-1) << 8*(A_Index-1)

return, result
}

sendDirectionKey:
Loop {
    Sleep, 10
    if (GetKeystate("Left") = 1)
    {
        ControlSend, , {Left}, self
        break
    }

    if (GetKeystate("Right") = 1)
    {
        ControlSend, , {Right}, self
        break
    }

    if (GetKeystate("Up") = 1)
    {
        ControlSend, , {Up}, self
        break
    }

    if (GetKeystate("Down") = 1)
    {
        ControlSend, , {Down}, self
        break
    }
}
Return
