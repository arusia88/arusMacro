
���̼�:
�ʱ�ȭ = 1000
hellfire_timer := A_TickCount
screenAttack_timer := A_TickCount
stateOnMap3 = 0
checkMop_Timer := A_TickCount
curIdx = 1
mapIdx = 1
FileRead, buffer, Map\kwanmiseo.json
t=(%buffer%)

Loop {
    Gosub, ���̼���ǥ
    Gosub, �̵�
    Gosub, �����̵�
    if(�ʱ�ȭ=0411){
        break
    }
}
;;�ʱ�ȭ
Return

���̼���ǥ:
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
if(ImageSearchWithGdip(x��1, y��1, findSelfX, findSelfY, findSelfX+findSelfWidth, findSelfY+615, mapPath, 50, 0xFFFFFF) >= 1)
{
    ; MsgBox, �̹�����ġ����
    if(�ʱ�ȭ <> 0401) {
       return
    }

    if(mapIdx = 1) {
        Gosub, findNPCAtSeo
    }

    if(mapIdx >= 4 and mapIdx < 11) {
        Gosub, ����
        Gosub, ���ν�
    }

    if(mapIdx = 10) {
        Gosub, handleGiyo
        stateOnMap3 = 0
    }

    if(mapIdx = 11) {
        Gosub, handleJang

    }
    Gosub, setNextCoordinate
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

handleGiyo:
if(��X = 21 and ��Y = 25) {
    ControlSend, , {Right}, ahk_class Nexon.NWind
}

if(X��ǥ = 21 and Y��ǥ = 25) {
    ControlSend, , {Down}, ahk_class Nexon.NWind
    Sleep, 1000
    ControlSend, , {Up}, ahk_class Nexon.NWind
    Sleep, 1000
}

Return

handleJang:
    if(X��ǥ = 15 and Y��ǥ = 22) {
        ControlSend, , {Right}, ahk_class Nexon.NWind
        Sleep, 1000
        ControlSend, , {Left}, ahk_class Nexon.NWind
        Sleep, 1000
    }

    ; healToSelf return 0 mean that self heal dosn't need more
    Gosub, ����
    if (healToSelf() = 0) {
        Gosub, ����
        if (isJangbyeok() = 1) {
            attack_hellfire_xy(xJang-10, yJang+70)
            attack_xy(xJang-10, yJang+70)
        }
        ; MsgBox, attack that
    } else {
        Gosub, ���ν�
    }

Return

healToSelf() {
global
ImageSearch, xx, yy, %����HP%, %����Yü%, %����HP%+30, %����Yü%+10, *50 Img\hpcolor.bmp
    if(ErrorLevel=1){
        ControlSend,,{esc}%sb2%{home}{enter},ahk_class Nexon.NWind
        Sleep 100
        ; MsgBox, heal need
        return 1
    }
    else
    {
        ; MsgBox, heal not need
        return 0

    }
}

findNPCAtSeo:
 if(!��X and !��Y) {
        mapIdx = 1
        curIdx = 1
        Gosub, setNextCoordinate
    }
    if(ImageSearchWithGdip(xPotal, yPotal, findSelfX, findSelfY, findSelfX+findSelfWidth, findSelfY+findSelfHeight, "Img\kwanmiseo\waitroom.bmp") = 1)
    {
        xPotal := xPotal-119
        yPotal := yPotal+232
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
return

isJangbyeok() {
    global
    if(ImageSearchWithGdip(xJang, yJang, findSelfX, findSelfY, findSelfX+811, findSelfY+615, "Img\kwanmiseo\jang.bmp", 0, 0xFFFFFF) >= 1)
    {
        ; MsgBox, find jang
        return 1
    } else {
        ; MsgBox, no find jang
        return 0
    }
}
; Using kwanmi Method
; setNextCoordinate:
; Return