
관미서:
초기화 = 1000
hellfire_timer := A_TickCount
screenAttack_timer := A_TickCount
stateOnMap3 = 0
checkMop_Timer := A_TickCount
curIdx = 1
mapIdx = 1
FileRead, buffer, Map\kwanmiseo.json
t=(%buffer%)

Loop {
    Gosub, 관미서좌표
    Gosub, 이동
    Gosub, 랜덤이동
    if(초기화=0411){
        break
    }
}
;;초기화
Return

관미서좌표:
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
        Gosub, findNPCAtSeo
    }

    if(mapIdx >= 4 and mapIdx < 11) {
        Gosub, 버프
        Gosub, 몹인식
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
        초기화 = 1000
        mapIdx = 1
        curIdx = 1
    }

}
Return

handleGiyo:
if(갈X = 21 and 갈Y = 25) {
    ControlSend, , {Right}, ahk_class Nexon.NWind
}

if(X좌표 = 21 and Y좌표 = 25) {
    ControlSend, , {Down}, ahk_class Nexon.NWind
    Sleep, 1000
    ControlSend, , {Up}, ahk_class Nexon.NWind
    Sleep, 1000
}

Return

handleJang:
    if(X좌표 = 15 and Y좌표 = 22) {
        ControlSend, , {Right}, ahk_class Nexon.NWind
        Sleep, 1000
        ControlSend, , {Left}, ahk_class Nexon.NWind
        Sleep, 1000
    }

    ; healToSelf return 0 mean that self heal dosn't need more
    Gosub, 공증
    if (healToSelf() = 0) {
        Gosub, 버프
        if (isJangbyeok() = 1) {
            attack_hellfire_xy(xJang-10, yJang+70)
            attack_xy(xJang-10, yJang+70)
        }
        ; MsgBox, attack that
    } else {
        Gosub, 몹인식
    }

Return

healToSelf() {
global
ImageSearch, xx, yy, %범위HP%, %범위Y체%, %범위HP%+30, %범위Y체%+10, *50 Img\hpcolor.bmp
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
 if(!갈X and !갈Y) {
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