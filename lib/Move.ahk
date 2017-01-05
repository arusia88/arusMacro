Class Move
{
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
}