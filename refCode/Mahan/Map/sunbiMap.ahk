
선비족:
초기화 = 1000
curIdx = 1
mapIdx = 1
FileRead, buffer, Map\sunbi.json
t=(%buffer%)

Loop {
    gosub, 선비족좌표
    Gosub, 이동
    Gosub, 랜덤이동
    if(초기화=0411){
        break
    }
}
;;초기화
Return

선비족좌표:

if(초기화=1000){
    BlockInput, On
    Sleep 200
    초기화 = 0401
    BlockInput, Off
}

getPath := json(t, "mapInfo." mapIdx ".mapImg")
StringReplace, resultPath, getPath, `", ,All
mapPath = %A_Scriptdir%\%resultPath%
totalCount := json(t, "mapInfo." mapIdx ".count")
mapCount := json(t, "count")

if (mapIdx = 1) {
    ImageSearch, x맵1, y맵1, findSelfX, findSelfY, findSelfX+findSelfWidth, findSelfY+200, *TransFFFFFF *80 Img\sunbi\0.bmp
    if(ErrorLevel=0) {
        갈X:=19, 갈Y:=6
        mapIdx = 1
        curIdx = 1
    }
}
; MsgBox, % mapPath
ImageSearch, x맵1, y맵1, findSelfX, findSelfY, findSelfX+findSelfWidth, findSelfY+200, *TransFFFFFF *80 %mapPath%
if(ErrorLevel=0) {
    Gosub, 버프
    Gosub, 몹인식

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
    if(mapCount < mapIdx) {
        초기화 = 1000
        mapIdx = 1
        curIdx = 1
    }
}

; ImageSearch, x현무1, y현무1, findSelfX, findSelfY, findSelfX+findSelfWidth, findSelfY+200, *TransFFFFFF *80 Img\sinsu\2.bmp
; if(ErrorLevel=0) {
;     초기화 = 1000
;     curIdx = 1
; }

Return