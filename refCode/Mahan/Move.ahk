��ǥ:
X��=0
Loop, 9
{
    ImageSearch, X��1, xY��1, %����X��a%, %����Y��%, %����X��b%, %����Y�Ʒ�%, *TransFFFFFF *80 Img\%X��%.bmp
    if(ErrorLevel=1){
        X��:=X��+1
    }
    else if(ErrorLevel=0){
        break
    }
}
X��=0
Loop, 9
{
    ImageSearch, X��1, xY��1, %����X��a%, %����Y��%, %����X��b%, %����Y�Ʒ�%, *TransFFFFFF *80 Img\%X��%.bmp
    if(ErrorLevel=1){
        X��:=X��+1
    }
    else if(ErrorLevel=0){
        break
    }
}
X��=0
Loop, 9
{
    ImageSearch, X��1, xY��1, %����X��a%, %����Y��%, %����X��b%, %����Y�Ʒ�%, *TransFFFFFF *80 Img\%X��%.bmp
    if(ErrorLevel=1){
        X��:=X��+1
    }
    else if(ErrorLevel=0){
        break
    }
}
Y��=0
Loop, 9
{
    ImageSearch, Y��1, xY��1, %����Y��a%, %����Y��%, %����Y��b%, %����Y�Ʒ�%, *TransFFFFFF *80 Img\%Y��%.bmp
    if(ErrorLevel=1){
        Y��:=Y��+1
    }
    else if(ErrorLevel=0){
        break
    }
}
Y��=0
Loop, 9
{
    ImageSearch, Y��1, xY��1, %����Y��a%, %����Y��%, %����Y��b%, %����Y�Ʒ�%, *TransFFFFFF *80 Img\%Y��%.bmp
    if(ErrorLevel=1){
        Y��:=Y��+1
    }
    else if(ErrorLevel=0){

        break
    }
}
Y��=0
Loop, 9
{
    ImageSearch, Y��1, xY��1, %����Y��a%, %����Y��%, %����Y��b%, %����Y�Ʒ�%, *TransFFFFFF *80 Img\%Y��%.bmp
    if(ErrorLevel=1){
        Y��:=Y��+1
    }
    else if(ErrorLevel=0){
        break
    }
}
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
Gosub, ���
; MsgBox, ������X, ��X %��X% ������Y, ��Y %��Y% ��X, ��X %X��ǥ% ��Y, ��Y %Y��ǥ%�ʱ�ȭ��, �� %�ʱ�ȭ%
guicontrol, 2:text,������X, ��X %��X%
guicontrol, 2:text,������Y, ��Y %��Y%
guicontrol, 2:text,��X, ��X %X��ǥ%
guicontrol, 2:text,��Y, ��Y %Y��ǥ%
guicontrol, 2:text,�ʱ�ȭ��, �� %�ʱ�ȭ%
return
