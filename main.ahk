
#a::
; Init all enviroment variables
minHPRate := 0.8
minMPRate := 0.2


ImageSearch, fullHpX, fullHpY,960,500,A_ScreenWidth,A_ScreenHeight, *80 resources/hpPositionImage.png
	If ErrorLevel = 0
	{
		MsgBox, Identify HP Gage Position: %fullHpX%, y : %fullHpY%
	}

hpCoverRangeX := fullHpX + 123 * (1-minHPRate)

ImageSearch, fullMpX, fullMpY,960,500,A_ScreenWidth,A_ScreenHeight, *80 resources/mpPositionImage.png
	If ErrorLevel = 0
	{
		MsgBox, Identify MP Gage Position: %fullMpX%, y : %fullMpY%
	}

mpCoverRangeX := fullMpX + 123 * (1-minMPRate)
return

#s::
;Fix tap to Right to self
ControlSend,,{esc}{tab}{home}{Right}{tab}, target
SetTimer, move, 50
SetTimer, giveHealToTarget, 500
SetTimer, giveDoubleHealToTarget, 5000
SetTimer, giveHealToSelf, 500
SetTimer, giveManaToSelf, 500
return

#q::
gosub, workDamageUp
return

#d::
SetTimer, move, off
SetTimer, giveHealToTarget, off
SetTimer, giveDoubleHealToTarget, off
SetTimer, giveHealToSelf, off
SetTimer, giveManaToSelf, off

return

#z::
movePotal()
return

giveHealToSelf:
giveHealToSelf()
return

giveManaToSelf:
giveManaToSelf()
return
	
move:
moveSelf()	
return

giveHealToTarget:
giveHealToTarget()
return

giveDoubleHealToTarget:
giveDoubleHealToTarget()
return

workDamageUp:
workDamageUp()
return

movePotal:
movePotal()
return


;
;	First section is about magic.
;	Fire skills at target character by your goal.
;

	numHeal := 3
	numDoubleHeal := 4
	numDamageUp :=8
	numImmotal :=5
	numReduceDefece := 7
	isFixTap := 0

	giveHealToSelf()
	{
		CoordMode,Mouse,Screen
		ImageSearch,OutX,OutY, fullHpX+1, fullHpY+1, fullHpX+3, fullHpY+1, hpImage.png
		if ErrorLevel = 0
		{
			;MsgBox, It's OKay about HP
		}
		else if ErrorLevel = 1
		{
			;MsgBox, Target need to be getting a HP
			ControlSend,,{Esc}{3}{Home}{Enter}, self // self is my windows name
			;Release tap
			isFixTap := 0
		}
	}

	giveManaToSelf()
	{
		CoordMode,Mouse,Screen
		ImageSearch,Out2X,Out2Y, fullMpX+51, fullMpY+1, fullMpX+54, fullMpY+1, mpImage.png
		if ErrorLevel = 0
		{
			;MsgBox, It's Okay about MP
		}
		else if ErrorLevel = 1
		{
			;MsgBox, Target need to be getting a MP
			ControlSend,,{2}, self
		}

	}

	giveHealToTarget()
	{
		if(isFixTap = 0){
			ControlSend,,{tab}{tab}, target
			isFixTap := 1
		}
		ControlSend,,{%numHeal%}, target
	}

	giveDoubleHealToTarget()
	{
		if(isFixTap = 0){
			ControlSend,,{tab}{tab}, target
			isFixTap := 1
		}
		ControlSend,,{%numDoubleHeal%}, target
		Sleep, 500
		ControlSend,,{%numImmotal%}, target
	}

	workDamageUp()
	{
		ControlSend,,{%numDamageUp%}, target
		Sleep, 500
		ControlSend,,{%numReduceDefece%}, target
	}

; 
;	Following section is about move algorithm. 
;	By comparing with characters name position, Calculate position difference.
; 

	moveSelf()
	{
		updateSelfPosition()
		; for using on not active 
		CoordMode,Mouse,Screen
		; ReDetail mean target's character
		ImageSearch, targetX,targetY,960,0,A_ScreenWidth,A_ScreenHeight, *Trans0xffffff *80 resources/ReDetail.png
		If ErrorLevel = 0
		{
			;no active state
			;MouseClick, left, OutX, OutY
			targetXonWins := Round((targetX - selfX) / 48)
			targetYonWins := Round((targetY - selfY) / 51)
			
			;MsgBox, target X: %targetXonWins% Y: %targetYonWins%
			
			;send certain(target) windows
			if (targetXonWins > 0){
				ControlSend,,{Right}, self
			}
			if (targetXonWins < 0){
				ControlSend,,{Left}, self
			}
			if (targetYonWins > 0){
				ControlSend,,{Down}, self
			}
			if (targetYonWins < 0){
				ControlSend,,{Up}, self
			}
		}
	}

	movePotal()
	{
		updateSelfPosition()
		Loop
		{
		ImageSearch, potalX,potalY,960,0,A_ScreenWidth,A_ScreenHeight, *Trans0x000000 *80 resources/potal.png
			If ErrorLevel = 0
			{
				;MsgBox, potalX: %potalX% potalY: %potalY%
				;MsgBox, selfX: %selfX% selfY: %selfY%
				potalXonWins := Round((potalX - selfX) / 63)
				potalYonWins := Round((potalY - selfY) / 25)-1
				MsgBox, Remaing potal X: %potalXonWins% Y: %potalYonWins%
				tmpX:=Abs(potalXonWins)
				tmpY:=Abs(potalYonWins)
				break
			}
		}


		Loop, %tmpX%
		{
			if (potalXonWins > 0){
				ControlSend,,{Right}, self
			}
			else if (potalXonWins < 0){
				ControlSend,,{Left}, self
			}
			Sleep,500
		}
		Loop, %tmpY%
		{
			if (potalYonWins > 0){
				ControlSend,,{Down}, self
			}
			else if (potalYonWins < 0){
				ControlSend,,{Up}, self
			}
			Sleep,500
		}

	}

	updateSelfPosition() 
	{
		; Init target position, *RaDetail.png means target chracter
		CoordMode,Mouse,Screen
		ImageSearch,selfX,selfY,960,0,A_ScreenWidth,A_ScreenHeight, *Trans0xffffff *80 resources/RaDetail.png
		If ErrorLevel = 0
		{
			;MsgBox, Identify self position X: %selfX% Y: %selfY%
		}
		return
	}