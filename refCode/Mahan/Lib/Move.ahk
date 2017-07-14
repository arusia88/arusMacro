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

이동:
X백 := convertImgToPos(범위X백a, 범위Y위, 100)
X십 := convertImgToPos(범위X십a, 범위Y위, 10)
X일 := convertImgToPos(범위X일a, 범위Y위, 1)

Y백 := convertImgToPos(범위Y백a, 범위Y위, 200)
Y십 := convertImgToPos(범위Y십a, 범위Y위, 20)
Y일 := convertImgToPos(범위Y일a, 범위Y위, 2)


X좌표:=(X백*100)+(X십*10)+(X일)
Y좌표:=(Y백*100)+(Y십*10)+(Y일)

if(초상 = 1){
    if(갈Y - Y좌표 > 5) {
        moveByChosang("Down")
    } else if (갈Y - Y좌표 < -5) {
        moveByChosang("Up")
    } else if (갈X - X좌표 > 5) {
        moveByChosang("Right")
    } else if (갈X - X좌표 < -5) {
        moveByChosang("Left")
    }
}

curDirection = 0

if(갈Y>Y좌표){
    ControlSend,, {down},ahk_class Nexon.NWind
    Sleep 50
    curDirection = 3
}
if(갈Y<Y좌표){
    ControlSend,, {up},ahk_class Nexon.NWind
    Sleep 50
    curDirection = 4
}
if(갈X>X좌표){
    ControlSend,, {right},ahk_class Nexon.NWind
    Sleep 50
    curDirection = 1
}
if(갈X<X좌표){
    ControlSend,, {Left},ahk_class Nexon.NWind
    Sleep 50
    curDirection = 2
}



; Gosub, 기원

;; At kwanmi, it is not needed because it is instance field
Gosub, heopung

guicontrol, 2:text,가야할X, 갈X %갈X%
guicontrol, 2:text,가야할Y, 갈Y %갈Y%
guicontrol, 2:text,현X, 현X %X좌표%
guicontrol, 2:text,현Y, 현Y %Y좌표%
guicontrol, 2:text,초기화값, 값 %stateOnMap3%
guicontrol, 2:text,result_mopAttack, 몹이존재하는지 %result_mopAttack%

Return

랜덤이동:
if(랜덤이동=1){
    Cal_RandomTimer:=A_TickCount-RandomTimer
    if(Cal_RandomTimer<1000){
        이전X좌표=%X좌표%
        이전Y좌표=%Y좌표%
    }
    if(Cal_RandomTimer>3000){
        현재X좌표=%X좌표%
        현재Y좌표=%Y좌표%
        if(이전X좌표=현재X좌표 and 이전Y좌표=현재Y좌표){
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
FileAppend, %X좌표%`,%Y좌표% `r, resource/Pos.txt
prev:= filenum
Return

F4::
gdipToken := Gdip_Startup()
PosX := X찾-516
PosY := Y찾-736
string = %PosX%|%PosY%|72|17
; MsgBox, %string%
filenum += 1
fileName = resource/%filenum%.bmp
pBitmap:=Gdip_BitmapFromScreen(string)
ret := Gdip_SaveBitmapToFile(pBitmap, fileName)

file = expected.bmp
Return