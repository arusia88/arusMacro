#Include lib/Magic.ahk
#Include lib/Move.ahk


moveInstance := new Move()
magicInstance := new Magic()

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
moveInstance.movePotal();
return

giveHealToSelf:
magicInstance.giveHealToSelf()
return

giveManaToSelf:
magicInstance.giveManaToSelf()
return
	
move:
moveInstance.moveSelf()	
return

giveHealToTarget:
magicInstance.giveHealToTarget()
return

giveDoubleHealToTarget:
magicInstance.giveDoubleHealToTarget()
return

workDamageUp:
workDamageUp()
return

movePotal:
moveInstance.movePotal()
return