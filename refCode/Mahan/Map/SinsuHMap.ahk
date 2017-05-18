
신수계부터현무봉:
초기화 = 1000
curIdx = 1
mapIdx = 1
FileRead, buffer, Map\Sinsu.json
t=(%buffer%)

Loop {
    gosub, 신수계부터현무봉좌표
    Gosub, 좌표
    Gosub, 랜덤이동
    if(초기화=0411){
        break
    }
}
;;초기화
Return

신수계부터현무봉좌표:

if(초기화=1000){
    Send {Shift down}zz{shift up}4{enter}
    Sleep 200
    Send {Shift down}zz{shift up}4{enter}
    Sleep 200
    초기화 = 0001
}

ImageSearch, x신수마을, y신수마을, findSelfX, findSelfY, findSelfX+findSelfWidth, findSelfY+50, *TransFFFFFF *80 Img\sinsu\신수계.bmp
if(ErrorLevel=0) {
    guicontrol, 2:text,Gui2Text6, 신수계마을
    if(초기화=0001) {
        갈X:=55, 갈Y:=0
        초기화 = 0000
    }
}

ImageSearch, x신수현무봉, y신수현무봉, findSelfX, findSelfY, findSelfX+findSelfWidth, findSelfY+200, *TransFFFFFF *80 Img\sinsu\신수계현무봉.bmp
if(ErrorLevel=0) {
    if(초기화=0000) {
        Sleep, 50
        ImageSearch, X현포탈, Y현포탈, findSelfX, findSelfY, findSelfX+findSelfWidth, findSelfY+findSelfHeight, Img\sinsu\potal.bmp
        if(ErrorLevel=0){
            X포탈:=X현포탈+330
            Y포탈:=Y현포탈+30
            ; MsgBox, x y : %X포탈% %Y포탈%
            Send {esc}
            sleep 100
            ControlClick, x%X포탈% y%Y포탈%, 바람의나라
            Sleep 1000
            Send {down}
            Sleep 500
            Send {enter}
            Sleep 50
            Send {esc}
            Sleep 1000
            ;북쪽 4 의 의미
            초기화 = 0401
        }
    }
}

getPath := json(t, "mapInfo." mapIdx ".mapImg")
StringReplace, resultPath, getPath, `", ,All
mapPath = %A_Scriptdir%\%resultPath%
totalCount := json(t, "mapInfo." mapIdx ".count")
mapCount := json(t, "count")
; MsgBox, % mapPath
ImageSearch, x현무1, y현무1, findSelfX, findSelfY, findSelfX+findSelfWidth, findSelfY+200, *TransFFFFFF *80 %mapPath%
if(ErrorLevel=0) {
    Gosub, 버프
    Gosub, 몹인식
    if(mapCount = mapIdx and totalCount = curIdx) {
        초기화 = 1000
        mapIdx = 1
        curIdx = 1
        return
    }

    if(초기화 <> 0401) {
       return
    }

    cur := json(t, "mapInfo." mapIdx ".coordinate."curIdx)
    StringReplace, cur, cur, `", ,All
    StringSplit, curPos, cur , `,
    갈X:=curPos1, 갈Y:=curPos2
    if(Abs(X좌표-curPos1) <= 1 and Abs(Y좌표-curPos2) <= 1){
        curIdx += 1
    }

} else {
    if(totalCount <= curIdx) {
        ; 초기화 += 1
        mapIdx += 1
        curIdx = 1
    }
}

; ImageSearch, x현무1, y현무1, findSelfX, findSelfY, findSelfX+findSelfWidth, findSelfY+200, *TransFFFFFF *80 Img\sinsu\2.bmp
; if(ErrorLevel=0) {
;     초기화 = 1000
;     curIdx = 1
; }

Return