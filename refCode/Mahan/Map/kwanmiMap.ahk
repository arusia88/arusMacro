
관미동:
초기화 = 1000
hellfire_timer := A_TickCount

curIdx = 1
mapIdx = 1
FileRead, buffer, Map\kwanmi.json
t=(%buffer%)
FileAppend, %t%, log.txt
Loop {
    Gosub, 관미동좌표
    Gosub, 이동
    Gosub, 랜덤이동
    if(초기화=0411){
        break
    }
}
;;초기화
Return

관미동좌표:
if(초기화=1000){
    BlockInput, On
    Sleep 300
    초기화 = 0401
    BlockInput, Off
}

getPath := json(t, "mapInfo." mapIdx ".mapImg")
StringReplace, resultPath, getPath, `", ,All
mapPath = %A_Scriptdir%\%resultPath%
totalCount := json(t, "mapInfo." mapIdx ".count")
mapCount := json(t, "count")
ImageSearch, x맵1, y맵1, findSelfX, findSelfY, findSelfX+findSelfWidth, findSelfY+200, *TransFFFFFF *80 %mapPath%
if(ErrorLevel=0) {
    if(초기화 <> 0401) {
       return
    }

    if(mapIdx = 1) {
        Gosub, findNPC
        if (totalCount <= curIdx){
            ControlSend, , {Left}, Nexon.NWind
            Sleep, 1000
            ControlSend, , {Right}, Nexon.NWind
        }
    }

    if(mapIdx = 2) {
        ; Description :
        ; 1. find daenamu
        ; 2. if Exist daenamu, attack
        ; 3. find mob and then attack
        ; 4. else
        ; 5. find mob and then attack
        ; 6. not exist mob, and then move next point.
        Gosub, doOnMap2
    }

    if(mapIdx = 3) {
        Gosub, doOnMap3

    }

} else {
    if(totalCount <= curIdx) {
        mapIdx += 1
        curIdx = 1
    }

    if(mapCount < mapIdx) {
        초기화 = 1000
        mapIdx = 1
        curIdx = 1
    }

}
Return

doOnMap2:
    Gosub, 버프
    Gosub, 공증
    Gosub, 기원
    if(!갈X and !갈Y) {
        Gosub, setNextCoordinate
    }
    if(isDaenamu() = 1) {
        if(attack_mop() = 0){
            attack_xy(xDaenamu, yDaenamu) ; target is daenamu
        }
    } else {
        if(attack_mop() = 0){
            Gosub, 몹인식
            Gosub, setNextCoordinate
        }
    }
Return

doOnMap3:
    Gosub, fire_yuseong
    if(!갈X and !갈Y) {
        Gosub, setNextCoordinate
    }
    Gosub, 버프
    Gosub, 공증
    Gosub, 기원
    if (attack_mop() = 0){
        Gosub, 몹인식
    }
    Gosub, checkGiyomasa

Return

checkGiyomasa:
    if (isGiyomasa() = 1 || isGungsa() = 1 || isSamurai() = 1 || isDaejang() =1)
    {
        ControlSend,,{Shift down}z{Shift up}h,ahk_class Nexon.NWind
    } else {
        Gosub, setNextCoordinate
    }
Return

setNextCoordinate:
    cur := json(t, "mapInfo." mapIdx ".coordinate."curIdx)
    StringReplace, cur, cur, `", ,All
    StringSplit, curPos, cur , `,
    갈X:=curPos1, 갈Y:=curPos2

    if(Abs(X좌표-curPos1) <= 1 and Abs(Y좌표-curPos2) <= 1){
        curIdx += 1
    }
Return

attack_mop() {
    global
    result_mopAttack := 1
    if (isGiyomasa() = 1 && isSpecialBuf() = 1){
        attack_hellfire_xy(xGiyo+15, yGiyo+70)
        attack_xy(xGiyo+15, yGiyo+70)
    } else if (isGungsa() = 1) {
        attack_xy(xGungsa-10, yGungsa+70)
    } else if (isDaejang() = 1) {
        attack_xy(xDaejang-15, yDaejang+70)
    } else if (isSamurai() = 1) {
        attack_xy(xSamu-15, ySamu+70)
    } else if (isGiyomasa() = 1){
        attack_hellfire_xy(xGiyo+15, yGiyo+70)
        attack_xy(xGiyo+15, yGiyo+70)
    } else {
        result_mopAttack := 0
    }

    return result_mopAttack
}

isGiyomasa() {
    global
    ImageSearch, xGiyo, yGiyo, findSelfX, findSelfY, findSelfX+811, findSelfY+615, *TransFFFFFF *80 Img\kwanmi\giyomasa.bmp
    if(ErrorLevel = 0){
        return 1
    } else {
        return 0
    }
}
isDaenamu() {
    global
    ImageSearch, xDaenamu, yDaenamu, findSelfX, findSelfY, findSelfX+811, findSelfY+615, Img\kwanmi\daenamu.bmp
    if(ErrorLevel = 0){
        return 1
    } else {
        return 0
    }
}

isSamurai(){
    global
    ImageSearch, xSamu, ySamu, findSelfX, findSelfY, findSelfX+811, findSelfY+615, *TransFFFFFF *80 Img\kwanmi\samurai.bmp
    if(ErrorLevel = 0){
        return 1
    } else {
        return 0
    }
}

isGungsa() {
    global
    ImageSearch, xGungsa, yGungsa, findSelfX, findSelfY, findSelfX+811, findSelfY+615, *TransFFFFFF *80 Img\kwanmi\gungsa.bmp
    if(ErrorLevel = 0){
        return 1
    } else {
        return 0
    }
}

isDaejang() {
    global
    ImageSearch, xDaejang, yDaejang, findSelfX, findSelfY, findSelfX+811, findSelfY+615, *TransFFFFFF *80 Img\kwanmi\daejang.bmp
    if(ErrorLevel = 0){
        return 1
    } else {
        return 0
    }
}

isSpecialBuf() {
    global
    ImageSearch, xSpecialBuf, ySpecialBuf, findSelfX, findSelfY, findSelfX+500, findSelfY+615, Img\kwanmi\specialBuf.bmp
    if(ErrorLevel = 0){
        return 1
    } else {
        return 0
    }
}


attack_xy(x,y) {
    global
    ControlSend,,{esc}v,ahk_class Nexon.NWind
    Sleep, 100
    MouseClick, Left, %x%, %y%, 1
    Sleep, 100
    ControlSend,,v%sb7%%sb4%{esc},ahk_class Nexon.NWind
}

attack_hellfire_xy(x,y) {
    global
    Cal_hellfire := A_TickCount - hellfire_timer
    if (Cal_hellfire > 5000) {
        ControlSend,,{Shift down}z{Shift up}u,ahk_class Nexon.NWind
        Sleep, 100
        ControlSend,,{esc}v,ahk_class Nexon.NWind
        Sleep, 100
        MouseClick, Left, %x%, %y%, 1
        Sleep, 100
        ControlSend,,v%sb7%%sb3%{esc},ahk_class Nexon.NWind
        hellfire_timer := A_TickCount
    }
}

fire_jifok:
    Cal_skillTimer1:=A_TickCount-skillTimer1
    if(Cal_skillTimer1>30000){
        ControlSend, , {Esc}, ahk_class Nexon.NWind
        ControlSend, , {Shift Down}z{Shift Up}e, ahk_class Nexon.NWind
        Sleep, 200
        ControlSend, , {Enter}, ahk_class Nexon.NWind
        Sleep, 200
        ControlSend,,%sb9%, ahk_class Nexon.NWind
        skillTimer1:=A_TickCount
    }
return

fire_yuseong:
    Cal_skillTimer1:=A_TickCount-skillTimer1
    if(Cal_skillTimer1>10000){
        ControlSend, , {Esc}, ahk_class Nexon.NWind
        ControlSend, , {Shift Down}z{Shift Up}e, ahk_class Nexon.NWind
        Sleep, 200
        ControlSend, , {Enter}, ahk_class Nexon.NWind
        Sleep, 200
        ControlSend,,%sb10%, ahk_class Nexon.NWind
        skillTimer1:=A_TickCount
    }
return

findNPC:
    ImageSearch, xPotal, yPotal, findSelfX, findSelfY, findSelfX+findSelfWidth, findSelfY+findSelfHeight, Img\kwanmi\waitroom.bmp
    if(ErrorLevel = 0) {
        xPotal := xPotal+275
        yPotal := yPotal+45
        ControlSend, , {Esc}, ahk_class Nexon.NWind
        Sleep, 200
        MouseClick, Left, %xPotal%, %yPotal%, 2
        Sleep, 1000
        ControlSend, , {Down}, ahk_class Nexon.NWind
        Sleep, 500
        ControlSend, , {Enter}, ahk_class Nexon.NWind
        Sleep, 500
        ControlSend, , {Down}, ahk_class Nexon.NWind
        Sleep, 500
        ControlSend, , {Enter}, ahk_class Nexon.NWind
        Sleep, 500
        ControlSend, , {Esc}, ahk_class Nexon.NWind
        Sleep, 1000
        mapIdx += 1
        curIdx = 1
        return
    }
    Gosub, setNextCoordinate
return