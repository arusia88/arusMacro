
������:
�ʱ�ȭ = 1000
curIdx = 1
mapIdx = 1
FileRead, buffer, Map\ruin.json
t=(%buffer%)

Loop {
    Gosub, ��������ǥ
    Gosub, �̵�
    Gosub, �����̵�
    if(�ʱ�ȭ=0411){
        break
    }
}
;;�ʱ�ȭ
Return

��������ǥ:

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
; MsgBox, % mapPath
ImageSearch, x��1, y��1, findSelfX, findSelfY, findSelfX+findSelfWidth, findSelfY+200, *TransFFFFFF *80 %mapPath%
if(ErrorLevel=0) {
    Gosub, ����
    Gosub, ���ν�

    if(mapCount <= mapIdx and totalCount <= curIdx) {
        mapIdx = 1
        curIdx = 1
    }

    if(�ʱ�ȭ <> 0401) {
       return
    }

    cur := json(t, "mapInfo." mapIdx ".coordinate."curIdx)
    StringReplace, cur, cur, `", ,All
    StringSplit, curPos, cur , `,
    ��X:=curPos1, ��Y:=curPos2
    if(Abs(X��ǥ-curPos1) <= 1 and Abs(Y��ǥ-curPos2) <= 1){
        curIdx += 1
    }

} else {
    if(totalCount <= curIdx) {
        ; �ʱ�ȭ += 1
        mapIdx += 1
        curIdx = 1
    }

}

Return