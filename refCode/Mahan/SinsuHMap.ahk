�ż������������:
�ʱ�ȭ=1000
Loop {
    gosub, �ż��������������ǥ
    Gosub, ��ǥ
    Gosub, �����̵�
    if(�ʱ�ȭ=0411){
        break
    }
}
;;�ʱ�ȭ
Return

�ż��������������ǥ:
if(�ʱ�ȭ=1000){
    Send {Shift down}zz{shift up}4{enter}
    Sleep 200
    Send {Shift down}zz{shift up}4{enter}
    Sleep 200
    �ʱ�ȭ = 0001
}

ImageSearch, x�ż�����, y�ż�����, findSelfX, findSelfY, findSelfX+findSelfWidth, findSelfY+50, *TransFFFFFF *80 Img\sinsu\�ż���.bmp
if(ErrorLevel=0) {
    guicontrol, 2:text,Gui2Text6, �ż��踶��
    if(�ʱ�ȭ=0001) {
        ��X:=55, ��Y:=0
        �ʱ�ȭ = 0000
    }
}

ImageSearch, x�ż�������, y�ż�������, findSelfX, findSelfY, findSelfX+findSelfWidth, findSelfY+200, *TransFFFFFF *80 Img\sinsu\�ż���������.bmp
if(ErrorLevel=0) {
    if(�ʱ�ȭ=0000 or �ʱ�ȭ=0401) {
        Loop, 100 {
            ImageSearch, X����Ż, Y����Ż, findSelfX, findSelfY, findSelfX+findSelfWidth, findSelfY+findSelfHeight, Img\sinsu\potal.bmp
            if(ErrorLevel=0){
                X��Ż:=X����Ż+330
                Y��Ż:=Y����Ż+30
                ; MsgBox, x y : %X��Ż% %Y��Ż%
                Send {esc}
                sleep 100
                ControlClick, x%X��Ż% y%Y��Ż%, �ٶ��ǳ���
                Sleep 1000
                Send {down}
                Sleep 500
                Send {enter}
                Sleep 50
                Send {esc}
                ;���� 4 �� �ǹ�
                �ʱ�ȭ = 0401
            }
        }
    }
}

ImageSearch, x����1, y����1, findSelfX, findSelfY, findSelfX+findSelfWidth, findSelfY+200, *TransFFFFFF *80 Img\sinsu\1.bmp
if(ErrorLevel=0) {
    Gosub, ����
    Gosub, ���ν�
    if(�ʱ�ȭ=0401) {
        Sleep, 200
        �ʱ�ȭ = 0402
        ��X:=9, ��Y:=26
    }
    if(X��ǥ=9 and Y��ǥ=26){
        ��X:=5, ��Y:=19
    }
    if(X��ǥ=5 and Y��ǥ=19){
        ��X:=5, ��Y:=7
    }
    if(X��ǥ=5 and Y��ǥ=7){
        ��X:=17, ��Y:=7
    }
    if(X��ǥ=17 and Y��ǥ=7){
        ��X:=23, ��Y:=12
    }

    if(X��ǥ=23 and Y��ǥ=12){
        ��X:=34, ��Y:=12
        �ʱ�ȭ = 0402
    }

}

ImageSearch, x����1, y����1, findSelfX, findSelfY, findSelfX+findSelfWidth, findSelfY+200, *TransFFFFFF *80 Img\sinsu\2.bmp
if(ErrorLevel=0) {
    �ʱ�ȭ = 1000
}

Return