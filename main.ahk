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
conditionGeo := 0

geometry[x] := 0
geometry[y] := 0

Loop {
	tryCount++
	If (tryCount > 50) {
		break
	}
	ImageSearch, standX, standY, 0, 0, 1400, 1400, *transFFFFFF resources/X.bmp
	if ErrorLevel=0
	{
		conditionGeo := 1
		break
	}
}

ImageSearch, fullHpX, fullHpY,960,500,A_ScreenWidth,A_ScreenHeight, *80 resources/hpPositionImage.png
If ErrorLevel = 0
{
	conditionHP := 1
	;MsgBox, Identify HP Gage Position: %fullHpX%, y : %fullHpY%
}

hpCoverRangeX := fullHpX + 123 * (1-minHPRate)

ImageSearch, fullMpX, fullMpY,960,500,A_ScreenWidth,A_ScreenHeight, *80 resources/mpPositionImage.png
If ErrorLevel = 0
{
	conditionMP := 1
	;MsgBox, Identify MP Gage Position: %fullMpX%, y : %fullMpY%
}

mpCoverRangeX := fullMpX + 123 * (1-minMPRate)


if (conditionMP=1 and conditionHP=1 and conditionGeo=1) {
	MsgBox Realize hp, mp, geometry info.
}

pos1[rangeX100a]:= standX + 20
pos1[rangeX100b]:= standX + 28
pos1[rangeX10a]:= standX + 29
pos1[rangeX10b]:= standX + 37
pos1[rangeX1a]:= standX + 38
pos1[rangeX1b]:= standX + 46
pos1[rangeY100a]:= standX + 78
pos1[rangeY100b]:= standX + 86
pos1[rangeY10a]:= standX + 87
pos1[rangeY10b]:= standX + 95
pos1[rangeY1a]:= standX + 96
pos1[rangeY1b]:= standX + 104
pos1[rangeYtop]:= standY
pos1[rangeYbottom]:= standY + 10

return

#s::
;Fix tap to Right toself
;MsgBox, Result2: %fullHpX%, y : %fullHpY% / %fullMpX%, y : %fullMpY% / %hpCoverRangeX% / %mpCoverRangeX%
ControlSend,,{esc}{tab}{home}{Right}{tab},self
Loop{
	Gosub, move
}
SetTimer, giveHealToTarget, 500
SetTimer, giveDoubleHealToTarget, 5000
SetTimer, giveHealToSelf, 500
SetTimer, giveManaToSelf, 50
return

#d::
gosub, workDamageUp
return

#f::
;SetTimer, move, off
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

updateGeomtry(ByRef findRange, ByRef result){
X100=0
Loop, 2
{
ImageSearch, xX1001, xY1001, %findRange[rangeX100a]%, %findRange[rangeYtop]%, %findRange[rangeX100b]%, %findRange[rangeYbottom]%, *TransFFFFFF img\%X100%.bmp
if(ErrorLevel=1){
X100:=X100+1
}
else if(ErrorLevel=0){
break
}
}
X10=0
Loop, 9
{
ImageSearch, xX101, xY101, %findRange[rangeX10a]%, %findRange[rangeYtop]%, %findRange[rangeX10b]%, %findRange[rangeYbottom]%, *TransFFFFFF img\%X10%.bmp
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
ImageSearch, xX11, xY11, %findRange[rangeX1a]%, %findRange[rangeYtop]%, %findRange[rangeX1b]%, %findRange[rangeYbottom]%, *TransFFFFFF img\%X1%.bmp
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
ImageSearch, yX1001, yY1001, %findRange[rangeY100a]%, %findRange[rangeYtop]%, %findRange[rangeY100b]%, %findRange[rangeYbottom]%, *TransFFFFFF img\%Y100%.bmp
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
ImageSearch, yX101, yY101, %findRange[rangeY10a]%, %findRange[rangeYtop]%, %findRange[rangeY10b]%, %findRange[rangeYbottom]%, *TransFFFFFF img\%Y10%.bmp
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
ImageSearch, yX11, yY11, %findRange[rangeY1a]%, %findRange[rangeYtop]%, %findRange[rangeY1b]%, %findRange[rangeYbottom]%, *TransFFFFFF img\%Y1%.bmp
if(ErrorLevel=1){
Y1:=Y1+1
}
else if(ErrorLevel=0){
break
}
}
result[x]:=(X100*100)+(X10*10)+(X1)
result[y]:=(Y100*100)+(Y10*10)+(Y1)
}

move:
updateGeomtry(pos1, geometry)
; Todo: we need to find target's geometry

if(50>geometry[y]){
ControlSend,, {down},self
}
if(50<geometry[y]){
ControlSend,, {up},self
}
if(50>geometry[x]){
ControlSend,, {right},self
}
if(50<geometry[x]){
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

