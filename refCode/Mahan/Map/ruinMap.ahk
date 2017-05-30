
폐허대로:
초기화 = 1000
curIdx = 1
mapIdx = 1
FileRead, buffer, Map\ruin.json
t=(%buffer%)

Loop {
    Gosub, 폐허대로좌표
    Gosub, 이동
    Gosub, 랜덤이동
    if(초기화=0411){
        break
    }
}
;;초기화
Return

폐허대로좌표:

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
; MsgBox, % mapPath
ImageSearch, x맵1, y맵1, findSelfX, findSelfY, findSelfX+findSelfWidth, findSelfY+200, *TransFFFFFF *80 %mapPath%
if(ErrorLevel=0) {
    Gosub, 버프
    Gosub, 몹인식

    if(mapCount <= mapIdx and totalCount <= curIdx) {
        mapIdx = 1
        curIdx = 1
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

Return