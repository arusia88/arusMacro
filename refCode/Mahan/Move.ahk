moveByChosang(directionKey) {
    if(isMop() = 1){
         return
    }
    ControlSend, , {Esc}, Nexon.NWind
    Sleep, 200
    ControlSend, , {ShiftDown}{%directionKey%}{ShiftUp}, ahk_class Nexon.NWind
    Sleep, 200
    ControlSend, , ux, ahk_class Nexon.NWind
    Sleep, 200
}

clickOver(x,y) {
    global
    if (ImageSearchWithGdip(xMe, yMe, findSelfX, findSelfY, findSelfX+811, findSelfY+615, "Img\kwanmi\me.bmp", 0, 0xFFFFFF) >= 1) {
        clickX := xMe + x
        clickY := yMe + y
    } else {
        clickX := 400 + x
        clickY := 300 + y
    }
    MouseClick, Left, %clickX%, %clickY%, 1, ,D
    Sleep, 3000
    MouseClick, Left, %clickX%, %clickY%, 1, ,U
    Sleep, 1000
}

�̵�:
X�� := convertImgToPos(����X��a, ����Y��, 100)
X�� := convertImgToPos(����X��a, ����Y��, 10)
X�� := convertImgToPos(����X��a, ����Y��, 1)

Y�� := convertImgToPos(����Y��a, ����Y��, 200)
Y�� := convertImgToPos(����Y��a, ����Y��, 20)
Y�� := convertImgToPos(����Y��a, ����Y��, 2)


X��ǥ:=(X��*100)+(X��*10)+(X��)
Y��ǥ:=(Y��*100)+(Y��*10)+(Y��)

if(�ʻ� = 1){
    if(��Y - Y��ǥ > 5) {
        moveByChosang("Down")
    } else if (��Y - Y��ǥ < -5) {
        moveByChosang("Up")
    } else if (��X - X��ǥ > 5) {
        moveByChosang("Right")
    } else if (��X - X��ǥ < -5) {
        moveByChosang("Left")
    }
}

curDirection = 0

if(��Y>Y��ǥ){
    ControlSend,, {down},ahk_class Nexon.NWind
    Sleep 50
    curDirection = 3
}
if(��Y<Y��ǥ){
    ControlSend,, {up},ahk_class Nexon.NWind
    Sleep 50
    curDirection = 4
}
if(��X>X��ǥ){
    ControlSend,, {right},ahk_class Nexon.NWind
    Sleep 50
    curDirection = 1
}
if(��X<X��ǥ){
    ControlSend,, {Left},ahk_class Nexon.NWind
    Sleep 50
    curDirection = 2
}



; Gosub, ���

;; At kwanmi, it is not needed because it is instance field
Gosub, heopung

guicontrol, 2:text,������X, ��X %��X%
guicontrol, 2:text,������Y, ��Y %��Y%
guicontrol, 2:text,��X, ��X %X��ǥ%
guicontrol, 2:text,��Y, ��Y %Y��ǥ%
guicontrol, 2:text,�ʱ�ȭ��, �� %stateOnMap3%
guicontrol, 2:text,result_mopAttack, ���������ϴ��� %result_mopAttack%

Return

�����̵�:
if(�����̵�=1){
    Cal_RandomTimer:=A_TickCount-RandomTimer
    if(Cal_RandomTimer<1000){
        ����X��ǥ=%X��ǥ%
        ����Y��ǥ=%Y��ǥ%
    }
    if(Cal_RandomTimer>3000){
        ����X��ǥ=%X��ǥ%
        ����Y��ǥ=%Y��ǥ%
        if(����X��ǥ=����X��ǥ and ����Y��ǥ=����Y��ǥ){
            ; Right
            if (curDirection = 1)
                clickOver(120, 60)
            ; Left
            if (curDirection = 2)
                clickOver(-125, 62)
            ; Down
            if (curDirection = 3)
                clickOver(-100, 145)
            ; Up
            if (curDirection = 4)
                clickOver(-15, -110)
            ; MsgBox, clicked

        }
        RandomTimer:=A_TickCount
    }
}
Return

F3::
if(prev <> filenum){
    FileAppend, %filenum% `r, resource/Pos.txt
}
FileAppend, %X��ǥ%`,%Y��ǥ% `r, resource/Pos.txt
prev:= filenum
Return

F4::
gdipToken := Gdip_Startup()
PosX := Xã-516
PosY := Yã-736
string = %PosX%|%PosY%|72|17
; MsgBox, %string%
filenum += 1
fileName = resource/%filenum%.bmp
pBitmap:=Gdip_BitmapFromScreen(string)
ret := Gdip_SaveBitmapToFile(pBitmap, fileName)

file = expected.bmp
Return