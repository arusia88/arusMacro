��ǥ:

X�� := convertImgToPos(����X��a, ����Y��, 100)
X�� := convertImgToPos(����X��a, ����Y��, 10)
X�� := convertImgToPos(����X��a, ����Y��, 1)

Y�� := convertImgToPos(����Y��a, ����Y��, 200)
Y�� := convertImgToPos(����Y��a, ����Y��, 20)
Y�� := convertImgToPos(����Y��a, ����Y��, 2)

X��ǥ:=(X��*100)+(X��*10)+(X��)
Y��ǥ:=(Y��*100)+(Y��*10)+(Y��)
if(��Y>Y��ǥ){
    ControlSend,, {down},ahk_class Nexon.NWind
    Sleep 50
}
if(��Y<Y��ǥ){
    ControlSend,, {up},ahk_class Nexon.NWind
    Sleep 50
}
if(��X>X��ǥ){
    ControlSend,, {right},ahk_class Nexon.NWind
    Sleep 50
}
if(��X<X��ǥ){
    ControlSend,, {Left},ahk_class Nexon.NWind
    Sleep 50
}
; Gosub, ���
; MsgBox, ������X, ��X %��X% ������Y, ��Y %��Y% ��X, ��X %X��ǥ% ��Y, ��Y %Y��ǥ%�ʱ�ȭ��, �� %�ʱ�ȭ%
guicontrol, 2:text,������X, ��X %��X%
guicontrol, 2:text,������Y, ��Y %��Y%
guicontrol, 2:text,��X, ��X %X��ǥ%
guicontrol, 2:text,��Y, ��Y %Y��ǥ%
guicontrol, 2:text,�ʱ�ȭ��, �� %�ʱ�ȭ%
return
F3::
FileAppend, %X��ǥ%`,%Y��ǥ% `r, Pos.txt
return
F4::
gdipToken := Gdip_Startup()
PosX := Xã-516
PosY := Yã-736
string = %PosX%|%PosY%|72|17
MsgBox, %string%
pBitmap:=Gdip_BitmapFromScreen(string)
ret := Gdip_SaveBitmapToFile(pBitmap, "pos.bmp")
file = expected.bmp
return