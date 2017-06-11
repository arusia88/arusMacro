
관미동:
; MsgBox, 관미동
초기화 = 1000
hellfire_timer := A_TickCount
screenAttack_timer := A_TickCount
stateOnMap3 = 0
checkMop_Timer := A_TickCount
curIdx = 1
mapIdx = 1
FileRead, buffer, Map\kwanmi.json
t=(%buffer%)

Loop {
    Gosub, 관미동좌표
    Gosub, 이동
    if(Y좌표 < 7){
        Gosub, 공증
        Gosub, 기원
        Gosub, 성려
    }
    Gosub, 랜덤이동
    if(초기화=0411){
        break
    }
}
;;초기화
Return

관미동좌표:
; MsgBox, 관미동좌표
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
if(ImageSearchWithGdip(x맵1, y맵1, findSelfX, findSelfY, findSelfX+findSelfWidth, findSelfY+615, mapPath, 50, 0xFFFFFF) >= 1)
{
    ; MsgBox, 이미지서치이후
    if(초기화 <> 0401) {
       return
    }

    if(mapIdx = 1) {
        Gosub, findNPC
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
        stateOnMap3 = 0
        phase = 0
    }

    if(mapIdx = 3) {

        Gosub, doOnMap3

    }
    Sleep, 100

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
    ; TODO: check next coordinate x, y is set correctly
    if(갈X=9 and 갈Y=7) {
        Gosub, setNextCoordinate
    }

    if(X좌표 >= 18) {
        ControlSend, , {Left}, ahk_class Nexon.NWind
        Sleep, 100
        ControlSend, , {Left}, ahk_class Nexon.NWind
        Sleep, 100
    }

    if(X좌표 = 13 and Y좌표 = 0){
        ControlSend, , {Left}, ahk_class Nexon.NWind
        Sleep, 100
        ControlSend, , {Right}, ahk_class Nexon.NWind
    }

    if(isDaenamu() = 1) {
        attack_xy(xDaenamu, yDaenamu) ; target is daenamu

    } else {
        if(isMop()=0) {
            Gosub, setNextCoordinate
        }
    }
    Gosub, 성려

Return

doOnMap3:
    if(!갈X and !갈Y || (갈X = 13 and 갈Y = 0)) {
        Gosub, 전체
        Gosub, setNextCoordinate
    }
    ; find monster, if mosster is not found while 5 seconds, state set 2

    if (stateOnMap3 = 0) {
        stateOnMap3 := attack_mop() > 0 ? 4 : 3
    }

    if (stateOnMap3 = 1) {
        if (X좌표 = 6 and Y좌표 = 4) {
            Sleep, 1000
        }
        stateOnMap3 := attack_mop() > 0 ? 4 : 3
    }

    if (stateOnMap3 = 2) {
        if (X좌표 = 16 and Y좌표 = 22) {
            Sleep, 1000
        }
        stateOnMap3 := attack_mop() > 0 ? 4 : 3
    }

    if (stateOnMap3 = 3) {
        Gosub, 공증
        Gosub, 성려
        Gosub, setNextCoordinate
        stateOnMap3 := findStateOnMap3()
        Return
    }

    if (stateOnMap3 = 4) {
        Gosub, 성려
        stateOnMap3 := attack_mop() > 0 ? 4 : 3
    }

    ; stateOnMap3 := result_mopAttack
    ; if(stateOnMap3 > 0) {
    ;     Gosub, 성려
    ;     Gosub, setNextCoordinate
    ;     Return
    ; } else {
    ;     Gosub, 성려
    ; }
    Gosub, 버프
    Gosub, 공증
    Gosub, 기원

Return

findStateOnMap3() {
    global
    if (Y좌표 < 13 ) {
        ; MsgBox, here111
        phase = 1
        return 1
    }
    if (X좌표 > 14 ) {
        ; MsgBox, here222
        return 2
    }

    if (phase = 0) {
        return 3
    }
    return 3
}

isNoExistKwanmiMop() {
    global
    checkMoptime_cal := A_TickCount - checkMop_Timer
    if ( attack_mop() = 0){
        if (checkMoptime_cal < 1000) {
            prevExistNoMop = 1
        }
        if (checkMoptime_cal > 3000) {
            checkMop_Timer := A_TickCount
            if (prevExistNoMop = 1) {
                return 1
            }
        }
    }
    ; if(attack_mop() > 0){
    ;     return 0
    ; }
    return 0
}

setNextCoordinate:
    ; MsgBox, % "prev cur : " cur " " X좌표 " / " Y좌표
    if(Abs(X좌표-curPos1) <= 1 and Abs(Y좌표-curPos2) <= 1){
        curIdx += 1
    }
    cur := json(t, "mapInfo." mapIdx ".coordinate."curIdx)
    ; MsgBox, % "cur : " cur
    StringReplace, cur, cur, `", ,All
    StringSplit, curPos, cur , `,
    갈X:=curPos1, 갈Y:=curPos2
Return

attack_mop() {
    global
    if(isMop() = 0) {
        FileAppend, "no exist mop", log.txt
        return 0
    }
    result_mopAttack := 0
    if (isGiyomasa() = 1 && isSpecialBuf() = 1){
        attack_hellfire_xy(xGiyo+15, yGiyo+70)
        attack_xy(xGiyo+15, yGiyo+70)
        result_mopAttack := 1
        FileAppend, "isGiyomasa and isSpecialBuf", log.txt
    } else if (isGungsa() = 1) {
        attack_xy(xGungsa-10, yGungsa+70)
        result_mopAttack := 1
        FileAppend, "xGungsa", log.txt
    } else if (isDaejang() = 1) {
        attack_xy(xDaejang-15, yDaejang+70)
        result_mopAttack := 1
        FileAppend, "isDaejang", log.txt
    } else if (isSamurai() = 1) {
        attack_xy(xSamu-15, ySamu+70)
        result_mopAttack := 1
        FileAppend, "isSamurai", log.txt
    } else if (isGiyomasa() = 1){
        attack_hellfire_xy(xGiyo+15, yGiyo+70)
        attack_xy(xGiyo+15, yGiyo+70)
        result_mopAttack := 1
        FileAppend, "isGiyomasa", log.txt
    } else {
        result_mopAttack := 0
        FileAppend, "no exist mop!!", log.txt
    }

    return result_mopAttack
}

isGiyomasa() {
    global
    if(ImageSearchWithGdip(xGiyo, yGiyo, findSelfX, findSelfY, findSelfX+811, findSelfY+615, "Img\kwanmi\giyomasa.bmp", 0, 0xFFFFFF) >= 1)
    {
        return 1
    } else {
        return 0
    }
}
isDaenamu() {
    global
    if(ImageSearchWithGdip(xDaenamu, yDaenamu, findSelfX, findSelfY, findSelfX+811, findSelfY+615, "Img\kwanmi\daenamu.bmp") >= 1)
    {
        return 1
    } else {
        return 0
    }
}

isSamurai(){
    global
    if(ImageSearchWithGdip(xSamu, ySamu, findSelfX, findSelfY, findSelfX+811, findSelfY+615, "Img\kwanmi\samurai.bmp", 0, 0xFFFFFF) >= 1)
    {
        return 1
    } else {
        return 0
    }
}

isGungsa() {
    global
    if(ImageSearchWithGdip(xGungsa, yGungsa, findSelfX, findSelfY, findSelfX+811, findSelfY+615, "Img\kwanmi\gungsa.bmp", 0, 0xFFFFFF) >= 1)
    {
        return 1
    } else {
        return 0
    }
}

isDaejang() {
    global
    if(ImageSearchWithGdip(xDaejang, yDaejang, findSelfX, findSelfY, findSelfX+811, findSelfY+615, "Img\kwanmi\daejang.bmp", 0, 0xFFFFFF) >= 1)
    {
        return 1
    } else {
        return 0
    }
}

isSpecialBuf() {
    global
    if(ImageSearchWithGdip(xSpecialBuf, ySpecialBuf, findSelfX, findSelfY, findSelfX+500, findSelfY+615, "Img\kwanmi\specialBuf.bmp") >= 1)
    {
        return 1
    } else {
        return 0
    }
}

isUsedPok() {
    global
    if(ImageSearchWithGdip(xPok, yPok, findSelfX, findSelfY, findSelfX+400, findSelfY+800, "Img\kwanmi\pok.bmp") >= 1)
    {
        msgbox, found
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
    if (Cal_hellfire > 8000) {
        ; hellfire
        fix_target(x,y)
        casting_skill_direct(sb7)
        casting_skill_direct(sb3)
        Sleep, 1000

        fix_target(x,y)
        ; sammae
        ; casting_skill_with_shift(smg)
        ; casting_skill_with_shift(st)
        casting_skill_direct(sb4)
        Sleep, 1000
        casting_skill_direct(sb4)
        Sleep, 1000
        casting_skill_direct(sb4)
        Sleep, 1000
        casting_skill_direct(sb4)
        Sleep, 1000
        casting_skill_direct(sb4)
        Sleep, 1000
        casting_skill_direct(sb4)
        Sleep, 1000
        casting_skill_direct(sb4)
        Sleep, 1000

        casting_skill_direct(sb1)
        casting_skill_with_shift(sq)

        Sleep, 500
        ControlSend,,{Esc},ahk_class Nexon.NWind

        hellfire_timer := A_TickCount
    }
}

fix_target(x,y){
    ControlSend,,{esc}v,ahk_class Nexon.NWind
    Sleep, 100
    MouseClick, Left, %x%, %y%, 1
    Sleep, 100
    ControlSend,,v,ahk_class Nexon.NWind
}

casting_skill_direct(skill) {
    ControlSend,,%skill%,ahk_class Nexon.NWind
}

casting_skill_with_shift(skill) {
    ControlSend,,{Shift down}z{Shift up}%skill%,ahk_class Nexon.NWind
}

findNPC:
    if(갈X=9 and 갈Y=29 || !갈X and !갈Y) {
        mapIdx = 1
        curIdx = 1
        Gosub, setNextCoordinate
    }
    if(ImageSearchWithGdip(xPotal, yPotal, findSelfX, findSelfY, findSelfX+findSelfWidth, findSelfY+findSelfHeight, "Img\kwanmi\waitroom.bmp", 50) = 1)
    {
        xPotal := xPotal+275
        yPotal := yPotal+45
        ; MsgBox, % "result return : " xPotal " " yPotal
        ControlSend, , {Esc}, ahk_class Nexon.NWind
        Sleep, 200
        MouseClick, Left, %xPotal%, %yPotal%, 2
        Sleep, 1000
        ControlSend, , {Down}, ahk_class Nexon.NWind
        Sleep, 1000
        ControlSend, , {Enter}, ahk_class Nexon.NWind
        Sleep, 1000
        ControlSend, , {Down}, ahk_class Nexon.NWind
        Sleep, 1000
        ControlSend, , {Enter}, ahk_class Nexon.NWind
        Sleep, 1000
        ControlSend, , {Esc}, ahk_class Nexon.NWind
        Sleep, 1000
        mapIdx += 1
        curIdx = 1
        return
    }
    Gosub, setNextCoordinate
return