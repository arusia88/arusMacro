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
rawMapList = ���Ǻ��ʹ��� ���ʺ��ʹ��� �ż������������ �Ͽ�����
StringSplit, MapList, rawMapList, %A_Space%
Loop, %MapList0%
{
    MapNameList .=MapList%A_Index% . "|"
}

random, a
Goto, Go

Go:
msgbox, ��ũ�� ������ å������ �ʽ��ϴ�. �ڼ��� ������ ��α׸� �������ּ���
gui:
gui,destroy
Gui, Add, GroupBox, x26 y20 w190 h110 +Center, 42���϶� �� �ൿ(�溯�ʾ�d)
Gui, Add, Radio, x36 y40 h20 v��ȥü��, ��ȥ��(ü��)
Gui, Add, Radio, x36 y60 h20 v��ȥ����, ��ȥ��(����)
Gui, Add, Radio, x130 y40 h20 v��, �ʾ��
Gui, Add, Radio, x130 y60 h20 v�� checked, �Ͻ�����
Gui, Add, Radio, x36 y80 h20 v��ü, �溯(ü��)
Gui, Add, Radio, x36 y100 h20 v�渶, �溯(����)
Gui, Add, Radio, x130 y80 h20 , ��ӵ���
Gui, Add, Text, x126 y103 h20 CBlue, ��ȯȽ��
Gui, Add, Edit, x180 y100 w20 h20 v��ȯȽ��, 4
Gui, Add, GroupBox, x26 y140 w190 h230 , Arus�����ɸ�ũ��
Gui, Add, CheckBox, x36 y160 w40 h20 vArm1 checked, ����
Gui, Add, Edit, x76 y160 w20 h20 vArm2, q
Gui, Add, Edit, x96 y160 w20 h20 vArm3, w
Gui, Add, CheckBox, x36 y180 w40 h20 vsa2 checked, ���
Gui, Add, DropDownList, x76 y180 w40 vsb2 choose3, 1|2|3|4|5|6|7|8|9|0
Gui, Add, CheckBox, x36 y200 w40 h20 vsa1 checked, ����
Gui, Add, DropDownList, x76 y200 w40 vsb1 choose2, 1|2|3|4|5|6|7|8|9|0
Gui, Add, Slider, x126 y180 w80 h20 vSliderü��, 50
Gui, Add, Slider, x126 y200 w80 h20 vSlider����, 80
Gui, Add, CheckBox, x36 y220 w40 h20 vsa3, ����
Gui, Add, DropDownList, x76 y220 w40 vsb3 choose6, 1|2|3|4|5|6|7|8|9|0
Gui, Add, CheckBox, x36 y240 w40 h20 vsa4 checked, ����
Gui, Add, DropDownList, x76 y240 w40 vsb4 choose1, 1|2|3|4|5|6|7|8|9|0
Gui, Add, CheckBox, x36 y260 w40 h20 vsa5 checked, '÷
Gui, Add, DropDownList, x76 y260 w40 vsb5 choose7, 1|2|3|4|5|6|7|8|9|0
Gui, Add, CheckBox, x36 y280 w40 h20 vsa6 checked, ����
Gui, Add, DropDownList, x76 y280 w40 vsb6 choose9, 1|2|3|4|5|6|7|8|9|0
Gui, Add, CheckBox, x126 y260 w40 h20 vsa7 checked, ȥ
Gui, Add, DropDownList, x166 y260 w40 vsb7 choose4, 1|2|3|4|5|6|7|8|9|0
Gui, Add, CheckBox, x126 y220 h20 vȥ���� checked, ȥ+����
Gui, Add, CheckBox, x126 y240 h20 vȥ���� checked, ȥ+����
Gui, Add, CheckBox, x126 y160 w40 h20 vsa8, ���
Gui, Add, DropDownList, x166 y160 w40 vsb8 choose7, 1|2|3|4|5|6|7|8|9|0
Gui, Add, CheckBox, x36 y300 w40 h20 vsa9, ����
Gui, Add, DropDownList, x76 y300 w40 vsb9 choose8, 1|2|3|4|5|6|7|8|9|0
Gui, Add, CheckBox, x36 y320 w40 h20 vsa10, ����
Gui, Add, DropDownList, x76 y320 w40 vsb10 choose9, 1|2|3|4|5|6|7|8|9|0
Gui, Add, CheckBox, x126 y280 w68 h20 vc�罽 , �罽
Gui, Add, Edit, x196 y280 w15 h20 ve�罽 +Center, s
Gui, Add, CheckBox, x126 y300 h20 v�����̵�, �����̵�
Gui, Add, DropDownList, x126 y320 w80 vselectedMap choose4, %MapNameList%
Gui, Add, CheckBox, x36 y340 h20 vDefenseHupung, ��ǳ������
Gui, Add, CheckBox, x126 y340 h20 v����, �������(z)
Gui, Add, Button, x226 y20 w55 h30 g����, ����
Gui, Add, Button, x281 y20 w55 h30 g��ġ, ��ġ
Gui, Add, Button, x336 y20 w55 h30 g�缳��, �缳��
Gui, Add, Button, x226 y50 w55 h30 g����, ����
Gui, Add, Button, x281 y50 w55 h30 g�������, �������
Gui, Add, Button, x336 y50 w55 h30 g��Ȳ��, ��Ȳ��
Gui, Add, GroupBox, x226 y83 w170 h60 +Center, you win
Gui, Add, Text, x236 y100 w155 +Center, ��ũ�θ� ������ ������ ���� ���ϰ��̴�.
Gui, Add, GroupBox, x226 y150 w90 h40 +Center, ����ð�
Gui, Add, Text, x236 y170 w70 h15 vtext1 +Center, �����
Gui, Add, GroupBox, x326 y150 w70 h40 +Center, Ƚ��
Gui, Add, Text, x336 y170 w50 h15 vtext2 +Center, �����
Gui, Add, Tab, x226 y200 w170 h170 , ȯ��|������|��ǳ��
Gui, Tab, ȯ��
Gui, Add, CheckBox, x236 y230 w40 h20 vHwanCheck, ��ȯ
Gui, Add, DropDownList, x280 y230 w45 vSummoncount choose1, 1|2|3|4
Gui, Add, CheckBox, x236 y250 h20 vHwanreturn, ȯ����ȯ
Gui, Add, CheckBox, x236 y270 w35 h20 vHwanA1, 1��
Gui, Add, Edit, x271 y270 w80 h20 vHwanB1, ȯ���̸�
Gui, Add, CheckBox, x236 y290 w35 h20 vHwanA2, 2��
Gui, Add, Edit, x271 y290 w80 h20 vHwanB2, ȯ���̸�
Gui, Add, CheckBox, x236 y310 w35 h20 vHwanA3, 3��
Gui, Add, Edit, x271 y310 w80 h20 vHwanB3, ȯ���̸�
Gui, Add, CheckBox, x236 y330 w35 h20 vHwanA4, 4��
Gui, Add, Edit, x271 y330 w80 h20 vHwanB4, ȯ���̸�
Gui, Tab, ������
Gui, Add, Radio, x236 y230 h20 vȥ�� Checked, ȥ������
Gui, Add, Radio, x236 y250 h20 v����, ���������
Gui, Add, Radio, x236 y270 h20, �������
Gui, Tab, ��ǳ��
Gui, Add, Radio, x236 y230 h20 v�˸��� Checked, �˸���
Gui, Add, Radio, x236 y250 h20 v�ٶ�����, �ٶ�����
Gui, Add, Radio, x236 y270 h20 CBlue +disabled, ������
Gui, Add, Text, x236 y293 w20 h20 CBlue, ID
Gui, Add, Text, x236 y313 w20 h20 CBlue, PW
Gui, Add, Edit, x256 y290 w60 h20 +disabled, ���̵�
Gui, Add, Edit, x256 y310 w60 h20 +disabled, ��й�ȣ
Gui, Show, xCenter yCenter h400 w420, DM ����
Gosub, �������
return
�׽�Ʈ��:
Gosub, �缳��
����:
GuiControl, Disable, ����
RandomTimer:=A_TickCount
gosub, �缳��
Loop{
    WinActivate, �ٶ��ǳ���
    Gui, submit, nohide
    Gosub %selectedMap%
    Gosub ��ǥ
    Gosub �����̵�
    Gosub ����
    Gosub ���ν�
    Gosub hupung
}
return
����:
Gosub ����
Gosub ����
Gosub ���
Gosub ���
return
���ν�:
ImageSearch, x��, y��, 30, 70, 820, 750, *TransFFFFFF *80 Img\mahanmob.bmp
if(ErrorLevel=0){
    Gosub, ����
    Gosub, ��ü
    Gosub, ���
    Gosub, ����
    Gosub, ����
    Gosub, ����
    Gosub, ÷
    Gosub, �罽
}
return
÷:
if(sa5=1){
    Send %sb5%
}
return
��ü:
Cal_skillTimer1:=A_TickCount-skillTimer1
Cal_skillTimer2:=A_TickCount-skillTimer2
if(sa9=1 and Cal_skillTimer1>5000 and Y��ǥ<=14){
    Send %sb9%
    skillTimer1:=A_TickCount
}
if(sa10=1 and Cal_skillTimer2>5000 and Y��ǥ<=14){
    Send %sb10%
    skillTimer2:=A_TickCount
}
return
����:
if(ȥ����=1 and sa4=1 and sa7=1){

    Send, {esc}v{up}v%sb7%%sb4%{esc}
}
if(ȥ����=0 and sa4=1){
    Send, {esc}v{up}v%sb4%{esc}
}
return
����:
if(ȥ����=1 and sa3=1 and sa7=1 and ��Count>=5){
    Send, {esc}v{home}{down}v%sb7%%sb3%{esc}
    ��Count=0
}
if(ȥ����=0 and sa3=1 and ��Count>=10){
    Send, {esc}v{home}{down}v%sb3%{esc}
    ��Count=0
}
��Count++
return
�罽:
if(c�罽=1 and sa7=1 and ��Count>=30){
    Send, {esc}v{home}{%LoR%}v%dȥ%%e�罽%{esc}
    ��Count=0
    sleep 1000
}
if(c�罽=1 and cȥ=0 and ��Count>=30){
    Send, {esc}v{home}{%LoR%}%e�罽%{esc}
    ��Count=0
    sleep 1000
}
��Count++
return
����:
if(Arm1=1){
    ImageSearch, x��, y��, 20, 70, 900, 600, *80 Img\bufb.bmp
    if(ErrorLevel=1){
        Loop, 1{
            Send {Shift down}z{Shift up}%arm2%{enter}
            break
        }
    }
    ImageSearch, x��, y��, 20, 70, 900, 600, *80 Img\bufm.bmp
    if(ErrorLevel=1){
        Loop, 1{
            Send {Shift down}z{Shift up}%arm3%{enter}
            Sleep 2000
            break
        }
    }
}
return
����:
if(sa1=1){
    ; ImageSearch, x1, y1, 20, 70, 90, 600, *80 Img\resp.bmp
    ; if(ErrorLevel=1){
        Slider���� = 50
        ����SP:=����Xüa+(100-Slider����)
        ImageSearch, xx, yy, %����SP%, %����Y��%, %����SP%, %����Y��%, *80 Img\spcolor.bmp
        if(ErrorLevel=1){
            SendInput, %sb1%
            Sleep 100
        }
    ; }
}
return
���:
if(sa2=1){
    Sliderü��=70
    ����HP:=����Xüa+(100-Sliderü��)
    ; MsgBox, ����HP, ����Yü, ����HP, ����Yü : %����HP% %����Yü% / %����HP% %����Yü%
    ImageSearch, xx, yy, %����HP%, %����Yü%, %����HP%+10, %����Yü%+10, *50 Img\hpcolor.bmp
    if(ErrorLevel=1){
        ; MsgBox, use heal magic
        SendInput, {esc}%sb2%{home}{enter}
        Sleep 100
    }
}
return
����:
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
���:
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
�ڰ�:
ImageSearch, X1, Y1, 800, 700, 1100, 800, *80 Img\exp.bmp
if(ErrorLevel=0)
{
    Loop, 1{
        if(��ȥü��=1 or ��ȥ����=1){
            �ʱ�ȭ=1
            Sleep 10000
            ; gosub, ���ʺ��ʹ���
        }
        if(��=1){
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
        if(��=1){
            Loop, %��ȯȽ��%{
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
        if(��ü=1){
            Loop, %��ȯȽ��%{
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
        if(�渶=1){
            Loop, %��ȯȽ��%{
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
ȯ����ȯ:
if(ȯ��üũ=0){
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
        if(����=1){
            Sleep 200
            Send uz
            Sleep 300
            Send {ctrl down}{up}{ctrl up}{enter}
            Sleep 200
            Send {enter}{esc}
        }
        ȯ��üũ=1
        break
    }
}
return
ȯ����ȯ:
if(ȯ����ȯüũ=0){
    if(Hwanreturn=1){
        sleep 1000
        clipboard = ȯ�� ��ȯ
        Send '{ctrl down}v{ctrl up}{enter}
        sleep 200
        ȯ����ȯüũ=1
    }
}
return
ȯ���ൿ��:
if(ȯ���ൿ��üũ=0){
    if(HwanA1=1){
        ImageSearch, xȯ��1, yȯ��1, %xȯ1%, %ȯ1Y1%, %xȯ2%, %ȯ1Y2%, Img\hwanwork.bmp
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
        ImageSearch, xȯ��2, yȯ��2, %xȯ1%, %ȯ2Y1%, %xȯ2%, %ȯ2Y2%, Img\Hwanwork.bmp
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
        ImageSearch, xȯ��3, yȯ��3, %xȯ1%, %ȯ3Y1%, %xȯ2%, %ȯ3Y2%, Img\Hwanwork.bmp
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
        ImageSearch, xȯ��4, yȯ��4, %xȯ1%, %ȯ4Y1%, %xȯ2%, %ȯ4Y2%, Img\Hwanwork.bmp
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
    ȯ���ൿ��üũ=1
}
return

��ǳ������:
if(��ǳ������üũ=0){
    if(DefenseHupung=1){
        Loop{
            ImageSearch, xHu, yHu, 1, 1, 800, 600, *TransFFFFFF *80 Img\mahanmob.bmp
            if(ErrorLevel=0){
                Gosub, ���ν�
                Gosub, ����
                sleep 100
            }
            if(ErrorLevel=1){
                break
            }
        }
        Sleep 10000
    }
    ��ǳ������üũ=1
}
return
����ī��Ʈ:
if(�����ʱ�ȭ=0){
    ����:=����+1
    guicontrol,text,text2,%����%����
    �����ʱ�ȭ=1
}

�����̵�:
if(�����̵�=1){
    Cal_RandomTimer:=A_TickCount-RandomTimer
    if(Cal_RandomTimer<1000){
        ����X��ǥ=%X��ǥ%
        ����Y��ǥ=%Y��ǥ%
    }
    if(Cal_RandomTimer>3000){
        ����X��ǥ=%X��ǥ%
        ����Y��ǥ=%Y��ǥ%
        if(����X��ǥ=����X��ǥ and ����Y��ǥ=����Y��ǥ){
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
; ;     guicontrol,text,text1,%Sec%��
; ; }
; ; else
; ; {
; ;     Min:=Floor(Sec/60)
; ;     Sec2:=Mod(Sec,60)
; ;     guicontrol,text,text1, %Min%�� %Sec2%��
; ; }
return
hupung:
ImageSearch, X��, Y��, 450, 500, 800, 450, Img\hu.bmp
if(ErrorLevel=0){
    if(�˸���=1){
        soundplay Img\QUERY.wav
    }
    if(�ٶ�����=1){
        WinActivate �ٶ��ǳ���
        Sleep 1000
        Send {Alt down}{F4}{Alt up}
        Sleep 1000
    }
}
Sleep 10
return
GuiClose:
ExitApp
����:
msgbox �� �������ּż� �����մϴ�. ��`n`n ����Ű�� ��ȭâ����/����ȿ��/�þ�ǥ�ø� ������, Ÿ���̵��� 3������ �ٲټ��� `n`n����Ű�Է½� �ٷ��̵��� �ݵ�� Ű���� �̰ž�Ű�� �ȿ����� �Ѥ�`n`n�ݵ�� �̸�ǥ��-��Ÿ �� Ű����`n`n�ϴܿ� ä���ʿ��ִ� < �� ������ ������������ �Ⱥ��̰� �ϼ��� `n`n �溯��, �ʾ������ġ�� d�� `n`n �ൿ����ȯ��/�Ǹ� ��ġ�� i �Դϴ� `n`n �Ͻ�����,�ٽý����� Page down ó������ �ٽý����ҷ��� ���� Ű���� `n`n �񿵻�õ���� �빮�� Z `n`n���� DMC  `n`n http://dmcmcr.blogspot.kr/
return
Pgup::
�缳��:
WinActivate, �ٶ��ǳ���
Sliderü��=70
��Count=0
��Count=0
gui, submit,nohide
Time:=A_TickCount
skillTimer1:=A_TickCount
skillTimer2:=A_TickCount
RandomTimer:=A_TickCount
; settimer,Timer,off
guicontrol,text,text2,0����
ȯ���ൿ��üũ=0
�ʱ�ȭ=0
����=0
Sleep 2000
ImageSearch, X1, Y1, 800, 100, 950, 300, Img\Hwansu.bmp
if(ErrorLevel=1){
    Send p
}
WinGetPos, findSelfX, findSelfY, findSelfWidth, findSelfHeight, �ٶ��ǳ���
ImageSearch, Xã, Yã, findSelfX+880, findSelfY+750, findSelfX+findSelfWidth, findSelfY+findSelfHeight, *transFFFFFF *80 Img\X.bmp
if(ErrorLevel=0) {
    ����X��a:= Xã + 20
    ����X��b:= Xã + 28
    ����X��a:= Xã + 29
    ����X��b:= Xã + 37
    ����X��a:= Xã + 38
    ����X��b:= Xã + 46
    ����Y��a:= Xã + 78
    ����Y��b:= Xã + 86
    ����Y��a:= Xã + 87
    ����Y��b:= Xã + 95
    ����Y��a:= Xã + 96
    ����Y��b:= Xã + 104
    ����Y��:= Yã
    ����Y�Ʒ�:= Yã + 11
    MsgBox, good
} else {
    MsgBox, bad
}

ImageSearch, xȯã, yȯã, 1, 1, 1400, 1400, Img\HwanSearch.bmp
Xȯ1:=xȯã
Xȯ2:=xȯã + 43
ȯ1Y1:=yȯã + 53
ȯ1Y2:=yȯã + 59
ȯ2Y1:=yȯã + 107
ȯ2Y2:=yȯã + 113
ȯ3Y1:=yȯã + 161
ȯ3Y2:=yȯã + 167
ȯ4Y1:=yȯã + 215
ȯ4Y2:=yȯã + 221
ImageSearch, Xü, Yü, findSelfX+800, findSelfY+600, findSelfX+findSelfWidth, findSelfY+findSelfHeight, *80 Img\ü.bmp
����Xüa:= Xü + 48
����Yü:= Yü
����Y��:= Yü + 19
����HP:=����Xüa+(100-Sliderü��)
����SP:=����Xüa+(100-Slider����)
return
�������:
msgbox, 1, ���, ��������� ����ϰԵǸ�`, cpu�� ���� �� ����Ͽ� �����Ÿ��� ���ϼ��ֽ��ϴ�`n`n�̱��ھ�(�������ǻ��)���� ū ȿ���� ���Ǽ��ֽ��ϴ�`n`n�����ϸ� ��, �������������� �ƴϿ��� ��������
IfMsgBox, OK
{
    SetControlDelay, -1
    SetKeyDelay, -1
    SetMouseDelay, -1
    SetDefaultMouseSpeed, 0
    SetWinDelay, -1
    SetBatchLines, 10ms
    msgbox, ��������� �����Ͽ����ϴ�. ������������ ��ũ�θ� ����Ű����
    GuiControl, Disable, �������
}
IfMsgBox, Cancel
{
    msgbox ����Ͽ����ϴ�
}
return
��ġ:
msgbox, 7/26 ���ʹ� ��ġ��ư�� ���������ϴ� �׳� �����Ͻø�˴ϴ�.
return
��Ȳ��:
gui,2:destroy
Gui,2: Add, Text, v������X x10 y10 w200 h20 , -
Gui,2: Add, Text, v������Y x10 y30 w200 h20 , -
Gui,2: Add, Text, v��X x10 y50 w200 h20 , -
Gui,2: Add, Text, v��Y x10 y70 w200 h20 , -
Gui,2: Add, Text, v�ʱ�ȭ�� x10 y90 w200 h20 , -
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
GUI,2:Show, w200 h150, �����Ȳ��
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