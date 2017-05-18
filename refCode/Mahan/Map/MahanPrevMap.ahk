위례부터대기실:
; 초기화=1000
초기화=0201
Loop{
    Gosub, 위례부터대기실좌표
    Gosub, 좌표
    Gosub, 랜덤이동
    if(초기화=0212){
        break
    }
}
return
위례부터대기실좌표:
if(초기화=1000){
    Sleep 5000
    Send {Shift down}zz{shift up}3{enter}
    Sleep 200
    Send {Shift down}zz{shift up}3{enter}
    Sleep 200
    초기화=1004
}
ImageSearch, x위례성, y위례성, 1, 1, 1100, 200, *TransFFFFFF *80 Img\위례성.bmp
if(ErrorLevel=0){
    guicontrol, 2:text,Gui2Text6, 위례성
    if(초기화=1004 or 초기화=0001){
        if(축지=1){
            Sleep 200
            Send uz
            Sleep 300
            Send {ctrl down}{down}{ctrl up}{enter}
            Sleep 200
            Send {enter}{esc}
        }
        갈X:=79, 갈Y:=99
        초기화=0000
    }
}
ImageSearch, x남쪽숲, y남쪽숲, 1, 1, 1100, 200, *TransFFFFFF *80 Img\남쪽숲.bmp
if(ErrorLevel=0){
    Gosub, 버프
    Gosub, 몹인식
    guicontrol, 2:text,Gui2Text6, 위례성-남쪽숲갈림길
    if(초기화=0000){
        갈X:=8, 갈Y:=7
        초기화=0001
    }
    if(X좌표=8 and Y좌표=7){
        갈X:=16, 갈Y:=8
    }
    if(X좌표=16 and Y좌표=8 or 초기화=0201){
        갈X:=16, 갈Y:=9
        초기화=0001
    }
}
ImageSearch, x대기실, y대기실, 1, 1, 1100, 200, *TransFFFFFF *80 Img\대기실.bmp
if(ErrorLevel=0){
    guicontrol, 2:text,Gui2Text6, 마한산적굴진입로대기실
    if(초기화=0001){
        갈X:=13, 갈Y:=5
        초기화=0201
    }
    if(X좌표=13 and Y좌표=05 or 초기화=0202){
        갈X:=13, 갈Y:=0
        초기화=0201
    }
}


ImageSearch, x201, y201, 1, 1, 1100, 200, *TransFFFFFF *80 Img\2-01.bmp
if(ErrorLevel=0){
    Gosub, 버프
    Gosub, 몹인식
    guicontrol, 2:text,Gui2Text6, 마한산적굴진입로2-01
    if(초기화=0201){
        갈X:=12, 갈Y:=6
        초기화=0202
    }
    if(X좌표=12 and Y좌표=6 or 초기화=0203){
        갈X:=0, 갈Y:=6
        초기화=0202
    }
}
ImageSearch, x202, y202, 1, 1, 1100, 200, *TransFFFFFF *80 Img\2-02.bmp
if(ErrorLevel=0){
    Gosub, 버프
    Gosub, 몹인식
    guicontrol, 2:text,Gui2Text6, 마한산적굴진입로2-02
    if(초기화=0202){
        갈X:=8, 갈Y:=17
        초기화=0203
    }
    if(X좌표=8 and Y좌표=17){
        갈X:=8, 갈Y:=4
    }
    if(X좌표=8 and Y좌표=4 or 초기화=0204){
        갈X:=0, 갈Y:=4
        초기화=0203
    }
}
ImageSearch, x203, y203, 1, 1, 1100, 200, *TransFFFFFF *80 Img\2-03.bmp
if(ErrorLevel=0){
    Gosub, 버프
    Gosub, 몹인식
    guicontrol, 2:text,Gui2Text6, 마한산적굴진입로2-03
    if(초기화=0203){
        갈X:=6, 갈Y:=21
        초기화=0204
    }
    if(X좌표=6 and Y좌표=21 or 초기화=0205){
        갈X:=6, 갈Y:=0
        초기화=0204
    }
}
ImageSearch, x204, y204, 1, 1, 1100, 200, *TransFFFFFF *80 Img\2-04.bmp
if(ErrorLevel=0){
    Gosub, 버프
    Gosub, 몹인식
    guicontrol, 2:text,Gui2Text6, 마한산적굴진입로2-04
    if(초기화=0204){
        갈X:=5, 갈Y:=8
        초기화=0205
    }
    if(X좌표=5 and Y좌표=8){
        갈X:=15, 갈Y:=8
    }
    if(X좌표=15 and Y좌표=8){
        갈X:=15, 갈Y:=4
    }
    if(X좌표=15 and Y좌표=4 or 초기화=0206){
        갈X:=29, 갈Y:=4
        초기화=0205
    }
}
ImageSearch, x205, y205, 1, 1, 1100, 200, *TransFFFFFF *80 Img\2-05.bmp
if(ErrorLevel=0){
    Gosub, 버프
    Gosub, 몹인식
    guicontrol, 2:text,Gui2Text6, 마한산적굴진입로2-05
    if(초기화=0205){
        갈X:=5, 갈Y:=4
        초기화=0206
    }
    if(X좌표=5 and Y좌표=4){
        갈X:=5, 갈Y:=21
    }
    if(X좌표=5 and Y좌표=21 or 초기화=0207){
        갈X:=19, 갈Y:=21
        초기화=0206
    }
}
ImageSearch, x206, y206, 1, 1, 1100, 200, *TransFFFFFF *80 Img\2-06.bmp
if(ErrorLevel=0){
    Gosub, 버프
    Gosub, 몹인식
    guicontrol, 2:text,Gui2Text6, 마한산적굴진입로2-06
    if(초기화=0206){
        갈X:=23, 갈Y:=14
        초기화=0207
    }
    if(X좌표=23 and Y좌표=14 or 초기화=0208){
        갈X:=23, 갈Y:=16
        초기화=0207
    }
}
ImageSearch, x207, y207, 1, 1, 1100, 200, *TransFFFFFF *80 Img\2-07.bmp
if(ErrorLevel=0){
    Gosub, 버프
    Gosub, 몹인식
    guicontrol, 2:text,Gui2Text6, 마한산적굴진입로2-07
    if(초기화=0207){
        갈X:=20, 갈Y:=15
        초기화=0208
    }
    if(X좌표=20 and Y좌표=15 or 초기화=0209){
        갈X:=20, 갈Y:=0
        초기화=0208
    }
}
ImageSearch, x208, y208, 1, 1, 1100, 200, *TransFFFFFF *80 Img\2-08.bmp
if(ErrorLevel=0){
    Gosub, 버프
    Gosub, 몹인식
    guicontrol, 2:text,Gui2Text6, 마한산적굴진입로2-08
    if(초기화=0208){
        갈X:=9, 갈Y:=20
        초기화=0209
    }
    if(X좌표=9 and Y좌표=20){
        갈X:=13, 갈Y:=20
    }
    if(X좌표=13 and Y좌표=20){
        갈X:=13, 갈Y:=5
    }
    if(X좌표=13 and Y좌표=5 or 초기화=0210){
        갈X:=19, 갈Y:=5
        초기화=0209
    }
}
ImageSearch, x209, y209, 1, 1, 1100, 200, *TransFFFFFF *80 Img\2-09.bmp
if(ErrorLevel=0){
    Gosub, 버프
    Gosub, 몹인식
    guicontrol, 2:text,Gui2Text6, 마한산적굴진입로2-09
    if(초기화=0209){
        갈X:=10, 갈Y:=7
        초기화=0210
    }
    if(X좌표=10 and Y좌표=7){
        갈X:=10, 갈Y:=5
    }
    if(X좌표=10 and Y좌표=5){
        갈X:=20, 갈Y:=5
    }
    if(X좌표=20 and Y좌표=5 or 초기화=0211){
        갈X:=20, 갈Y:=0
        초기화=0210
    }
}
ImageSearch, x210, y210, 1, 1, 1100, 200, *TransFFFFFF *80 Img\2-10.bmp
if(ErrorLevel=0){
    guicontrol, 2:text,Gui2Text6, 마한산적굴진입로2-10
    if(초기화=0210){
        갈X:=11, 갈Y:=9
        초기화=0211
    }
    if(X좌표=11 and Y좌표=9){
        초기화=0212
    }
    if(초기화=1002){
        Send {Shift down}zz{Shift up}3{enter}
        sleep 2000
    }
}
return