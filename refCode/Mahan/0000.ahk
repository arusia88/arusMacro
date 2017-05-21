; <COMPILER: v1.0.48.5>

#Include, MLib\Gdip_All.ahk
#Include, MLib\Gdip_ImageSearch.ahk
#Include, MLib\Bin2Hex.ahk
#Include, MLib\BinRead.ahk
#Include, MLib\Hex2Bin.ahk
#Include, MLib\json.ahk
#Include, convertImgToPos.ahk



#SingleInstance, force
; #NoEnv
CoordMode,Pixel,Screen
DetectHiddenWindows On
SetKeyDelay, -1
SetWinDelay,-1
SetBatchLines,-1
SetControlDelay,-1

version = v1.1

; map info insert
rawMapList = 대기실부터던전 위례부터대기실 신수계부터현무봉 일월마을
StringSplit, MapList, rawMapList, %A_Space%
Loop, %MapList0%
{
    MapNameList .=MapList%A_Index% . "|"
}

random, a
Goto, Go

Go:
msgbox, 메크로 제제는 책임지지 않습니다. 자세한 사항은 블로그를 참조해주세요
gui:
gui,destroy
Gui, Add, GroupBox, x26 y20 w190 h110 +Center, 42억일때 할 행동(경변십억d)
Gui, Add, Radio, x36 y40 h20 v영혼체력, 영혼사(체력)
Gui, Add, Radio, x36 y60 h20 v영혼마력, 영혼사(마력)
Gui, Add, Radio, x130 y40 h20 v십, 십억경
Gui, Add, Radio, x130 y60 h20 v중 checked, 일시정지
Gui, Add, Radio, x36 y80 h20 v경체, 경변(체력)
Gui, Add, Radio, x36 y100 h20 v경마, 경변(마력)
Gui, Add, Radio, x130 y80 h20 , 계속돌기
Gui, Add, Text, x126 y103 h20 CBlue, 변환횟수
Gui, Add, Edit, x180 y100 w20 h20 v변환횟수, 4
Gui, Add, GroupBox, x26 y140 w190 h230 , Arus전용사냥매크로
Gui, Add, CheckBox, x36 y160 w40 h20 vArm1 checked, 보무
Gui, Add, Edit, x76 y160 w20 h20 vArm2, q
Gui, Add, Edit, x96 y160 w20 h20 vArm3, w
Gui, Add, CheckBox, x36 y180 w40 h20 vsa2 checked, 기원
Gui, Add, DropDownList, x76 y180 w40 vsb2 choose3, 1|2|3|4|5|6|7|8|9|0
Gui, Add, CheckBox, x36 y200 w40 h20 vsa1 checked, 공증
Gui, Add, DropDownList, x76 y200 w40 vsb1 choose2, 1|2|3|4|5|6|7|8|9|0
Gui, Add, Slider, x126 y180 w80 h20 vSlider체력, 50
Gui, Add, Slider, x126 y200 w80 h20 vSlider마력, 80
Gui, Add, CheckBox, x36 y220 w40 h20 vsa3, 헬파
Gui, Add, DropDownList, x76 y220 w40 vsb3 choose6, 1|2|3|4|5|6|7|8|9|0
Gui, Add, CheckBox, x36 y240 w40 h20 vsa4 checked, 성려
Gui, Add, DropDownList, x76 y240 w40 vsb4 choose1, 1|2|3|4|5|6|7|8|9|0
Gui, Add, CheckBox, x36 y260 w40 h20 vsa5 checked, '첨
Gui, Add, DropDownList, x76 y260 w40 vsb5 choose7, 1|2|3|4|5|6|7|8|9|0
Gui, Add, CheckBox, x36 y280 w40 h20 vsa6 checked, 시폭
Gui, Add, DropDownList, x76 y280 w40 vsb6 choose9, 1|2|3|4|5|6|7|8|9|0
Gui, Add, CheckBox, x126 y260 w40 h20 vsa7 checked, 혼
Gui, Add, DropDownList, x166 y260 w40 vsb7 choose4, 1|2|3|4|5|6|7|8|9|0
Gui, Add, CheckBox, x126 y220 h20 v혼헬파 checked, 혼+헬파
Gui, Add, CheckBox, x126 y240 h20 v혼성려 checked, 혼+성려
Gui, Add, CheckBox, x126 y160 w40 h20 vsa8, 명상
Gui, Add, DropDownList, x166 y160 w40 vsb8 choose7, 1|2|3|4|5|6|7|8|9|0
Gui, Add, CheckBox, x36 y300 w40 h20 vsa9, 지폭
Gui, Add, DropDownList, x76 y300 w40 vsb9 choose8, 1|2|3|4|5|6|7|8|9|0
Gui, Add, CheckBox, x36 y320 w40 h20 vsa10, 폭류
Gui, Add, DropDownList, x76 y320 w40 vsb10 choose9, 1|2|3|4|5|6|7|8|9|0
Gui, Add, CheckBox, x126 y280 w68 h20 vc사슬 , 사슬
Gui, Add, Edit, x196 y280 w15 h20 ve사슬 +Center, s
Gui, Add, CheckBox, x126 y300 h20 v랜덤이동, 랜덤이동
Gui, Add, DropDownList, x126 y320 w80 vselectedMap choose4, %MapNameList%
Gui, Add, CheckBox, x36 y340 h20 vDefenseHupung, 허풍선방지
Gui, Add, CheckBox, x126 y340 h20 v축지, 축지사용(z)
Gui, Add, Button, x226 y20 w55 h30 g시작, 시작
Gui, Add, Button, x281 y20 w55 h30 g설치, 설치
Gui, Add, Button, x336 y20 w55 h30 g재설정, 재설정
Gui, Add, Button, x226 y50 w55 h30 g설명서, 설명서
Gui, Add, Button, x281 y50 w55 h30 g성능향상, 성능향상
Gui, Add, Button, x336 y50 w55 h30 g상황판, 상황판
Gui, Add, GroupBox, x226 y83 w170 h60 +Center, you win
Gui, Add, Text, x236 y100 w155 +Center, 메크로를 돌려라 마신이 눈에 보일것이다.
Gui, Add, GroupBox, x226 y150 w90 h40 +Center, 경과시간
Gui, Add, Text, x236 y170 w70 h15 vtext1 +Center, 대기중
Gui, Add, GroupBox, x326 y150 w70 h40 +Center, 횟수
Gui, Add, Text, x336 y170 w50 h15 vtext2 +Center, 대기중
Gui, Add, Tab, x226 y200 w170 h170 , 환수|입장방법|허풍선
Gui, Tab, 환수
Gui, Add, CheckBox, x236 y230 w40 h20 vHwanCheck, 소환
Gui, Add, DropDownList, x280 y230 w45 vSummoncount choose1, 1|2|3|4
Gui, Add, CheckBox, x236 y250 h20 vHwanreturn, 환수귀환
Gui, Add, CheckBox, x236 y270 w35 h20 vHwanA1, 1번
Gui, Add, Edit, x271 y270 w80 h20 vHwanB1, 환수이름
Gui, Add, CheckBox, x236 y290 w35 h20 vHwanA2, 2번
Gui, Add, Edit, x271 y290 w80 h20 vHwanB2, 환수이름
Gui, Add, CheckBox, x236 y310 w35 h20 vHwanA3, 3번
Gui, Add, Edit, x271 y310 w80 h20 vHwanB3, 환수이름
Gui, Add, CheckBox, x236 y330 w35 h20 vHwanA4, 4번
Gui, Add, Edit, x271 y330 w80 h20 vHwanB4, 환수이름
Gui, Tab, 입장방법
Gui, Add, Radio, x236 y230 h20 v혼자 Checked, 혼자입장
Gui, Add, Radio, x236 y250 h20 v같이, 일행과입장
Gui, Add, Radio, x236 y270 h20, 입장안함
Gui, Tab, 허풍선
Gui, Add, Radio, x236 y230 h20 v알림음 Checked, 알림음
Gui, Add, Radio, x236 y250 h20 v바람종료, 바람종료
Gui, Add, Radio, x236 y270 h20 CBlue +disabled, 재접속
Gui, Add, Text, x236 y293 w20 h20 CBlue, ID
Gui, Add, Text, x236 y313 w20 h20 CBlue, PW
Gui, Add, Edit, x256 y290 w60 h20 +disabled, 아이디
Gui, Add, Edit, x256 y310 w60 h20 +disabled, 비밀번호
Gui, Show, xCenter yCenter h400 w420, DM 마한
Gosub, 성능향상
return
테스트용:
Gosub, 재설정
시작:
GuiControl, Disable, 시작
RandomTimer:=A_TickCount
gosub, 재설정
Loop{
    WinActivate, 바람의나라
    Gui, submit, nohide
    Gosub %selectedMap%
    Gosub 좌표
    Gosub 랜덤이동
    Gosub 버프
    Gosub 몹인식
    Gosub hupung
}
return
버프:
Gosub 보무
Gosub 공증
Gosub 기원
Gosub 명상
return
몹인식:
ImageSearch, x몹, y몹, 30, 70, 820, 750, *TransFFFFFF *80 Img\mahanmob.bmp
if(ErrorLevel=0){
    Gosub, 공증
    Gosub, 전체
    Gosub, 기원
    Gosub, 헬파
    Gosub, 성려
    Gosub, 시폭
    Gosub, 첨
    Gosub, 사슬
}
return
첨:
if(sa5=1){
    Send %sb5%
}
return
전체:
Cal_skillTimer1:=A_TickCount-skillTimer1
Cal_skillTimer2:=A_TickCount-skillTimer2
if(sa9=1 and Cal_skillTimer1>5000 and Y좌표<=14){
    Send %sb9%
    skillTimer1:=A_TickCount
}
if(sa10=1 and Cal_skillTimer2>5000 and Y좌표<=14){
    Send %sb10%
    skillTimer2:=A_TickCount
}
return
성려:
if(혼성려=1 and sa4=1 and sa7=1){

    Send, {esc}v{up}v%sb7%%sb4%{esc}
}
if(혼성려=0 and sa4=1){
    Send, {esc}v{up}v%sb4%{esc}
}
return
헬파:
if(혼헬파=1 and sa3=1 and sa7=1 and 헬Count>=5){
    Send, {esc}v{home}{down}v%sb7%%sb3%{esc}
    헬Count=0
}
if(혼헬파=0 and sa3=1 and 헬Count>=10){
    Send, {esc}v{home}{down}v%sb3%{esc}
    헬Count=0
}
헬Count++
return
사슬:
if(c사슬=1 and sa7=1 and 살Count>=30){
    Send, {esc}v{home}{%LoR%}v%d혼%%e사슬%{esc}
    살Count=0
    sleep 1000
}
if(c사슬=1 and c혼=0 and 살Count>=30){
    Send, {esc}v{home}{%LoR%}%e사슬%{esc}
    살Count=0
    sleep 1000
}
살Count++
return
보무:
if(Arm1=1){
    ImageSearch, x보, y보, 20, 70, 900, 600, *80 Img\bufb.bmp
    if(ErrorLevel=1){
        Loop, 1{
            Send {Shift down}z{Shift up}%arm2%{enter}
            break
        }
    }
    ImageSearch, x무, y무, 20, 70, 900, 600, *80 Img\bufm.bmp
    if(ErrorLevel=1){
        Loop, 1{
            Send {Shift down}z{Shift up}%arm3%{enter}
            Sleep 2000
            break
        }
    }
}
return
공증:
if(sa1=1){
    ; ImageSearch, x1, y1, 20, 70, 90, 600, *80 Img\resp.bmp
    ; if(ErrorLevel=1){
        Slider마력 = 50
        범위SP:=범위X체a+(100-Slider마력)
        ImageSearch, xx, yy, %범위SP%, %범위Y마%, %범위SP%, %범위Y마%, *80 Img\spcolor.bmp
        if(ErrorLevel=1){
            SendInput, %sb1%
            Sleep 100
        }
    ; }
}
return
기원:
if(sa2=1){
    Slider체력=70
    범위HP:=범위X체a+(100-Slider체력)
    ; MsgBox, 범위HP, 범위Y체, 범위HP, 범위Y체 : %범위HP% %범위Y체% / %범위HP% %범위Y체%
    ImageSearch, xx, yy, %범위HP%, %범위Y체%, %범위HP%+10, %범위Y체%+10, *50 Img\hpcolor.bmp
    if(ErrorLevel=1){
        ; MsgBox, use heal magic
        SendInput, {esc}%sb2%{home}{enter}
        Sleep 100
    }
}
return
시폭:
if(sa6=1){
    Random, explotionRand, 1, 4
    if(explotionRand=1){
        Send {Shift down}{up}{Shift up}%sb6%
    }
    if(explotionRand=2){
        Send {Shift down}{down}{Shift up}%sb6%
    }
    if(explotionRand=3){
        Send {Shift down}{left}{Shift up}%sb6%
    }
    if(explotionRand=4){
        Send {Shift down}{right}{Shift up}%sb6%
    }
}
return
명상:
if(sa8=1){
    ImageSearch, X1, Y1, 20, 70, 900, 600, *80 Img\meda.bmp
    if(ErrorLevel=1){
        Loop, 1{
            Sleep 300
            Send %sb8%
            sleep 2000
            Break
        }
    }
}
return
자경:
ImageSearch, X1, Y1, 800, 700, 1100, 800, *80 Img\exp.bmp
if(ErrorLevel=0)
{
    Loop, 1{
        if(영혼체력=1 or 영혼마력=1){
            초기화=1
            Sleep 10000
            ; gosub, 위례부터대기실
        }
        if(중=1){
            Loop {
                Soundplay, Img\PAGING.wav
                Sleep 2000
                ImageSearch, X1, Y1, 800, 700, 1100, 800, *80 Img\exp.bmp
                if(ErrorLevel=1)
                {
                    break
                }
            }
        }
        if(십=1){
            Loop, %변환횟수%{
                send u
                send d
                sleep 800
                send {Down}
                sleep 800
                send {Enter}
                Sleep 800
                Send {esc}
                Sleep 1000
            }
        }
        if(경체=1){
            Loop, %변환횟수%{
                Send ud
                Sleep 1000
                Send {enter}
                Sleep 1000
                Send {Enter}
                Sleep 1000
                Send {down}
                Sleep 1000
                Send {enter}
                Sleep 1000
                Send {down}
                Sleep 1000
                Send {enter}
                Sleep 1000
                Send {enter}
                Sleep 1000
                Send {enter}
                Sleep 1000
                Send {esc}
                Sleep 1000
            }
        }
        if(경마=1){
            Loop, %변환횟수%{
                Send ud
                Sleep 1000
                Send {enter}
                Sleep 1000
                Send {Enter}
                Sleep 1000
                Send {down}
                Sleep 1000
                Send {down}
                Sleep 1000
                Send {enter}
                Sleep 1000
                Send {down}
                Sleep 1000
                Send {enter}
                Sleep 1000
                Send {enter}
                Sleep 1000
                Send {enter}
                Sleep 1000
                Send {esc}
                Sleep 1000
            }
        }
        break
    }
}
return
환수소환:
if(환수체크=0){
    Loop, 1{
        if(HwanCheck=1){
            Loop, %Summoncount% {
                Send, {Ctrl down}/{Ctrl up}
                Sleep 400
                Send {esc}
            }
        }
        Send {enter}{esc}
        Sleep 500
        Send {enter}{esc}
        if(축지=1){
            Sleep 200
            Send uz
            Sleep 300
            Send {ctrl down}{up}{ctrl up}{enter}
            Sleep 200
            Send {enter}{esc}
        }
        환수체크=1
        break
    }
}
return
환수귀환:
if(환수귀환체크=0){
    if(Hwanreturn=1){
        sleep 1000
        clipboard = 환수 귀환
        Send '{ctrl down}v{ctrl up}{enter}
        sleep 200
        환수귀환체크=1
    }
}
return
환수행동력:
if(환수행동력체크=0){
    if(HwanA1=1){
        ImageSearch, x환수1, y환수1, %x환1%, %환1Y1%, %x환2%, %환1Y2%, Img\hwanwork.bmp
        if(ErrorLevel=0){
            clipboard = %HwanB1%
            Send, ui
            Sleep 800
            Send, {Ctrl down}v{Ctrl up}{enter}
            Sleep 500
            Send, {esc}
            Sleep 200
        }
    }
    if(HwanA2=1){
        ImageSearch, x환수2, y환수2, %x환1%, %환2Y1%, %x환2%, %환2Y2%, Img\Hwanwork.bmp
        if(ErrorLevel=0){
            clipboard = %HwanB2%
            Send, ui
            Sleep 800
            Send, {Ctrl down}v{Ctrl up}{enter}
            Sleep 500
            Send, {esc}
            Sleep 200
        }
    }
    if(HwanA3=1){
        ImageSearch, x환수3, y환수3, %x환1%, %환3Y1%, %x환2%, %환3Y2%, Img\Hwanwork.bmp
        if(ErrorLevel=0){
            clipboard = %HwanB3%
            Send, ui
            Sleep 800
            Send, {Ctrl down}v{Ctrl up}{enter}
            Sleep 500
            Send, {esc}
            Sleep 200
        }
    }
    if(HwanA4=1){
        ImageSearch, x환수4, y환수4, %x환1%, %환4Y1%, %x환2%, %환4Y2%, Img\Hwanwork.bmp
        if(ErrorLevel=0){
            clipboard = %HwanB4%
            Send, ui
            Sleep 800
            Send, {Ctrl down}v{Ctrl up}{enter}
            Sleep 500
            Send, {esc}
            Sleep 200
        }
    }
    환수행동력체크=1
}
return

허풍선방지:
if(허풍선방지체크=0){
    if(DefenseHupung=1){
        Loop{
            ImageSearch, xHu, yHu, 1, 1, 800, 600, *TransFFFFFF *80 Img\mahanmob.bmp
            if(ErrorLevel=0){
                Gosub, 몹인식
                Gosub, 버프
                sleep 100
            }
            if(ErrorLevel=1){
                break
            }
        }
        Sleep 10000
    }
    허풍선방지체크=1
}
return
바퀴카운트:
if(바퀴초기화=0){
    바퀴:=바퀴+1
    guicontrol,text,text2,%바퀴%바퀴
    바퀴초기화=1
}

랜덤이동:
if(랜덤이동=1){
    Cal_RandomTimer:=A_TickCount-RandomTimer
    if(Cal_RandomTimer<1000){
        이전X좌표=%X좌표%
        이전Y좌표=%Y좌표%
    }
    if(Cal_RandomTimer>3000){
        현재X좌표=%X좌표%
        현재Y좌표=%Y좌표%
        if(이전X좌표=현재X좌표 and 이전Y좌표=현재Y좌표){
            Random, RandWalk, 1, 4
            if(RandWalk=1){
                ControlSend,, {right},ahk_class Nexon.NWind
            }
            if(RandWalk=2){
                ControlSend,, {Left},ahk_class Nexon.NWind
            }
            if(RandWalk=3){
                ControlSend,, {down},ahk_class Nexon.NWind
            }
            if(RandWalk=4){
                ControlSend,, {up},ahk_class Nexon.NWind
            }
        }
        RandomTimer:=A_TickCount
    }
}
return
; Timer:
; ; Sec:=Floor((A_TickCount-Time)/1000)
; ; If Sec<60
; ; {
; ;     guicontrol,text,text1,%Sec%초
; ; }
; ; else
; ; {
; ;     Min:=Floor(Sec/60)
; ;     Sec2:=Mod(Sec,60)
; ;     guicontrol,text,text1, %Min%분 %Sec2%초
; ; }
return
hupung:
ImageSearch, X허, Y허, 450, 500, 800, 450, Img\hu.bmp
if(ErrorLevel=0){
    if(알림음=1){
        soundplay Img\QUERY.wav
    }
    if(바람종료=1){
        WinActivate 바람의나라
        Sleep 1000
        Send {Alt down}{F4}{Alt up}
        Sleep 1000
    }
}
Sleep 10
return
GuiClose:
ExitApp
설명서:
msgbox ■ 구매해주셔서 감사합니다. ■`n`n 엔터키로 대화창열기/날씨효과/시야표시를 끄세요, 타겟이동을 3번으로 바꾸세요 `n`n방향키입력시 바로이동을 반드시 키세요 이거안키면 안움직임 ㅡㅡ`n`n반드시 이름표시-기타 를 키세요`n`n하단에 채팅쪽에있는 < 를 눌러서 마법퀵슬롯이 안보이게 하세요 `n`n 경변부, 십억경의위치는 d에 `n`n 행동력의환약/피리 위치는 i 입니다 `n`n 일시정지,다시시작은 Page down 처음부터 다시시작할려면 새로 키세요 `n`n 비영사천문은 대문자 Z `n`n수정 DMC  `n`n http://dmcmcr.blogspot.kr/
return
Pgup::
재설정:
WinActivate, 바람의나라
Slider체력=70
헬Count=0
살Count=0
gui, submit,nohide
Time:=A_TickCount
skillTimer1:=A_TickCount
skillTimer2:=A_TickCount
RandomTimer:=A_TickCount
; settimer,Timer,off
guicontrol,text,text2,0바퀴
환수행동력체크=0
초기화=0
바퀴=0
Sleep 2000
ImageSearch, X1, Y1, 800, 100, 950, 300, Img\Hwansu.bmp
if(ErrorLevel=1){
    Send p
}
WinGetPos, findSelfX, findSelfY, findSelfWidth, findSelfHeight, 바람의나라
ImageSearch, X찾, Y찾, findSelfX+880, findSelfY+750, findSelfX+findSelfWidth, findSelfY+findSelfHeight, *transFFFFFF *80 Img\X.bmp
if(ErrorLevel=0) {
    범위X백a:= X찾 + 20
    범위X백b:= X찾 + 28
    범위X십a:= X찾 + 29
    범위X십b:= X찾 + 37
    범위X일a:= X찾 + 38
    범위X일b:= X찾 + 46
    범위Y백a:= X찾 + 78
    범위Y백b:= X찾 + 86
    범위Y십a:= X찾 + 87
    범위Y십b:= X찾 + 95
    범위Y일a:= X찾 + 96
    범위Y일b:= X찾 + 104
    범위Y위:= Y찾
    범위Y아래:= Y찾 + 11
    MsgBox, good
} else {
    MsgBox, bad
}

ImageSearch, x환찾, y환찾, 1, 1, 1400, 1400, Img\HwanSearch.bmp
X환1:=x환찾
X환2:=x환찾 + 43
환1Y1:=y환찾 + 53
환1Y2:=y환찾 + 59
환2Y1:=y환찾 + 107
환2Y2:=y환찾 + 113
환3Y1:=y환찾 + 161
환3Y2:=y환찾 + 167
환4Y1:=y환찾 + 215
환4Y2:=y환찾 + 221
ImageSearch, X체, Y체, findSelfX+800, findSelfY+600, findSelfX+findSelfWidth, findSelfY+findSelfHeight, *80 Img\체.bmp
범위X체a:= X체 + 48
범위Y체:= Y체
범위Y마:= Y체 + 19
범위HP:=범위X체a+(100-Slider체력)
범위SP:=범위X체a+(100-Slider마력)
return
성능향상:
msgbox, 1, 경고문, 성능향상을 사용하게되면`, cpu를 조금 더 사용하여 버벅거림을 줄일수있습니다`n`n싱글코어(저사양컴퓨터)에서 큰 효과를 보실수있습니다`n`n동의하면 예, 동의하지않으면 아니오를 누르세요
IfMsgBox, OK
{
    SetControlDelay, -1
    SetKeyDelay, -1
    SetMouseDelay, -1
    SetDefaultMouseSpeed, 0
    SetWinDelay, -1
    SetBatchLines, 10ms
    msgbox, 성능향상을 적용하였습니다. 문제가생길경우 매크로를 껐다키세요
    GuiControl, Disable, 성능향상
}
IfMsgBox, Cancel
{
    msgbox 취소하였습니다
}
return
설치:
msgbox, 7/26 부터는 설치버튼이 없어졌습니다 그냥 시작하시면됩니다.
return
상황판:
gui,2:destroy
Gui,2: Add, Text, v가야할X x10 y10 w200 h20 , -
Gui,2: Add, Text, v가야할Y x10 y30 w200 h20 , -
Gui,2: Add, Text, v현X x10 y50 w200 h20 , -
Gui,2: Add, Text, v현Y x10 y70 w200 h20 , -
Gui,2: Add, Text, v초기화값 x10 y90 w200 h20 , -
Gui,2: Add, Text, vGui2Text6 x10 y110 w200 h20 , -
Gui,2: Add, Text, vGui2Text7 x10 y130 w200 h20 , -
Gui,2: Add, Text, vGui2Text8 x10 y150 w200 h20 , -
Gui,2: Add, Text, vGui2Text9 x10 y170 w200 h20 , -
Gui,2: Add, Text, vGui2Text10 x10 y190 w200 h20 , -
Gui,2: Add, Text, vGui2Text11 x10 y210 w200 h20 , -
Gui,2: Add, Text, vGui2Text12 x10 y230 w200 h20 , -
Gui,2: Add, Text, vGui2Text13 x10 y250 w200 h20 , -
Gui,2: Add, Text, vGui2Text14 x10 y270 w200 h20 , -
Gui,2: Add, Text, vGui2Text15 x10 y290 w200 h20 , -
Gui,2: Add, Text, vGui2Text16 x10 y310 w200 h20 , -
Gui,2: Add, Text, vGui2Text17 x10 y330 w200 h20 , -
Gui,2: Add, Text, vGui2Text18 x10 y350 w200 h20 , -
Gui,2: Add, Text, vGui2Text19 x10 y370 w200 h20 , -
Gui,2: Add, Text, vGui2Text20 x10 y390 w200 h20 , -
GUI,2:Show, w200 h150, 진행상황판
return

2Guiclose:
gui,2:destroy
return
Pgdn::
Pause
return

#Include, Move.ahk
#Include, Map\MahanMap.ahk
#Include, Map\MahanPrevMap.ahk
#Include, Map\SinsuHMap.ahk
#Include, Map\ilwallMap.ahk