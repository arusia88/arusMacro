#Include, MLib\Gdip_All.ahk
#Include, MLib\Gdip_ImageSearch.ahk
#Include, MLib\Bin2Hex.ahk
#Include, MLib\BinRead.ahk
#Include, MLib\Hex2Bin.ahk
#Include, convertImgToPos.ahk

#SingleInstance, Force
#NoEnv
number = 0
F1::
SetKeyDelay, -1
SetWinDelay,-1
SetBatchLines,-1
SetControlDelay,-1
CoordMode, Pixel, SCreen

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