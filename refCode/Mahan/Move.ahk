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


�̵�:
X�� := convertImgToPos(����X��a, ����Y��, 100)
X�� := convertImgToPos(����X��a, ����Y��, 10)
X�� := convertImgToPos(����X��a, ����Y��, 1)

Y�� := convertImgToPos(����Y��a, ����Y��, 200)
Y�� := convertImgToPos(����Y��a, ����Y��, 20)
Y�� := convertImgToPos(����Y��a, ����Y��, 2)


X��ǥ:=(X��*100)+(X��*10)+(X��)
Y��ǥ:=(Y��*100)+(Y��*10)+(Y��)

; if(prevX = X��ǥ and prevY = Y��ǥ) {
;     MouseClick, Left, 430, 350, 1
;     Sleep, 3000
; }

; TODO: �����ڸ� ������ �Ѿ
; cal_moveTimer:=A_TickCount-moveTimer
; if(cal_moveTimer > 10000 ){
;     prevX := X��ǥ, prevY := Y��ǥ
;     moveTimer := A_TickCount
; }

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

;; At kwanmi, it is not needed because it is instance field
; Gosub, heopung

; MsgBox, ������X, ��X %��X% ������Y, ��Y %��Y% ��X, ��X %X��ǥ% ��Y, ��Y %Y��ǥ%�ʱ�ȭ��, �� %�ʱ�ȭ%
guicontrol, 2:text,������X, ��X %��X%
guicontrol, 2:text,������Y, ��Y %��Y%
guicontrol, 2:text,��X, ��X %X��ǥ%
guicontrol, 2:text,��Y, ��Y %Y��ǥ%
guicontrol, 2:text,�ʱ�ȭ��, �� %�ʱ�ȭ%
return

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
            Random, RandWalk, 1, 4
            if(RandWalk=1){
                ControlSend,, {right},ahk_class Nexon.NWind
            }
            if(RandWalk=2){
                ControlSend,, {Left},ahk_class Nexon.NWind
            }
            if(RandWalk=3){
                ControlSend,, {down},ahk_class Nexon.NWind
            }
            if(RandWalk=4){
                ControlSend,, {up},ahk_class Nexon.NWind
            }
        }
        RandomTimer:=A_TickCount
    }
}
return

F3::
if(prev <> filenum){
    FileAppend, %filenum% `r, resource/Pos.txt
}
FileAppend, %X��ǥ%`,%Y��ǥ% `r, resource/Pos.txt
prev:= filenum
return
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
return