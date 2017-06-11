
°ü¹Ìµ¿:
; MsgBox, °ü¹Ìµ¿
ÃÊ±âÈ­ = 1000
hellfire_timer := A_TickCount
screenAttack_timer := A_TickCount
stateOnMap3 = 0
checkMop_Timer := A_TickCount
curIdx = 1
mapIdx = 1
FileRead, buffer, Map\kwanmi.json
t=(%buffer%)

Loop {
    Gosub, °ü¹Ìµ¿ÁÂÇ¥
    Gosub, ÀÌµ¿
    if(YÁÂÇ¥ < 7){
        Gosub, °øÁõ
        Gosub, ±â¿ø
        Gosub, ¼º·Á
    }
    Gosub, ·£´ýÀÌµ¿
    if(ÃÊ±âÈ­=0411){
        break
    }
}
;;ÃÊ±âÈ­
Return

°ü¹Ìµ¿ÁÂÇ¥:
; MsgBox, °ü¹Ìµ¿ÁÂÇ¥
if(ÃÊ±âÈ­=1000){
    BlockInput, On
    Sleep 300
    ÃÊ±âÈ­ = 0401
    BlockInput, Off
}

getPath := json(t, "mapInfo." mapIdx ".mapImg")
StringReplace, resultPath, getPath, `", ,All
mapPath = %A_Scriptdir%\%resultPath%
totalCount := json(t, "mapInfo." mapIdx ".count")
mapCount := json(t, "count")
if(ImageSearchWithGdip(x¸Ê1, y¸Ê1, findSelfX, findSelfY, findSelfX+findSelfWidth, findSelfY+615, mapPath, 50, 0xFFFFFF) >= 1)
{
    ; MsgBox, ÀÌ¹ÌÁö¼­Ä¡ÀÌÈÄ
    if(ÃÊ±âÈ­ <> 0401) {
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
        ÃÊ±âÈ­ = 1000
        mapIdx = 1
        curIdx = 1
    }

}
Return

doOnMap2:
    Gosub, ¹öÇÁ
    Gosub, °øÁõ
    Gosub, ±â¿ø
    ; TODO: check next coordinate x, y is set correctly
    if(°¥X=9 and °¥Y=7) {
        Gosub, setNextCoordinate
    }

    if(XÁÂÇ¥ >= 18) {
        ControlSend, , {Left}, ahk_class Nexon.NWind
        Sleep, 100
        ControlSend, , {Left}, ahk_class Nexon.NWind
        Sleep, 100
    }

    if(XÁÂÇ¥ = 13 and YÁÂÇ¥ = 0){
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
    Gosub, ¼º·Á

Return

doOnMap3:
    if(!°¥X and !°¥Y || (°¥X = 13 and °¥Y = 0)) {
        Gosub, ÀüÃ¼
        Gosub, setNextCoordinate
    }
    ; find monster, if mosster is not found while 5 seconds, state set 2

    if (stateOnMap3 = 0) {
        stateOnMap3 := attack_mop() > 0 ? 4 : 3
    }

    if (stateOnMap3 = 1) {
        if (XÁÂÇ¥ = 6 and YÁÂÇ¥ = 4) {
            Sleep, 1000
        }
        stateOnMap3 := attack_mop() > 0 ? 4 : 3
    }

    if (stateOnMap3 = 2) {
        if (XÁÂÇ¥ = 16 and YÁÂÇ¥ = 22) {
            Sleep, 1000
        }
        stateOnMap3 := attack_mop() > 0 ? 4 : 3
    }

    if (stateOnMap3 = 3) {
        Gosub, °øÁõ
        Gosub, ¼º·Á
        Gosub, setNextCoordinate
        stateOnMap3 := findStateOnMap3()
        Return
    }

    if (stateOnMap3 = 4) {
        Gosub, ¼º·Á
        stateOnMap3 := attack_mop() > 0 ? 4 : 3
    }

    ; stateOnMap3 := result_mopAttack
    ; if(stateOnMap3 > 0) {
    ;     Gosub, ¼º·Á
    ;     Gosub, setNextCoordinate
    ;     Return
    ; } else {
    ;     Gosub, ¼º·Á
    ; }
    Gosub, ¹öÇÁ
    Gosub, °øÁõ
    Gosub, ±â¿ø

Return

findStateOnMap3() {
    global
    if (YÁÂÇ¥ < 13 ) {
        ; MsgBox, here111
        phase = 1
        return 1
    }
    if (XÁÂÇ¥ > 14 ) {
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
    ; MsgBox, % "prev cur : " cur " " XÁÂÇ¥ " / " YÁÂÇ¥
    if(Abs(XÁÂÇ¥-curPos1) <= 1 and Abs(YÁÂÇ¥-curPos2) <= 1){
        curIdx += 1
    }
    cur := json(t, "mapInfo." mapIdx ".coordinate."curIdx)
    ; MsgBox, % "cur : " cur
    StringReplace, cur, cur, `", ,All
    StringSplit, curPos, cur , `,
    °¥X:=curPos1, °¥Y:=curPos2
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
    if(°¥X=9 and °¥Y=29 || !°¥X and !°¥Y) {
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