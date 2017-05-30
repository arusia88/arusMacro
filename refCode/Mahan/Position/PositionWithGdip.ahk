#Include, MLib\Gdip_All.ahk
#Include, MLib\Gdip_ImageSearch.ahk
#Include, MLib\Bin2Hex.ahk
#Include, MLib\BinRead.ahk
#Include, MLib\Hex2Bin.ahk
#Include, convertImgToPos.ahk

#SingleInstance, Force
#NoEnv
CoordMode, Pixel, Screen
number = 0
F1::
SetKeyDelay, -1
SetWinDelay,-1
SetBatchLines,-1
SetControlDelay,-1


WinGetPos, findSelfX, findSelfY, findSelfWidth, findSelfHeight, �ٶ��ǳ���
ImageSearch, Xã, Yã, findSelfX+880, findSelfY+750, findSelfX+findSelfWidth, findSelfY+findSelfHeight, *transFFFFFF Img\X.bmp
if(ErrorLevel=0) {
    ����X��a:= Xã + 20
    ����X��b:= Xã + 28
    ����X��a:= Xã + 29
    ����X��b:= Xã + 37
    ����X��a:= Xã + 38
    ����X��b:= Xã + 46
    ����Y��a:= Xã + 78
    ����Y��b:= Xã + 86
    ����Y��a:= Xã + 87
    ����Y��b:= Xã + 95
    ����Y��a:= Xã + 96
    ����Y��b:= Xã + 104
    ����Y��:= Yã
    ����Y�Ʒ�:= Yã + 11
    MsgBox, good
} else {
    MsgBox, bad
}
return
; F2::
; StartTime:=A_TickCount
; ;#########################################################################################�Ʒ��κ��� Code()�� ���� �Ͻø� �˴ϴ�.
; X := convertImgToPos(����X��a, ����Y��)
; EndTime:=A_TickCount
; ResultTime:=EndTime - StartTime
; Msgbox, result = %ret% pos=%X% , Time=%ResultTime%
; ;#########################################################################################


; return

k:=1
value:=3
F3::
gdipToken := Gdip_Startup()
PosX := Xã-516
PosY := Yã-736
string = %PosX%|%PosY%|72|17
MsgBox, %string%
pBitmap:=Gdip_BitmapFromScreen(string)
ret := Gdip_SaveBitmapToFile(pBitmap, "pos.bmp")
file = expected.bmp

BinRead(file, data)
Bin2Hex(resultHex,data,res)

; MsgBox, result : %resultHex%
; FileAppend, �ڸ� : %k% �� : %value% ĸ�� hex : %resultHex% `r, Test.txt
value += 1
Return


F9::

; get capture heopung image
; BlockInput, On
WinGetPos, findSelfX, findSelfY, findSelfWidth, findSelfHeight, ���� ���� - �׸���

gdipToken := Gdip_Startup()
ImageSearch, Xã, Yã, findSelfX, findSelfY, findSelfX+findSelfWidth, findSelfY+findSelfHeight, *transFFFFFF *50 Img\heopung.bmp
If(ErrorLevel = 0)
{
    string = %Xã%|%Yã%|276|198
    pBitmap:=Gdip_BitmapFromScreen(string)
    ret := Gdip_SaveBitmapToFile(pBitmap, "pos.bmp")

    ; set clipboard to cpature image
    Gdip_SetBitmapToClipboard(pBitmap)

    ; control send 'ctrl + v ' on kakao (me)
    ; control send enter
    WinActivate �ӱ�
    ControlSend, ,{CtrlDown}v{CtrlUp},�ӱ�
    Sleep, 300
    ; Send, {Enter}
    Sleep, 300
    ; WinActivate �ٶ��ǳ���
    ; BlockInput, Off
}
; active wind back
return

F4::
#Persistent
SetTimer, ConText

ConText:
DetectHiddenText, On
MouseGetPos,,, id, NN
ControlGetText, Text, %NN%, ahk_id %id%
Tooltip Text=%Text%
Return


F5::
; CoordMode, Mouse, Screen
; WinGetPos, findKaKaoX, findKaKaoY, findKaKaoWidth, findKaKaoHeight, �ӱ�
; WinActivate �ӱ�
; ImageSearch, Xreply, Yreply, findKaKaoX+114, findKaKaoY+452, findKaKaoX+findKaKaoWidth, findKaKaoY+findKaKaoHeight, *transFFFFFF Img\replyKaKao.bmp
; If(ErrorLevel = 0)
; {
;     MsgBox, success
;     Sleep, 300
;     Xreply := Xreply+45
;     Yreply := Yreply+15
;     ; ControlClick, x%Xreply% y%Yreply%,�ӱ�,, Left, 2
;     MouseClick, Left, %Xreply%, %Yreply%, 2
;     Send, {CtrlDown}c{CtrlUp}
;     Sleep, 1000
;     ; MsgBox % Xreply " / " Yreply
;     ; Sleep, 500
;     Send, {CtrlDown}v{CtrlUp}
;     ; Sleep, 300
;     ; Send, {Enter}
;     ; Sleep, 300
;     ; heopungSent = 0
; }

    CoordMode, Mouse, Screen
    WinGetPos, findKaKaoX, findKaKaoY, findKaKaoWidth, findKaKaoHeight, �ӱ�
    ImageSearch, Xreply, Yreply, findKaKaoX+114, findKaKaoY+452, findKaKaoX+findKaKaoWidth, findKaKaoY+findKaKaoHeight, *transFFFFFF *80 Img\replyKaKao.bmp
    If(ErrorLevel = 0)
    {
        Xreply := Xreply+45
        Yreply := Yreply+15
        MouseClick, Left, %Xreply%, %Yreply%, 2
        Sleep, 100
        Send, {CtrlDown}c{CtrlUp}
        Sleep, 100
        ; WinActivate �ٶ��ǳ���
    }
