#Include <Magic>
#Include <Move>

#a::
; Init all enviroment variables
minHPRate := 0.8
minMPRate := 0.2
numHeal := 3
numDoubleHeal := 4
numDamageUp :=8
numImmotal :=5
numReduceDefece := 7

ImageSearch, fullHpX, fullHpY,960,500,A_ScreenWidth,A_ScreenHeight, *80 hpPositionImage.png
	If ErrorLevel = 0
	{
		MsgBox, Identify HP Gage Position: %fullHpX%, y : %fullHpY%
	}

hpCoverRangeX := fullHpX + 123 * (1-minHPRate)

ImageSearch, fullMpX, fullMpY,960,500,A_ScreenWidth,A_ScreenHeight, *80 mpPositionImage.png
	If ErrorLevel = 0
	{
		MsgBox, Identify MP Gage Position: %fullMpX%, y : %fullMpY%
	}

mpCoverRangeX := fullMpX + 123 * (1-minMPRate)
return

#s::
;Fix tap to Right to self
ControlSend,,{esc}{tab}{home}{Right}{tab}, 슬픈라@연
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
gosub, movePotal
return

updateTargetPosition:
; Init target position, *RaDetail.png means target chracter
CoordMode,Mouse,Screen
ImageSearch,targetX,targetY,960,0,A_ScreenWidth,A_ScreenHeight, *Trans0xffffff *80 RaDetail.png
If ErrorLevel = 0
{
	;MsgBox, Identify target position X: %targetX% Y: %targetY%
}
return

giveHealToSelf:
CoordMode,Mouse,Screen
ImageSearch,OutX,OutY, fullHpX+1, fullHpY+1, fullHpX+3, fullHpY+1, hpImage.png
if ErrorLevel = 0
{
	;MsgBox, It's OKay about HP
}
else if ErrorLevel = 1
{
	;MsgBox, Target need to be getting a HP
	ControlSend,,{Esc}{3}{Home}{Enter}, 슬픈라@연
	;Release tap
	isFixTap = 0
}
return

giveManaToSelf:
CoordMode,Mouse,Screen
ImageSearch,Out2X,Out2Y, fullMpX+51, fullMpY+1, fullMpX+54, fullMpY+1, mpImage.png
if ErrorLevel = 0
{
	;MsgBox, It's Okay about MP
}
else if ErrorLevel = 1
{
	;MsgBox, Target need to be getting a MP
	ControlSend,,{2}, 슬픈라@연
}
return
	
move:
	gosub, updateTargetPosition
	;비활성화창에서도 컨트롤 하기 위해 절대값 이용
	CoordMode,Mouse,Screen
	; ReDetail은 target 케릭터 구분자 이미지
	ImageSearch, 타겟X,타겟Y,960,0,A_ScreenWidth,A_ScreenHeight, *Trans0xffffff *80 ReDetail.png
	If ErrorLevel = 0
	{
	
		;활성화된 창에서 상대좌표 기준 거리 계산 
		;MouseClick, left, OutX, OutY
		targetXonWins := Round((타겟X - targetX) / 48)
		targetYonWins := Round((타겟Y - targetY) / 51)
		
		;MsgBox, 위치 X: %targetXonWins% Y: %targetYonWins%
		
		;특정 창에 명령어 전달
		if (targetXonWins > 0){
			ControlSend,,{Right}, 슬픈라@연
		}
		if (targetXonWins < 0){
			ControlSend,,{Left}, 슬픈라@연
		}
		if (targetYonWins > 0){
			ControlSend,,{Down}, 슬픈라@연
		}
		if (targetYonWins < 0){
			ControlSend,,{Up}, 슬픈라@연
		}
	}
return

giveHealToTarget:
	if(isFixTap = 0){
		ControlSend,,{tab}{tab}, 슬픈라@연
		isFixTap = 1
	}
	ControlSend,,{%numHeal%}, 슬픈라@연
return

giveDoubleHealToTarget:
	if(isFixTap = 0){
		ControlSend,,{tab}{tab}, 슬픈라@연
		isFixTap = 1
	}
	ControlSend,,{%numDoubleHeal%}, 슬픈라@연
	Sleep, 500
	ControlSend,,{%numImmotal%}, 슬픈라@연
	
return

workDamageUp:
	ControlSend,,{%numDamageUp%}, 슬픈라@연
	Sleep, 500
	ControlSend,,{%numReduceDefece%}, 슬픈라@연
return

;movePotal의 경우 한번의 실행으로 포탈을 타고 멈춰야 한다. 
movePotal:
gosub, updateTargetPosition
;potal image는 변화하기때문에 loop로 찾아준다.
Loop
{
ImageSearch, potalX,potalY,960,0,A_ScreenWidth,A_ScreenHeight, *Trans0x000000 *80 potal.png
	If ErrorLevel = 0
	{
		;MsgBox, potalX: %potalX% potalY: %potalY%
		;MsgBox, targetX: %targetX% targetY: %targetY%
		potalXonWins := Round((potalX - targetX) / 63)
		potalYonWins := Round((potalY - targetY) / 25)-1
		MsgBox, 포탈까지 X: %potalXonWins% Y: %potalYonWins%
		tmpX:=Abs(potalXonWins)
		tmpY:=Abs(potalYonWins)
		break
	}
}


Loop, %tmpX%
{
	if (potalXonWins > 0){
		ControlSend,,{Right}, 슬픈라@연
	}
	else if (potalXonWins < 0){
		ControlSend,,{Left}, 슬픈라@연
	}
	Sleep,500
}
Loop, %tmpY%
{
	if (potalYonWins > 0){
		ControlSend,,{Down}, 슬픈라@연
	}
	else if (potalYonWins < 0){
		ControlSend,,{Up}, 슬픈라@연
	}
	Sleep,500
}

return