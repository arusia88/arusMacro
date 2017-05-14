좌표:
X백=0
Loop, 9
{
    ImageSearch, X백1, xY백1, %범위X백a%, %범위Y위%, %범위X백b%, %범위Y아래%, *TransFFFFFF *80 Img\%X백%.bmp
    if(ErrorLevel=1){
        X백:=X백+1
    }
    else if(ErrorLevel=0){
        break
    }
}
X십=0
Loop, 9
{
    ImageSearch, X십1, xY십1, %범위X십a%, %범위Y위%, %범위X십b%, %범위Y아래%, *TransFFFFFF *80 Img\%X십%.bmp
    if(ErrorLevel=1){
        X십:=X십+1
    }
    else if(ErrorLevel=0){
        break
    }
}
X일=0
Loop, 9
{
    ImageSearch, X일1, xY일1, %범위X일a%, %범위Y위%, %범위X일b%, %범위Y아래%, *TransFFFFFF *80 Img\%X일%.bmp
    if(ErrorLevel=1){
        X일:=X일+1
    }
    else if(ErrorLevel=0){
        break
    }
}
Y백=0
Loop, 9
{
    ImageSearch, Y백1, xY백1, %범위Y백a%, %범위Y위%, %범위Y백b%, %범위Y아래%, *TransFFFFFF *80 Img\%Y백%.bmp
    if(ErrorLevel=1){
        Y백:=Y백+1
    }
    else if(ErrorLevel=0){
        break
    }
}
Y십=0
Loop, 9
{
    ImageSearch, Y십1, xY십1, %범위Y십a%, %범위Y위%, %범위Y십b%, %범위Y아래%, *TransFFFFFF *80 Img\%Y십%.bmp
    if(ErrorLevel=1){
        Y십:=Y십+1
    }
    else if(ErrorLevel=0){

        break
    }
}
Y일=0
Loop, 9
{
    ImageSearch, Y일1, xY일1, %범위Y일a%, %범위Y위%, %범위Y일b%, %범위Y아래%, *TransFFFFFF *80 Img\%Y일%.bmp
    if(ErrorLevel=1){
        Y일:=Y일+1
    }
    else if(ErrorLevel=0){
        break
    }
}
X좌표:=(X백*100)+(X십*10)+(X일)
Y좌표:=(Y백*100)+(Y십*10)+(Y일)
if(갈Y>Y좌표){
    ControlSend,, {down},ahk_class Nexon.NWind
    Sleep 50
}
if(갈Y<Y좌표){
    ControlSend,, {up},ahk_class Nexon.NWind
    Sleep 50
}
if(갈X>X좌표){
    ControlSend,, {right},ahk_class Nexon.NWind
    Sleep 50
}
if(갈X<X좌표){
    ControlSend,, {Left},ahk_class Nexon.NWind
    Sleep 50
}
Gosub, 기원
; MsgBox, 가야할X, 갈X %갈X% 가야할Y, 갈Y %갈Y% 현X, 현X %X좌표% 현Y, 현Y %Y좌표%초기화값, 값 %초기화%
guicontrol, 2:text,가야할X, 갈X %갈X%
guicontrol, 2:text,가야할Y, 갈Y %갈Y%
guicontrol, 2:text,현X, 현X %X좌표%
guicontrol, 2:text,현Y, 현Y %Y좌표%
guicontrol, 2:text,초기화값, 값 %초기화%
return
