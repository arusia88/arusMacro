���ʺ��ʹ���:
; �ʱ�ȭ=1000
�ʱ�ȭ=0201
Loop{
    Gosub, ���ʺ��ʹ�����ǥ
    Gosub, ��ǥ
    Gosub, �����̵�
    if(�ʱ�ȭ=0212){
        break
    }
}
return
���ʺ��ʹ�����ǥ:
if(�ʱ�ȭ=1000){
    Sleep 5000
    Send {Shift down}zz{shift up}3{enter}
    Sleep 200
    Send {Shift down}zz{shift up}3{enter}
    Sleep 200
    �ʱ�ȭ=1004
}
ImageSearch, x���ʼ�, y���ʼ�, 1, 1, 1100, 200, *TransFFFFFF *80 Img\���ʼ�.bmp
if(ErrorLevel=0){
    guicontrol, 2:text,Gui2Text6, ���ʼ�
    if(�ʱ�ȭ=1004 or �ʱ�ȭ=0001){
        if(����=1){
            Sleep 200
            Send uz
            Sleep 300
            Send {ctrl down}{down}{ctrl up}{enter}
            Sleep 200
            Send {enter}{esc}
        }
        ��X:=79, ��Y:=99
        �ʱ�ȭ=0000
    }
}
ImageSearch, x���ʽ�, y���ʽ�, 1, 1, 1100, 200, *TransFFFFFF *80 Img\���ʽ�.bmp
if(ErrorLevel=0){
    Gosub, ����
    Gosub, ���ν�
    guicontrol, 2:text,Gui2Text6, ���ʼ�-���ʽ�������
    if(�ʱ�ȭ=0000){
        ��X:=8, ��Y:=7
        �ʱ�ȭ=0001
    }
    if(X��ǥ=8 and Y��ǥ=7){
        ��X:=16, ��Y:=8
    }
    if(X��ǥ=16 and Y��ǥ=8 or �ʱ�ȭ=0201){
        ��X:=16, ��Y:=9
        �ʱ�ȭ=0001
    }
}
ImageSearch, x����, y����, 1, 1, 1100, 200, *TransFFFFFF *80 Img\����.bmp
if(ErrorLevel=0){
    guicontrol, 2:text,Gui2Text6, ���ѻ��������Էδ���
    if(�ʱ�ȭ=0001){
        ��X:=13, ��Y:=5
        �ʱ�ȭ=0201
    }
    if(X��ǥ=13 and Y��ǥ=05 or �ʱ�ȭ=0202){
        ��X:=13, ��Y:=0
        �ʱ�ȭ=0201
    }
}


ImageSearch, x201, y201, 1, 1, 1100, 200, *TransFFFFFF *80 Img\2-01.bmp
if(ErrorLevel=0){
    Gosub, ����
    Gosub, ���ν�
    guicontrol, 2:text,Gui2Text6, ���ѻ��������Է�2-01
    if(�ʱ�ȭ=0201){
        ��X:=12, ��Y:=6
        �ʱ�ȭ=0202
    }
    if(X��ǥ=12 and Y��ǥ=6 or �ʱ�ȭ=0203){
        ��X:=0, ��Y:=6
        �ʱ�ȭ=0202
    }
}
ImageSearch, x202, y202, 1, 1, 1100, 200, *TransFFFFFF *80 Img\2-02.bmp
if(ErrorLevel=0){
    Gosub, ����
    Gosub, ���ν�
    guicontrol, 2:text,Gui2Text6, ���ѻ��������Է�2-02
    if(�ʱ�ȭ=0202){
        ��X:=8, ��Y:=17
        �ʱ�ȭ=0203
    }
    if(X��ǥ=8 and Y��ǥ=17){
        ��X:=8, ��Y:=4
    }
    if(X��ǥ=8 and Y��ǥ=4 or �ʱ�ȭ=0204){
        ��X:=0, ��Y:=4
        �ʱ�ȭ=0203
    }
}
ImageSearch, x203, y203, 1, 1, 1100, 200, *TransFFFFFF *80 Img\2-03.bmp
if(ErrorLevel=0){
    Gosub, ����
    Gosub, ���ν�
    guicontrol, 2:text,Gui2Text6, ���ѻ��������Է�2-03
    if(�ʱ�ȭ=0203){
        ��X:=6, ��Y:=21
        �ʱ�ȭ=0204
    }
    if(X��ǥ=6 and Y��ǥ=21 or �ʱ�ȭ=0205){
        ��X:=6, ��Y:=0
        �ʱ�ȭ=0204
    }
}
ImageSearch, x204, y204, 1, 1, 1100, 200, *TransFFFFFF *80 Img\2-04.bmp
if(ErrorLevel=0){
    Gosub, ����
    Gosub, ���ν�
    guicontrol, 2:text,Gui2Text6, ���ѻ��������Է�2-04
    if(�ʱ�ȭ=0204){
        ��X:=5, ��Y:=8
        �ʱ�ȭ=0205
    }
    if(X��ǥ=5 and Y��ǥ=8){
        ��X:=15, ��Y:=8
    }
    if(X��ǥ=15 and Y��ǥ=8){
        ��X:=15, ��Y:=4
    }
    if(X��ǥ=15 and Y��ǥ=4 or �ʱ�ȭ=0206){
        ��X:=29, ��Y:=4
        �ʱ�ȭ=0205
    }
}
ImageSearch, x205, y205, 1, 1, 1100, 200, *TransFFFFFF *80 Img\2-05.bmp
if(ErrorLevel=0){
    Gosub, ����
    Gosub, ���ν�
    guicontrol, 2:text,Gui2Text6, ���ѻ��������Է�2-05
    if(�ʱ�ȭ=0205){
        ��X:=5, ��Y:=4
        �ʱ�ȭ=0206
    }
    if(X��ǥ=5 and Y��ǥ=4){
        ��X:=5, ��Y:=21
    }
    if(X��ǥ=5 and Y��ǥ=21 or �ʱ�ȭ=0207){
        ��X:=19, ��Y:=21
        �ʱ�ȭ=0206
    }
}
ImageSearch, x206, y206, 1, 1, 1100, 200, *TransFFFFFF *80 Img\2-06.bmp
if(ErrorLevel=0){
    Gosub, ����
    Gosub, ���ν�
    guicontrol, 2:text,Gui2Text6, ���ѻ��������Է�2-06
    if(�ʱ�ȭ=0206){
        ��X:=23, ��Y:=14
        �ʱ�ȭ=0207
    }
    if(X��ǥ=23 and Y��ǥ=14 or �ʱ�ȭ=0208){
        ��X:=23, ��Y:=16
        �ʱ�ȭ=0207
    }
}
ImageSearch, x207, y207, 1, 1, 1100, 200, *TransFFFFFF *80 Img\2-07.bmp
if(ErrorLevel=0){
    Gosub, ����
    Gosub, ���ν�
    guicontrol, 2:text,Gui2Text6, ���ѻ��������Է�2-07
    if(�ʱ�ȭ=0207){
        ��X:=20, ��Y:=15
        �ʱ�ȭ=0208
    }
    if(X��ǥ=20 and Y��ǥ=15 or �ʱ�ȭ=0209){
        ��X:=20, ��Y:=0
        �ʱ�ȭ=0208
    }
}
ImageSearch, x208, y208, 1, 1, 1100, 200, *TransFFFFFF *80 Img\2-08.bmp
if(ErrorLevel=0){
    Gosub, ����
    Gosub, ���ν�
    guicontrol, 2:text,Gui2Text6, ���ѻ��������Է�2-08
    if(�ʱ�ȭ=0208){
        ��X:=9, ��Y:=20
        �ʱ�ȭ=0209
    }
    if(X��ǥ=9 and Y��ǥ=20){
        ��X:=13, ��Y:=20
    }
    if(X��ǥ=13 and Y��ǥ=20){
        ��X:=13, ��Y:=5
    }
    if(X��ǥ=13 and Y��ǥ=5 or �ʱ�ȭ=0210){
        ��X:=19, ��Y:=5
        �ʱ�ȭ=0209
    }
}
ImageSearch, x209, y209, 1, 1, 1100, 200, *TransFFFFFF *80 Img\2-09.bmp
if(ErrorLevel=0){
    Gosub, ����
    Gosub, ���ν�
    guicontrol, 2:text,Gui2Text6, ���ѻ��������Է�2-09
    if(�ʱ�ȭ=0209){
        ��X:=10, ��Y:=7
        �ʱ�ȭ=0210
    }
    if(X��ǥ=10 and Y��ǥ=7){
        ��X:=10, ��Y:=5
    }
    if(X��ǥ=10 and Y��ǥ=5){
        ��X:=20, ��Y:=5
    }
    if(X��ǥ=20 and Y��ǥ=5 or �ʱ�ȭ=0211){
        ��X:=20, ��Y:=0
        �ʱ�ȭ=0210
    }
}
ImageSearch, x210, y210, 1, 1, 1100, 200, *TransFFFFFF *80 Img\2-10.bmp
if(ErrorLevel=0){
    guicontrol, 2:text,Gui2Text6, ���ѻ��������Է�2-10
    if(�ʱ�ȭ=0210){
        ��X:=11, ��Y:=9
        �ʱ�ȭ=0211
    }
    if(X��ǥ=11 and Y��ǥ=9){
        �ʱ�ȭ=0212
    }
    if(�ʱ�ȭ=1002){
        Send {Shift down}zz{Shift up}3{enter}
        sleep 2000
    }
}
return