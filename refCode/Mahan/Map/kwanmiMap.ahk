
���̵�:
; MsgBox, ���̵�
�ʱ�ȭ = 1000
hellfire_timer := A_TickCount

curIdx = 1
mapIdx = 1
FileRead, buffer, Map\kwanmi.json
t=(%buffer%)

Loop {
    Gosub, ���̵���ǥ
    Gosub, �̵�
    Gosub, �����̵�
    if(�ʱ�ȭ=0411){
        break
    }
}
;;�ʱ�ȭ
Return

���̵���ǥ:
; MsgBox, ���̵���ǥ
if(�ʱ�ȭ=1000){
    BlockInput, On
    Sleep 300
    �ʱ�ȭ = 0401
    BlockInput, Off
}

getPath := json(t, "mapInfo." mapIdx ".mapImg")
StringReplace, resultPath, getPath, `", ,All
mapPath = %A_Scriptdir%\%resultPath%
totalCount := json(t, "mapInfo." mapIdx ".count")
mapCount := json(t, "count")
if(ImageSearchWithGdip(x��1, y��1, findSelfX, findSelfY, findSelfX+findSelfWidth, findSelfY+615, mapPath, 0, 0xFFFFFF) >= 1)
{
    ; MsgBox, �̹�����ġ����
    if(�ʱ�ȭ <> 0401) {
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
    Sleep, 100

} else {
    if(totalCount <= curIdx) {
        mapIdx += 1
        curIdx = 1
    }

    if(mapCount < mapIdx) {
        �ʱ�ȭ = 1000
        mapIdx = 1
        curIdx = 1
    }

}
Return

doOnMap2:
    Gosub, ����
    Gosub, ����
    Gosub, ���
    if(!��X and !��Y) {
        Gosub, setNextCoordinate
    }
    isDaenamu:=isDaenamu()
    attack_mop:=attack_mop()
    if(isDaenamu = 1) {
        if(attack_mop = 0){
            attack_xy(xDaenamu, yDaenamu) ; target is daenamu
        }
    } else {
        if(attack_mop = 0){
            ; MsgBox, updateNext
            ; Gosub, ���ν�
            Gosub, setNextCoordinate
        }
    }
Return

doOnMap3:
    Gosub, fire_yuseong
    if(!��X and !��Y || (��X = 13 and ��Y = 0)) {
        Gosub, setNextCoordinate
    }
    Gosub, ����
    Gosub, ����
    Gosub, ���
    if (attack_mop() = 0){
        Gosub, ���ν�
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
    ; MsgBox, % "prev cur : " cur " " X��ǥ " / " Y��ǥ
    if(Abs(X��ǥ-curPos1) <= 1 and Abs(Y��ǥ-curPos2) <= 1){
        curIdx += 1
    }
    cur := json(t, "mapInfo." mapIdx ".coordinate."curIdx)
    ; MsgBox, % "cur : " cur
    StringReplace, cur, cur, `", ,All
    StringSplit, curPos, cur , `,
    ��X:=curPos1, ��Y:=curPos2
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
    if(ImageSearchWithGdip(xPotal, yPotal, findSelfX, findSelfY, findSelfX+findSelfWidth, findSelfY+findSelfHeight, "Img\kwanmi\waitroom.bmp") = 1)
    {
        xPotal := xPotal+275
        yPotal := yPotal+45
        ; MsgBox, % "result return : " xPotal " " yPotal
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