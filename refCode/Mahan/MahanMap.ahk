���Ǻ��ʹ���:
ImageSearch, X1, Y1, 800, 100, 950, 300, Img\Hwansu.bmp
if(ErrorLevel=1){
    Send p
}
ImageSearch, X1, Y1, 1, 1, 1200, 500, *80 Img\MahanOut.bmp
if(ErrorLevel=0){
    ��X:=17, ��Y:=7
    guicontrol,text,��ġ, ���Է�
    Send {esc}{up}
    gosub, ȯ����ȯ
    gosub, ȯ���ൿ��
    gosub, ����ī��Ʈ
    gosub, �ڰ�
    �ʱ�ȭ=0
    ȯ��üũ=0
    ��ǳ������üũ=0
    Sleep 200
    if(ȥ��=1 or ����=1){
        Loop, 1{
            Send {esc}
            sleep 200
            Send {Ctrl down}r{Ctrl up}
            Sleep 2000
            Loop, 100 {
                ImageSearch, X��Ż, Y��Ż, findSelfX, findSelfY, findSelfX+findSelfWidth, findSelfY+findSelfHeight, *80 Img\Potal.bmp
                if(ErrorLevel=0){
                    X��Ż:=X��Ż+30
                    Y��Ż:=Y��Ż+30
                    ; MsgBox, x��Ży��Ż ��ġ : %X��Ż% , %Y��Ż%
                    Send {esc}
                    sleep 100
                    ; MsgBox, found
                    ControlClick, x%X��Ż% y%Y��Ż%, �ٶ��ǳ���
                    ; ControlSend, , {Tab}, ahk_class Nexon.NWind
                    ; sleep 200
                    ; ControlSend, , {Right}, ahk_class Nexon.NWind
                    ; sleep 200
                    ; ControlSend, , {Enter}, ahk_class Nexon.NWind
                    sleep 200
                    if(ȥ��=1){
                        Sleep 1000
                        Send {down}
                        Sleep 500
                        Send {enter}
                        Sleep 500
                        Send {esc}
                        Sleep 1000
                    }
                    if(����=1){
                        Sleep 1000
                        Send {up}
                        Sleep 500
                        Send {Enter}
                        Sleep 400
                        Send {up}
                        Sleep 500
                        Send {Enter}
                        Sleep 400
                        Send {esc}
                        Sleep 1000
                    }
                    break
                }
                Sleep 30
            }
            if(ErrorLevel=0){


            }
        }
    }
}
ImageSearch, X1, Y1, 1, 1, 1200, 500, *80 Img\in.bmp
if(ErrorLevel=0){
    guicontrol,text,��ġ, �ұ�
    gosub, ȯ����ȯ
    ȯ����ȯüũ=0
    ȯ���ൿ��üũ=0
    �����ʱ�ȭ=0
    if(X��ǥ=17 and Y��ǥ=11 or �ʱ�ȭ=0){
        ��X:=16, ��Y:=13
        �ʱ�ȭ=1
    }
    if(X��ǥ=16 and Y��ǥ=13){
        ��X:=17, ��Y:=11
    }
    ImageSearch, X1, Y1, 1, 1, 1400, 500, *TransFFFFFF *80 Img\exit.bmp
    if(ErrorLevel=0){
        gosub, ��ǳ������
    }
}
return