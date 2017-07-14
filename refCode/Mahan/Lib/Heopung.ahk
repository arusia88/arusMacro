heopung:

If !gdipToken := Gdip_Startup()
    {
        MsgBox, 48, gdiplus error!, Gdiplus failed to start. Please ensure you have gdiplus on your system
        ExitApp
    }
; get capture heopung image
if (heopungSent = 1 and completedReply = 1) {
    heopungSent := 0
    completedReply := 0
    Sleep, 1000
}

if (heopungSent = 0 and completedReply = 0)
{

    ImageSearch, X«„«≥√£, Y«„«≥√£, findSelfX, findSelfY, findSelfX+findSelfWidth, findSelfY+findSelfHeight, *transFFFFFF *50 Img\heopung.bmp
    If(ErrorLevel = 0)
    {
        if (prevHeopungX <> X«„«≥√£ and prevHeopungY <> Y«„«≥√£)
        {
            heopungSent = 0
        }

        string = %X«„«≥√£%|%Y«„«≥√£%|276|198
        pBitmap:=Gdip_BitmapFromScreen(string)
        ret := Gdip_SaveBitmapToFile(pBitmap, "pos.bmp")

        ; set clipboard to cpature image
        Gdip_SetBitmapToClipboard(pBitmap)

        ; control ctrl + v ' on kakao (me),¿”±∫
        ; control enter,¿”±∫
        WinActivate ¿”±∫
        Send, {CtrlDown}v{CtrlUp}
        Sleep, 300
        Send, {Enter}
        Sleep, 300
        ; active wind back
        ; WinActivate πŸ∂˜¿«≥™∂Û
        Sleep 1000

        ; save prev coordinate value
        prevHeopungX := X«„«≥√£
        prevHeopungY := Y«„«≥√£

        ; set Status
        heopungSent = 1

    }
}

if(heopungSent = 1 and completedReply = 0)
{
    WinActivate ¿”±∫
    CoordMode, Mouse, Screen
    WinGetPos, findKaKaoX, findKaKaoY, findKaKaoWidth, findKaKaoHeight, ¿”±∫
    ImageSearch, Xreply, Yreply, findKaKaoX+55, findKaKaoY+440, findKaKaoX+findKaKaoWidth, findKaKaoY+findKaKaoHeight, *transFFFFFF *80 Img\replyKaKao.bmp
    If(ErrorLevel = 0)
    {
        ; MsgBox % "found reply" findKaKaoX+114 " / " findKaKaoY+452
        Sleep, 1000
        ; BlockInput, On
        Xreply := Xreply+50
        Yreply := Yreply+15
        ; copy solution
        MouseClick, Left, %Xreply%, %Yreply%, 2
        Sleep, 1000
        Send,{CtrlDown}c{CtrlUp}
        Sleep, 1000
        WinActivate πŸ∂˜¿«≥™∂Û
        Sleep, 1000

        ; paste solution
        ClickSolutionX := X«„«≥√£ + 50
        ClickSolutionY := Y«„«≥√£ + 160
        MouseClick, Left, %ClickSolutionX%, %ClickSolutionY%, 2
        Sleep, 1000
        Send,{CtrlDown}v{CtrlUp}
        Sleep, 1000
        Send,{Enter}
        Sleep, 300

        ; set Status
        completedReply = 1
        ; BlockInput, Off
        Sleep, 2000
    }
}

Gdip_Shutdown(gdipToken)

Return