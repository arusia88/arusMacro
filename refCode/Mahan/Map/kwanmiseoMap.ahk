
���̼�:
�ʱ�ȭ = 1000
hellfire_timer := A_TickCount
screenAttack_timer := A_TickCount
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
        Return
    }

    if(mapIdx >= 4 and mapIdx < 11) {
        Gosub, ����
        Gosub, ���ν�
    }

    if(mapIdx = 10) {
        Gosub, handleGiyo
    }

    if(mapIdx = 11) {
        Gosub, handleJang
        Gosub, ����
        Gosub, ���ν�

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

attack_mop()

Return

handleJang:
F2::
    if(X��ǥ = 15 and Y��ǥ = 22) {
        ControlSend, , {Right}, ahk_class Nexon.NWind
        Sleep, 1000
        ControlSend, , {Left}, ahk_class Nexon.NWind
        Sleep, 1000
    }

    if(isJangbyeok() = 1 and totalCount <= curIdx ) {
        curIdx = 1
        Gosub, setNextCoordinate
    }


Return

F1::
    if(X��ǥ = 15 and Y��ǥ = 22) {
        ControlSend, , {Right}, ahk_class Nexon.NWind
        Sleep, 1000
        ControlSend, , {Left}, ahk_class Nexon.NWind
        Sleep, 1000
    }

    Gosub, ����
    Gosub, ���
    Gosub, ����

    Loop, 1
    {
        ; healToSelf return 0 mean that self heal dosn't need more
        if (healToSelf() = 1) {
            MsgBox, 2222
            Return
        }
        if (leaveFromJang() = 0) {
            Gosub, ���ν�
            MsgBox, 111
            return
        }
        Gosub, ����
        Gosub, ����
        Gosub, �罽
        sleep 3000
        MsgBox, done
    }

Return

leaveFromJang() {
    global
    ; if (ImageSearchWithGdip(xMe, yMe, findSelfX, findSelfY, findSelfX+811, findSelfY+615, "Img\kwanmi\me.bmp", 50, 0xFFFFFF) >= 1) {
    ImageSearch, xMe, yMe, findSelfX, findSelfY, findSelfX+811, findSelfY+615, *50 *transFFFFFF Img\kwanmi\me.bmp
    if(ErrorLevel = 0){
        if (isJangbyeok() = 1) {
            if (yJang-yMe > 0){
                clickOver(-15, -110)
            } else if (yJang-yMe < 0){
                clickOver(-100, 145)
            } else if (xJang-xMe > 0){
                clickOver(-125,62)
            } else if (xJang-xMe < 0){
                clickOver(120,60)
            }
            return 1
        }
    }
    return 0
}

healToSelf() {
global
ImageSearch, xx, yy, %����HP%, %����Yü%, %����HP%+30, %����Yü%+10, *50 Img\hpcolor.bmp
    if(ErrorLevel=1){
        ControlSend,,{esc}%sb2%{home}{enter},ahk_class Nexon.NWind
        Sleep 100
        ; MsgBox, heal need
        return 1
    } else {
        ; MsgBox, heal not need
        return 0
    }
}

findNPCAtSeo:
 if(��X=15 and ��Y=22 || !��X and !��Y) {
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
    Gosub, setNextCoordinate

return

isJangbyeok() {
    global
    ImageSearch, xJang, yJang, xMe-150, yMe-100, xMe+150, yMe+150, *80 *transFFFFFF Img\kwanmiseo\jang.bmp
    if(ErrorLevel = 0){
        return 1
    } else {
        ; MsgBox, no find jang
        return 0
    }
}

