
�ż������������:
�ʱ�ȭ = 1000
curIdx = 1
mapIdx = 1
FileRead, buffer, Map\Sinsu.json
t=(%buffer%)

Loop {
    gosub, �ż��������������ǥ
    Gosub, ��ǥ
    Gosub, �����̵�
    if(�ʱ�ȭ=0411){
        break
    }
}
;;�ʱ�ȭ
Return

�ż��������������ǥ:

if(�ʱ�ȭ=1000){
    Send {Shift down}zz{shift up}4{enter}
    Sleep 200
    Send {Shift down}zz{shift up}4{enter}
    Sleep 200
    �ʱ�ȭ = 0001
}

ImageSearch, x�ż�����, y�ż�����, findSelfX, findSelfY, findSelfX+findSelfWidth, findSelfY+50, *TransFFFFFF *80 Img\sinsu\�ż���.bmp
if(ErrorLevel=0) {
    guicontrol, 2:text,Gui2Text6, �ż��踶��
    if(�ʱ�ȭ=0001) {
        ��X:=55, ��Y:=0
        �ʱ�ȭ = 0000
    }
}

ImageSearch, x�ż�������, y�ż�������, findSelfX, findSelfY, findSelfX+findSelfWidth, findSelfY+200, *TransFFFFFF *80 Img\sinsu\�ż���������.bmp
if(ErrorLevel=0) {
    if(�ʱ�ȭ=0000) {
        Sleep, 50
        ImageSearch, X����Ż, Y����Ż, findSelfX, findSelfY, findSelfX+findSelfWidth, findSelfY+findSelfHeight, Img\sinsu\potal.bmp
        if(ErrorLevel=0){
            X��Ż:=X����Ż+330
            Y��Ż:=Y����Ż+30
            ; MsgBox, x y : %X��Ż% %Y��Ż%
            Send {esc}
            sleep 100
            ControlClick, x%X��Ż% y%Y��Ż%, �ٶ��ǳ���
            Sleep 1000
            Send {down}
            Sleep 500
            Send {enter}
            Sleep 50
            Send {esc}
            Sleep 1000
            ;���� 4 �� �ǹ�
            �ʱ�ȭ = 0401
        }
    }
}

getPath := json(t, "mapInfo." mapIdx ".mapImg")
StringReplace, resultPath, getPath, `", ,All
mapPath = %A_Scriptdir%\%resultPath%
totalCount := json(t, "mapInfo." mapIdx ".count")
mapCount := json(t, "count")
; MsgBox, % mapPath
ImageSearch, x����1, y����1, findSelfX, findSelfY, findSelfX+findSelfWidth, findSelfY+200, *TransFFFFFF *80 %mapPath%
if(ErrorLevel=0) {
    Gosub, ����
    Gosub, ���ν�
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