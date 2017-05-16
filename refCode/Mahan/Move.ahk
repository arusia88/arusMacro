좌표:

X백 := convertImgToPos(범위X백a, 범위Y위, 100)
X십 := convertImgToPos(범위X십a, 범위Y위, 10)
X일 := convertImgToPos(범위X일a, 범위Y위, 1)

Y백 := convertImgToPos(범위Y백a, 범위Y위, 200)
Y십 := convertImgToPos(범위Y십a, 범위Y위, 20)
Y일 := convertImgToPos(범위Y일a, 범위Y위, 2)

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
