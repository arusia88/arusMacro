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
conditionGeo1 := 0
conditionGeo2 := 0

Loop {
	tryCount++
	If ( tryCount > 50 or (conditionGeo1 = 1 and conditionGeo2 = 1) ) {
		break
	}
	ImageSearch, standTargetX, standTargetY, 820, 770, 1024, 805, *transFFFFFF *80 resources/X.bmp
	if ErrorLevel=0
	{
		MsgBox, X position on Target : %standTargetX%, %standTargetY%
		conditionGeo1 := 1
	}
	ImageSearch, standSelfX, standSelfY, 1483, 913, 1616, 937, *transFFFFFF *80 resources/X.bmp
	if ErrorLevel=0
	{
		MsgBox, X position on self  : %standSelfX%, %standSelfY%
		conditionGeo2 := 1

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


if (conditionMP=1 and conditionHP=1 and conditionGeo1=1 and conditionGeo2 =1) {
	MsgBox Realize hp, mp, geometry info.
}

Loop, 2{
	; Index 1 mean target , Index 2 mean self
	if (A_Index = 1) {
		standX := standTargetX
		standY := standTargetY
	} else {
		standX := standSelfX
		standY := standSelfY
	}
	rangeX100a%A_Index%:= standX + 20
	rangeX100b%A_Index%:= standX + 28
	rangeX10a%A_Index%:= standX + 29
	rangeX10b%A_Index%:= standX + 37
	rangeX1a%A_Index%:= standX + 38
	rangeX1b%A_Index%:= standX + 46
	rangeY100a%A_Index%:= standX + 78
	rangeY100b%A_Index%:= standX + 86
	rangeY10a%A_Index%:= standX + 87
	rangeY10b%A_Index%:= standX + 95
	rangeY1a%A_Index%:= standX + 96
	rangeY1b%A_Index%:= standX + 104
	rangeYtop%A_Index%:= standY
	rangeYbottom%A_Index%:= standY + 10

	geometryX%A_Index% := 0
	geometryY%A_Index% := 0


}
return

#s::
;Fix tap to Right toself
;MsgBox, Result2: %fullHpX%, y : %fullHpY% / %fullMpX%, y : %fullMpY% / %hpCoverRangeX% / %mpCoverRangeX%
ControlSend,,{esc}{tab}{home}{Right}{tab},self
SetTimer, move, 50
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


move:

Loop, 2 {

	;msgbox, x: %rangeX100a2% ~ %rangeX100b2% y: : %rangeYtop2% ~ %rangeYBottom2%
	X100=0
	i++
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

	if(i=2){
		i:=0
	}

	;MsgBox, result : target  %geometryX1%, %geometryY1% / self %geometryX2%, %geometryY2%
}

; Todo: we need to find target's geometry
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

