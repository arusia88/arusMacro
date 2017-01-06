CoordMode,Pixel,Screen

numMana = 2
numHeal = 3
numDoubleHeal = 4
numImmotal = 5
numIncreaseDamage = 8
numReduceDefece = 7
isFixTap = 0

#a::
; Init all enviroment variables
minHPRate := 0.8
minMPRate := 0.2

ImageSearch, fullHpX, fullHpY,960,500,A_ScreenWidth,A_ScreenHeight, *80 resources/hpPositionImage.png
If ErrorLevel = 0
{
	MsgBox, Identify HP Gage Position: %fullHpX%, y : %fullHpY%
}
else {
	MsgBox, , , TestText
}

hpCoverRangeX := fullHpX + 123 * (1-minHPRate)

ImageSearch, fullMpX, fullMpY,960,500,A_ScreenWidth,A_ScreenHeight, *80 resources/mpPositionImage.png
If ErrorLevel = 0
{
	MsgBox, Identify MP Gage Position: %fullMpX%, y : %fullMpY%
}

mpCoverRangeX := fullMpX + 123 * (1-minMPRate)
;MsgBox, Result1 : %fullHpX%, y : %fullHpY% / %fullMpX%, y : %fullMpY% / %hpCoverRangeX% / %mpCoverRangeX%
return

#s::
;Fix tap to Right toself
;MsgBox, Result2: %fullHpX%, y : %fullHpY% / %fullMpX%, y : %fullMpY% / %hpCoverRangeX% / %mpCoverRangeX%
ControlSend,,{esc}{tab}{home}{Right}{tab},self
;SetTimer, move, 50
SetTimer, giveHealToTarget, 500
SetTimer, giveDoubleHealToTarget, 5000
SetTimer, giveHealToSelf, 500
SetTimer, giveManaToSelf, 500
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

#z::
gosub, movePotal
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

move:
CoordMode, Pixel, Relative
ImageSearch,selfX,selfY,0,0,A_ScreenWidth,A_ScreenHeight, *Trans0xffffff *80 resources/RaDetail.png
If ErrorLevel = 0
{
	;MsgBox, Identifyself position X: %selfX% Y: %selfY%
}
; ReDetail mean target's character
ImageSearch, targetX,targetY,0,0,A_ScreenWidth,A_ScreenHeight, *Trans0xffffff *80 resources/ReDetail.png
If ErrorLevel = 0
{
	;no active state
	;MouseClick, left, OutX, OutY
	targetXonWins := Round((targetX-selfX) / 48)
	targetYonWins := Round((targetY-selfY) / 51)

	;MsgBox, target X: %targetXonWins% Y: %targetYonWins%

	;send certain(target) windows
	if (targetXonWins > 0){
		ControlSend,,{Right},self
	}
	if (targetXonWins < 0){
		ControlSend,,{Left},self
	}
	if (targetYonWins > 0){
		ControlSend,,{Down},self
	}
	if (targetYonWins < 0){
		ControlSend,,{Up},self
	}
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

movePotal:
ImageSearch,selfX,selfY,960,0,A_ScreenWidth,A_ScreenHeight, *Trans0xffffff *80 resources/RaDetail.png
If ErrorLevel = 0
{
	;MsgBox, Identifyself position X: %selfX% Y: %selfY%
}
return
Loop
{
ImageSearch, potalX,potalY,960,0,A_ScreenWidth,A_ScreenHeight, *Trans0x000000 *80 resources/potal.png
	If ErrorLevel = 0
	{
		;MsgBox, potalX: %potalX% potalY: %potalY%
		;MsgBox,selfX: %selfX%selfY: %selfY%
		potalXonWins := Round((potalX -selfX) / 63)
		potalYonWins := Round((potalY -selfY) / 25)-1
		MsgBox, Remaing potal X: %potalXonWins% Y: %potalYonWins%
		tmpX:=Abs(potalXonWins)
		tmpY:=Abs(potalYonWins)
		break
	}
}


Loop, %tmpX%
{
	if (potalXonWins > 0){
		ControlSend,,{Right},self
	}
	else if (potalXonWins < 0){
		ControlSend,,{Left},self
	}
	Sleep,500
}
Loop, %tmpY%
{
	if (potalYonWins > 0){
		ControlSend,,{Down},self
	}
	else if (potalYonWins < 0){
		ControlSend,,{Up},self
	}
	Sleep,500
}
return
