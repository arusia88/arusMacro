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
ControlSend,,{esc}{tab}{home}{Right}{tab}, ���¶�@��
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
	ControlSend,,{Esc}{3}{Home}{Enter}, ���¶�@��
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
	ControlSend,,{2}, ���¶�@��
}
return
	
move:
	gosub, updateTargetPosition
	;��Ȱ��ȭâ������ ��Ʈ�� �ϱ� ���� ���밪 �̿�
	CoordMode,Mouse,Screen
	; ReDetail�� target �ɸ��� ������ �̹���
	ImageSearch, Ÿ��X,Ÿ��Y,960,0,A_ScreenWidth,A_ScreenHeight, *Trans0xffffff *80 ReDetail.png
	If ErrorLevel = 0
	{
	
		;Ȱ��ȭ�� â���� �����ǥ ���� �Ÿ� ��� 
		;MouseClick, left, OutX, OutY
		targetXonWins := Round((Ÿ��X - targetX) / 48)
		targetYonWins := Round((Ÿ��Y - targetY) / 51)
		
		;MsgBox, ��ġ X: %targetXonWins% Y: %targetYonWins%
		
		;Ư�� â�� ��ɾ� ����
		if (targetXonWins > 0){
			ControlSend,,{Right}, ���¶�@��
		}
		if (targetXonWins < 0){
			ControlSend,,{Left}, ���¶�@��
		}
		if (targetYonWins > 0){
			ControlSend,,{Down}, ���¶�@��
		}
		if (targetYonWins < 0){
			ControlSend,,{Up}, ���¶�@��
		}
	}
return

giveHealToTarget:
	if(isFixTap = 0){
		ControlSend,,{tab}{tab}, ���¶�@��
		isFixTap = 1
	}
	ControlSend,,{%numHeal%}, ���¶�@��
return

giveDoubleHealToTarget:
	if(isFixTap = 0){
		ControlSend,,{tab}{tab}, ���¶�@��
		isFixTap = 1
	}
	ControlSend,,{%numDoubleHeal%}, ���¶�@��
	Sleep, 500
	ControlSend,,{%numImmotal%}, ���¶�@��
	
return

workDamageUp:
	ControlSend,,{%numDamageUp%}, ���¶�@��
	Sleep, 500
	ControlSend,,{%numReduceDefece%}, ���¶�@��
return

;movePotal�� ��� �ѹ��� �������� ��Ż�� Ÿ�� ����� �Ѵ�. 
movePotal:
gosub, updateTargetPosition
;potal image�� ��ȭ�ϱ⶧���� loop�� ã���ش�.
Loop
{
ImageSearch, potalX,potalY,960,0,A_ScreenWidth,A_ScreenHeight, *Trans0x000000 *80 potal.png
	If ErrorLevel = 0
	{
		;MsgBox, potalX: %potalX% potalY: %potalY%
		;MsgBox, targetX: %targetX% targetY: %targetY%
		potalXonWins := Round((potalX - targetX) / 63)
		potalYonWins := Round((potalY - targetY) / 25)-1
		MsgBox, ��Ż���� X: %potalXonWins% Y: %potalYonWins%
		tmpX:=Abs(potalXonWins)
		tmpY:=Abs(potalYonWins)
		break
	}
}


Loop, %tmpX%
{
	if (potalXonWins > 0){
		ControlSend,,{Right}, ���¶�@��
	}
	else if (potalXonWins < 0){
		ControlSend,,{Left}, ���¶�@��
	}
	Sleep,500
}
Loop, %tmpY%
{
	if (potalYonWins > 0){
		ControlSend,,{Down}, ���¶�@��
	}
	else if (potalYonWins < 0){
		ControlSend,,{Up}, ���¶�@��
	}
	Sleep,500
}

return