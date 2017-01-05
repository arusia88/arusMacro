class Magic {

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
			isFixTap := 0;
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
			isFixTap := 1;
		}
		ControlSend,,{%numHeal%}, target
	}

	giveDoubleHealToTarget(isFixTap)
	{
		if(isFixTap = 0){
			ControlSend,,{tab}{tab}, target
			isFixTap := 1;
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
}