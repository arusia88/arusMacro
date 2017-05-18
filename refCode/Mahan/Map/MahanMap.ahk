대기실부터던전:
ImageSearch, X1, Y1, 800, 100, 950, 300, Img\Hwansu.bmp
if(ErrorLevel=1){
    Send p
}
ImageSearch, X1, Y1, 1, 1, 1200, 500, *80 Img\MahanOut.bmp
if(ErrorLevel=0){
    갈X:=17, 갈Y:=7
    guicontrol,text,위치, 진입로
    Send {esc}{up}
    gosub, 환수귀환
    gosub, 환수행동력
    gosub, 바퀴카운트
    gosub, 자경
    초기화=0
    환수체크=0
    허풍선방지체크=0
    Sleep 200
    if(혼자=1 or 같이=1){
        Loop, 1{
            Send {esc}
            sleep 200
            Send {Ctrl down}r{Ctrl up}
            Sleep 2000
            Loop, 100 {
                ImageSearch, X포탈, Y포탈, findSelfX, findSelfY, findSelfX+findSelfWidth, findSelfY+findSelfHeight, *80 Img\Potal.bmp
                if(ErrorLevel=0){
                    X포탈:=X포탈+30
                    Y포탈:=Y포탈+30
                    ; MsgBox, x포탈y포탈 위치 : %X포탈% , %Y포탈%
                    Send {esc}
                    sleep 100
                    ; MsgBox, found
                    ControlClick, x%X포탈% y%Y포탈%, 바람의나라
                    ; ControlSend, , {Tab}, ahk_class Nexon.NWind
                    ; sleep 200
                    ; ControlSend, , {Right}, ahk_class Nexon.NWind
                    ; sleep 200
                    ; ControlSend, , {Enter}, ahk_class Nexon.NWind
                    sleep 200
                    if(혼자=1){
                        Sleep 1000
                        Send {down}
                        Sleep 500
                        Send {enter}
                        Sleep 500
                        Send {esc}
                        Sleep 1000
                    }
                    if(같이=1){
                        Sleep 1000
                        Send {up}
                        Sleep 500
                        Send {Enter}
                        Sleep 400
                        Send {up}
                        Sleep 500
                        Send {Enter}
                        Sleep 400
                        Send {esc}
                        Sleep 1000
                    }
                    break
                }
                Sleep 30
            }
            if(ErrorLevel=0){


            }
        }
    }
}
ImageSearch, X1, Y1, 1, 1, 1200, 500, *80 Img\in.bmp
if(ErrorLevel=0){
    guicontrol,text,위치, 소굴
    gosub, 환수소환
    환수귀환체크=0
    환수행동력체크=0
    바퀴초기화=0
    if(X좌표=17 and Y좌표=11 or 초기화=0){
        갈X:=16, 갈Y:=13
        초기화=1
    }
    if(X좌표=16 and Y좌표=13){
        갈X:=17, 갈Y:=11
    }
    ImageSearch, X1, Y1, 1, 1, 1400, 500, *TransFFFFFF *80 Img\exit.bmp
    if(ErrorLevel=0){
        gosub, 허풍선방지
    }
}
return