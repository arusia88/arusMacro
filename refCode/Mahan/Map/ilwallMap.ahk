
�Ͽ�����:
�ʱ�ȭ = 1000
curIdx = 1
mapIdx = 1
FileRead, buffer, Map\ilwall.json
t=(%buffer%)

Loop {
    gosub, �Ͽ�������ǥ
    Gosub, ��ǥ
    Gosub, �����̵�
    if(�ʱ�ȭ=0411){
        break
    }
}
;;�ʱ�ȭ
Return

�Ͽ�������ǥ:

if(�ʱ�ȭ=1000){
    BlockInput, On
    Sleep 200
    Send {Shift down}zz{shift up}1{enter}
    Sleep 500
    Send {Shift down}zz{shift up}1{enter}
    Sleep 300
    FileAppend, did you stop?, log.txt
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
    if (mapIdx > 2) {
        Gosub, ����
        Gosub, ���ν�
    }
    if(mapCount = mapIdx and totalCount = curIdx) {
        �ʱ�ȭ = 1000
        mapIdx = 1
        curIdx = 1
        return
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

; ImageSearch, x����1, y����1, findSelfX, findSelfY, findSelfX+findSelfWidth, findSelfY+200, *TransFFFFFF *80 Img\sinsu\2.bmp
; if(ErrorLevel=0) {
;     �ʱ�ȭ = 1000
;     curIdx = 1
; }

Return