; <COMPILER: v1.0.48.5>

version = v0.1


random, a
urldownloadtofile,http://blog.naver.com/PostView.nhn?blogId=sodll3&logNo=100207148795&redirect=Dlog&widgetTypeCall=true, check%a%.txt
if(FileExist("check%a%.txt"))
{
 filedelete, check%a%.txt
}
fileread,text,check%a%.txt
ifinstring,text,Ononon
{
 filedelete,check%a%.txt
 msgbox, �̿밡��
 goto, Go
}
Ifinstring,text, Offoffoff
{
 filedelete,check%a%.txt
 Msgbox, ���� ����
 ExitApp
}
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
Gui, Add, Edit, x180 y100 w20 h20 v��ȯȽ�� +Center, 4
Gui, Add, GroupBox, x26 y140 w190 h230 , http://dmcmcr.blogspot.kr/
Gui, Add, CheckBox, x33 y160 w44 h20 vc����, ����
Gui, Add, Edit, x78 y160 w20 h20 ve��ȣ, q
Gui, Add, Edit, x98 y160 w20 h20 ve����, w
Gui, Add, CheckBox, x123 y160 w44 h20 vc��� checked, ���
Gui, Add, DropDownList, x168 y160 w40 vd��� choose7, 1|2|3|4|5|6|7|8|9|0
Gui, Add, CheckBox, x33 y180 w44 h20 vc��� checked, ���
Gui, Add, DropDownList, x78 y180 w40 vd��� choose3, 1|2|3|4|5|6|7|8|9|0
Gui, Add, CheckBox, x33 y200 w44 h20 vc���� checked, ����
Gui, Add, DropDownList, x78 y200 w40 vd���� choose2, 1|2|3|4|5|6|7|8|9|0
Gui, Add, Slider, x123 y180 w80 h20 vSliderü��, 50
Gui, Add, Slider, x123 y200 w80 h20 vSlider����, 70
Gui, Add, CheckBox, x33 y220 w44 h20 vc���� checked, ����
Gui, Add, DropDownList, x78 y220 w40 vd���� choose6, 1|2|3|4|5|6|7|8|9|0
Gui, Add, CheckBox, x33 y240 w44 h20 vc���� checked, ����
Gui, Add, DropDownList, x78 y240 w40 vd���� choose1, 1|2|3|4|5|6|7|8|9|0
Gui, Add, CheckBox, x33 y260 w44 h20 vcȥ÷ +disabled, ȥ÷
Gui, Add, DropDownList, x78 y260 w40 vdȥ÷ choose5, 1|2|3|4|5|6|7|8|9|0
Gui, Add, CheckBox, x33 y300 w44 h20 vc���� , ����
Gui, Add, DropDownList, x78 y300 w40 vd���� choose8, 1|2|3|4|5|6|7|8|9|0
Gui, Add, CheckBox, x33 y320 w44 h20 vc���� , ����
Gui, Add, DropDownList, x78 y320 w40 vd���� choose9, 1|2|3|4|5|6|7|8|9|0
Gui, Add, CheckBox, x33 y280 w44 h20 vc���� checked, ����
Gui, Add, DropDownList, x78 y280 w40 vd���� choose10, 1|2|3|4|5|6|7|8|9|0
Gui, Add, CheckBox, x123 y220 w44 h20 vcȥ , ȥ
Gui, Add, DropDownList, x168 y220 w40 vdȥ choose4, 1|2|3|4|5|6|7|8|9|0
Gui, Add, CheckBox, x123 y240 w68 h20 vc������ü checked, ������ü
Gui, Add, Edit, x194 y240 w15 h20 ve������ü +Center, x
Gui, Add, CheckBox, x123 y260 w68 h20 vc��ӽ��� checked, ��ӽ���
Gui, Add, Edit, x194 y260 w15 h20 ve��ӽ��� +Center, y
Gui, Add, CheckBox, x123 y280 w68 h20 vc���¹��� checked, ���¹���
Gui, Add, Edit, x194 y280 w15 h20 ve���¹��� +Center, z
Gui, Add, CheckBox, x123 y300 w68 h20 vc��߸��� g��߸��漳��, ��߸���
Gui, Add, Edit, x194 y300 w15 h20 ve��߸��� +Center, n
Gui, Add, CheckBox, x33 y340 h20 v�ɼ�1 +disabled, �ɼ�1
Gui, Add, CheckBox, x123 y340 h20 v���� +disabled, �������(z)
Gui, Add, Button, x226 y20 w55 h30 g����, ����
Gui, Add, Button, x281 y20 w55 h30 +disabled, ��ġ
Gui, Add, Button, x336 y20 w55 h30 g����, ����
Gui, Add, Button, x226 y50 w55 h30 g����, ����
Gui, Add, Button, x336 y50 w55 h30 g��Ȳ��, ��Ȳ��
Gui, Add, Button, x281 y50 w55 h30 g�������, �������
Gui, Add, GroupBox, x226 y83 w170 h60 +Center, you win
Gui, Add, Text, x236 y100 w155 +Center, ��ũ�θ� ������ ������ ���� ���ϰ��̴�.
Gui, Add, GroupBox, x226 y150 w90 h40 +Center, ����ð�
Gui, Add, Text, x236 y170 w70 h15 vtext1 +Center, �����
Gui, Add, GroupBox, x326 y150 w70 h40 +Center, Ƚ��
Gui, Add, Text, x336 y170 w50 h15 vtext2 +Center, �����
Gui, Add, Tab, x226 y200 w170 h170 , ȯ��|������|��ǳ��
Gui, Tab, ȯ��
Gui, Add, CheckBox, x233 y230 w44 h20 vHwanCheck, ��ȯ
Gui, Add, DropDownList, x280 y230 w40 vSummoncount choose1, 1|2|3|4
Gui, Add, CheckBox, x233 y250 h20 vHwanreturn, ȯ����ȯ
Gui, Add, CheckBox, x233 y270 w38 h20 vHwanA1, 1��
Gui, Add, Edit, x271 y270 w80 h20 vHwanB1, ȯ���̸�
Gui, Add, CheckBox, x233 y290 w38 h20 vHwanA2, 2��
Gui, Add, Edit, x271 y290 w80 h20 vHwanB2, ȯ���̸�
Gui, Add, CheckBox, x233 y310 w38 h20 vHwanA3, 3��
Gui, Add, Edit, x271 y310 w80 h20 vHwanB3, ȯ���̸�
Gui, Add, CheckBox, x233 y330 w38 h20 vHwanA4, 4��
Gui, Add, Edit, x271 y330 w80 h20 vHwanB4, ȯ���̸�
Gui, Tab, ������
Gui, Add, Radio, x236 y230 h20 vȥ�� Checked, ȥ������
Gui, Add, Radio, x236 y250 h20 v����, ���������
Gui, Add, Radio, x236 y270 h20, �������
Gui, Tab, ��ǳ��
Gui, Add, Radio, x236 y230 h20 v�˸��� Checked, �˸���
Gui, Add, Radio, x236 y250 h20 v�ٶ�����, �ٶ�����
Gui, Add, CheckBox, x236 y270 h20 vDefenseHupung, ��ǳ������
Gui, Add, Radio, x236 y290 h20 CBlue +disabled, ������
Gui, Add, Text, x236 y313 w20 h20 CBlue, ID
Gui, Add, Text, x236 y333 w20 h20 CBlue, PW
Gui, Add, Edit, x256 y310 w60 h20 +disabled, ���̵�
Gui, Add, Edit, x256 y330 w60 h20 +disabled, ��й�ȣ
Gui, Show, xCenter yCenter h400 w420, DM ���� %Version%
Gosub, �������
return
����:
GuiControl, Disable, ����
if(CheckA<>1 and CheckB<>1 and CheckC<>1){
Gosub, ����
}
GuiControl, Disable, ����
WinActivate �ٶ��ǳ���
Loop{
Gui, submit, nohide
Gosub, ��ǥ����Ʈ
Gosub, ��ǥ
Gosub, �����̵�
if(magic=1){
Gosub, ����
Gosub, ���ν�
}
Gosub, ��ǳ������
}
return
����:
Gosub, ���
Gosub, ����
Gosub, ����
Gosub, ����
Gosub, ���
Gosub, ���
Gosub, ����
return
����:
if(c����=1){
ImageSearch, x��, y��, 20, 70, 900, 600, img\bufb.bmp
if(ErrorLevel=1){
Send, {esc}{Shift down}z{Shift up}%e��ȣ%{home}{enter}
}
ImageSearch, x��, y��, 20, 70, 900, 600, img\bufm.bmp
if(ErrorLevel=1){
Send, {esc}{Shift down}z{Shift up}%e����%{home}{enter}
Sleep 2000
}
}
return
����:
if(c����=1){
����SP:=����Xüa+(100-Slider����)
ImageSearch, xx, yy, %����SP%, %����Y��%, %����SP%, %����Y��%, img\spcolor.bmp
if(ErrorLevel=1){
Send, %d����%
}
}
return
���:
if(c���=1){
����HP:=����Xüa+(100-Sliderü��)
ImageSearch, xx, yy, %����HP%, %����Yü%, %����HP%, %����Yü%, img\hpcolor.bmp
if(ErrorLevel=1){
SendInput, {esc}v{home}v%d���%{esc}
Sleep 100
}
}
return
���:
if(c���=1){
ImageSearch, X1, Y1, 20, 70, 900, 600, img\meda.bmp
if(ErrorLevel=1){
Sleep 200
Send, %d���%
sleep 2000
}
}
return
���:
if(c��ӽ���=1){
ImageSearch, x��, y��, 20, 70, 900, 600, Img\fast.bmp
if(ErrorLevel=1){
Send {esc}{Shift down}z{Shift up}%e��ӽ���%{home}{enter}
Sleep 2000
}
}
return
����:
if(c���¹���=1 and c��߸���=0){
ImageSearch, x��, y��, 20, 70, 900, 600, Img\spdefence.bmp
if(ErrorLevel=1){
Send {Shift down}z{Shift up}%e���¹���%
Sleep 8000
}
}
if(c���¹���=1 and c��߸���=1){
ImageSearch, x��, y��, 20, 70, 900, 600, Img\spdefence.bmp
if(ErrorLevel=1){
Send {Shift down}z{Shift up}%e��߸���%
Sleep 700
Send {Shift down}z{Shift up}%e���¹���%
Sleep 1000
Loop{
ImageSearch, x��, y��, 20, 70, 900, 600, Img\spdefence.bmp
if(ErrorLevel=0){
break
}
if(ErrorLevel=1){
Send {Shift down}z{Shift up}%e���¹���%
Sleep 8000
break
}
}
}
}
return
����:
if(c������ü=1){
ImageSearch, x��, y��, 20, 70, 900, 600, Img\magi.bmp
if(ErrorLevel=1){
Send {Shift down}z{Shift up}%e������ü%
}
}
return
���ν�:
ImageSearch, x��, y��, 30, 70, 820, 750, *TransFFFFFF Img\Mob2.bmp
if(ErrorLevel=0){
Gosub, �¿췣��
Gosub, ��ü
Gosub, ����
Gosub, ����
Gosub, ����
Gosub, ȥ
Gosub, ȥ÷
Gosub, ��ü
}
return
��ü:
Loop, 1{
Cal_skillTimer1:=A_TickCount-skillTimer1
Cal_skillTimer2:=A_TickCount-skillTimer2
if(c����=1 and Cal_skillTimer1>10000 and Y��ǥ<=10){
Send %d����%
skillTimer1:=A_TickCount
break
}
if(c����=1 and Cal_skillTimer2>10000 and Y��ǥ<=10){
Send %d����%
skillTimer2:=A_TickCount
break
}
}
return
����:
if(c����=1 and cȥ=1 and ��Count>=10){
Send, {esc}v{home}{%LoR%}v%dȥ%%d����%{esc}
��Count=0
}
if(c����=1 and cȥ=0 and ��Count>=10){
Send, {esc}v{home}{%LoR%}v%d����%{esc}
��Count=0
}
��Count++
return
����:
if(cȥ=1 and c����=1){
Send, {esc}v{home}{%LoR%}v%dȥ%%d����%{esc}
}
if(cȥ=0 and c����=1){
Send, {esc}v{home}{%LoR%}v%d����%{esc}
}
return
����:
if(c����=1 and ����count>=5){
Random, explotionRand, 1, 4
if(explotionRand=1){
Send, {Shift down}{up}{Shift up}%d����%
}
if(explotionRand=2){
Send, {Shift down}{down}{Shift up}%d����%
}
if(explotionRand=3){
Send, {Shift down}{left}{Shift up}%d����%
}
if(explotionRand=4){
Send, {Shift down}{right}{Shift up}%d����%
}
����Count=0
}
����count++
return
ȥ:
if(cȥ=1){
Send, {esc}%dȥ%{up}{enter}{esc}
}
return
ȥ÷:
if(cȥ÷=1){
Send, {esc}%dȥ÷%{esc}
}
return
�����ʽ���:
if(c����=1 ����Count>=5){
Send, {esc}{Shift down}{up}{Left}{shift up}%d����%
����Count=0
}
return
��ǥ����Ʈ:
Loop, 1{
ImageSearch,x,y, 200, 1, 800 ,200, *TransFFFFFF Img\nangsan.bmp
if(ErrorLevel=0){
magic=0
guicontrol, 2:text,Gui2Text6, ��������������
��X:=24, ��Y:=13
if(�ʱ�ȭ=0){
Gosub, ȯ����ȯ
Gosub, ȯ���ൿ��
Gosub, ����ġ
gosub, ����ī��Ʈ
�ʱ�ȭ=1
}
if(�ʱ�ȭ<>0 and X��ǥ<30 and Y��ǥ>8){
Gosub, ��Ż����
}
break
}
ImageSearch,x,y, 200, 1, 800 ,200, *TransFFFFFF Img\nangsanin1.bmp
if(ErrorLevel=0){
magic=1
guicontrol, 2:text,Gui2Text6, ����꼺1
�����ʱ�ȭ=0
if(�ʱ�ȭ=1){
Gosub, ȯ����ȯ
��X:=10, ��Y:=18
�ʱ�ȭ=0
}
if(X��ǥ=10 and Y��ǥ=18 or �ʱ�ȭ=2){
��X:=10, ��Y:=8
}
if(X��ǥ=10 and Y��ǥ=8){
�ʱ�ȭ=2
}
ImageSearch, X1, Y1, 200, 1, 1000, 200, *transFFFFFF Img\next.bmp
if(ErrorLevel=0){
if(�ʱ�ȭ=2){
��X:=10, ��Y:=8
�ʱ�ȭ=3
}
if(X��ǥ=10 and Y��ǥ=8){
��X:=10, ��Y:=0
}
}
break
}
ImageSearch, X1, Y1, 200, 1, 1100, 100, *transFFFFFF Img\nangsanin2.bmp
if(ErrorLevel=0){
magic=1
guicontrol, 2:text,Gui2Text6, ����꼺2
if(�ʱ�ȭ=3){
Gosub, ȯ����ȯ
��X:=17, ��Y:=5
�ʱ�ȭ=4
}
if(X��ǥ=18 and Y��ǥ=5){
��X:=17, ��Y:=5
}
if(X��ǥ=17 and Y��ǥ=5){
��X:=18, ��Y:=5
}
break
}
ImageSearch, X1, Y1, 200, 1, 1100, 100, *transFFFFFF Img\nangsanin3.bmp
if(ErrorLevel=0){
magic=1
guicontrol, 2:text,Gui2Text6, ����꼺3
if(�ʱ�ȭ=4){
Gosub, ȯ����ȯ
��X:=14, ��Y:=23
�ʱ�ȭ=0
}
ImageSearch, X1, Y1, 200, 1, 1100, 100, *transFFFFFF Img\Exit.bmp
if(ErrorLevel=0){
if(�ʱ�ȭ=0){
��X:=14, ��Y:=29
}
if(X��ǥ=14 and Y��ǥ=28){
��X:=16, ��Y:=29
}
}
break
}
ImageSearch,x,y, 200, 1, 800 ,200, *TransFFFFFF Img\���ʼ�.bmp
if(ErrorLevel=0){
magic=0
guicontrol, 2:text,Gui2Text6, ���ʼ�
if(�ʱ�ȭ=0100 or �ʱ�ȭ=0 or �ʱ�ȭ=1){
��X:=18, ��Y:=71
�ʱ�ȭ=0101
}
if(X��ǥ=18 and Y��ǥ=71){
��X:=35, ��Y:=71
}
if(X��ǥ=35 and Y��ǥ=71){
��X:=35, ��Y:=70
}
if(�ʱ�ȭ=1004 or �ʱ�ȭ=0011){
��X:=79, ��Y:=99
�ʱ�ȭ=0010
}
break
}
ImageSearch,x,y, 200, 1, 800 ,200, *TransFFFFFF Img\��ȥ��.bmp
if(ErrorLevel=0){
magic=0
guicontrol, 2:text,Gui2Text6, ��ȥ��
��X:=6, ��Y:=6
if(�ʱ�ȭ=0101){
�ʱ�ȭ=0102
Loop, {
MouseMove, 10, 10
ImageSearch, xNPC, yNPC, 1, 1, 1200, 1200, img\��ȥ��NPC.bmp
if(ErrorLevel=0){
Break
}
}
Loop, %��ȯȽ��%{
Sleep 500
Send {up}
Send {esc}
Click, %xNPC%, %yNPC%
sleep 1000
Send {down}
Sleep 500
Send {enteR}
Sleep 1000
if(��ȥü��=1){
Send {down}
sleep 500
}
if(��ȥ����=1){
Send {down}{down}
sleep 500
}
Send {enter}
Sleep 1000
Send {down}
sleep 500
Send {enter}
Sleep 1000
Send {enter}
Sleep 500
}
}
�ʱ�ȭ=1004
if(�ʱ�ȭ=1004){
Send {Shift down}zz{Shift up}3{enter}
sleep 7000
}
break
}
ImageSearch,x,y, 200, 1, 800 ,200, *TransFFFFFF Img\���ʽ�.bmp
if(ErrorLevel=0){
magic=0
guicontrol, 2:text,Gui2Text6, ���ʼ�-���ʽ�������
if(�ʱ�ȭ=0010){
��X:=8, ��Y:=7
�ʱ�ȭ=0
}
if(X��ǥ=8 and Y��ǥ:=8){
��X:=0, ��Y:=8
}
if(X��ǥ=0 and Y��ǥ=8){
��X:=0, ��Y:=10
�ʱ�ȭ=0
}
if(X��ǥ=0 and Y��ǥ=10){
��X:=16, ��Y:=8
�ʱ�ȭ=0
}
break
}
}
return
�¿췣��:
LaRCount++
Random, LaR, 1, 2
if(LaRCount>=10){
if(LaR=1){
LoR = Left
}
if(LaR=2){
LoR = Right
}
guicontrol, 2:text,Gui2Text7, %LoR%
LaRCount=0
}
return
ȯ����ȯ:
if(Hwanreturn=1){
Clipboard = ȯ�� ��ȯ
Send, '^v`n
}
return
ȯ���ൿ��:
if(HwanA1=1){
ImageSearch, xȯ��1, yȯ��1, %xȯ1%, %ȯ1Y1%, %xȯ2%, %ȯ1Y2%, img\hwanwork.bmp
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
ImageSearch, xȯ��2, yȯ��2, %xȯ1%, %ȯ2Y1%, %xȯ2%, %ȯ2Y2%, img\Hwanwork.bmp
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
ImageSearch, xȯ��3, yȯ��3, %xȯ1%, %ȯ3Y1%, %xȯ2%, %ȯ3Y2%, img\Hwanwork.bmp
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
ImageSearch, xȯ��4, yȯ��4, %xȯ1%, %ȯ4Y1%, %xȯ2%, %ȯ4Y2%, img\Hwanwork.bmp
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
return
��Ż����:
if(ȥ��=1 or ����=1){
Send {esc}
sleep 100
Send {Ctrl down}r{Ctrl up}
Sleep 2000
Loop, 100 {
ImageSearch, X��Ż, Y��Ż, 1, 1, 1100, 800, Img\Potal.bmp
if(ErrorLevel=0){
break
}
Sleep 30
}
if(ErrorLevel=0){
Send {esc}
sleep 100
Click, %X��Ż%, %Y��Ż%
Click, 20, 90
if(ȥ��=1){
Sleep 1000
Send {down}
Sleep 500
Send {enter}
Sleep 500
Send {esc}
Sleep 1000
}
if(����=1){
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
}
}
return
ȯ����ȯ:
if(HwanCheck=1){
Loop, %Summoncount% {
Send, {Ctrl down}/{Ctrl up}
Sleep 400
Send {esc}
}
Send {enter}{esc}
Sleep 500
Send {enter}{esc}
}
return
��߸��漳��:
gui, submit, nohide
if(c��߸���=1){
msgbox ��߸����� üũ�Ұ��, ���->���� �� ���ϴ� (ĭ���� ��� ���ĺ������ּ���)`n���� ���½ð��� �Ʋ��� �״°� �����ϱ������Դϴ� �ʿ��Ͻôٸ龲����..
}
return
����ġ:
ImageSearch, X1, Y1, 800, 700, 1100, 800, img\exp.bmp
if(ErrorLevel=0){
if(��ȥü��=1 or ��ȥ����=1){
Loop{
Send, {Shift down}zz{shift up}2{enter}
ImageSearch,x,y, 200, 1, 800 ,200, *TransFFFFFF Img\���ʼ�.bmp
if(ErrorLevel=0){
�ʱ�ȭ=0
break
}
}
}
if(��=1){
Loop {
Soundplay, img\PAGING.wav
Sleep 2000
ImageSearch, X1, Y1, 800, 700, 1100, 800, img\exp.bmp
if(ErrorLevel=1){
break
}
}
}
if(��=1){
Loop, %��ȯȽ��%{
send ud
sleep 1000
send {Down}
sleep 1000
send {Enter}
Sleep 1000
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
}
return
��ǥ:
X��=0
Loop, 2
{
ImageSearch, X��1, xY��1, %����X��a%, %����Y��%, %����X��b%, %����Y�Ʒ�%, *TransFFFFFF img\%X��%.bmp
if(ErrorLevel=1){
X��:=X��+1
}
else if(ErrorLevel=0){
break
}
}
X��=0
Loop, 9
{
ImageSearch, X��1, xY��1, %����X��a%, %����Y��%, %����X��b%, %����Y�Ʒ�%, *TransFFFFFF img\%X��%.bmp
if(ErrorLevel=1){
X��:=X��+1
}
else if(ErrorLevel=0){
break
}
}
X��=0
Loop, 9
{
ImageSearch, X��1, xY��1, %����X��a%, %����Y��%, %����X��b%, %����Y�Ʒ�%, *TransFFFFFF img\%X��%.bmp
if(ErrorLevel=1){
X��:=X��+1
}
else if(ErrorLevel=0){
break
}
}
Y��=0
Loop, 2
{
ImageSearch, Y��1, xY��1, %����Y��a%, %����Y��%, %����Y��b%, %����Y�Ʒ�%, *TransFFFFFF img\%Y��%.bmp
if(ErrorLevel=1){
Y��:=Y��+1
}
else if(ErrorLevel=0){
break
}
}
Y��=0
Loop, 9
{
ImageSearch, Y��1, xY��1, %����Y��a%, %����Y��%, %����Y��b%, %����Y�Ʒ�%, *TransFFFFFF img\%Y��%.bmp
if(ErrorLevel=1){
Y��:=Y��+1
}
else if(ErrorLevel=0){
break
}
}
Y��=0
Loop, 9
{
ImageSearch, Y��1, xY��1, %����Y��a%, %����Y��%, %����Y��b%, %����Y�Ʒ�%, *TransFFFFFF img\%Y��%.bmp
if(ErrorLevel=1){
Y��:=Y��+1
}
else if(ErrorLevel=0){
break
}
}
X��ǥ:=(X��*100)+(X��*10)+(X��)
Y��ǥ:=(Y��*100)+(Y��*10)+(Y��)
if(��Y>Y��ǥ){
ControlSend,, {down},ahk_class Nexon.NWind
}
if(��Y<Y��ǥ){
ControlSend,, {up},ahk_class Nexon.NWind
}
if(��X>X��ǥ){
ControlSend,, {right},ahk_class Nexon.NWind
}
if(��X<X��ǥ){
ControlSend,, {Left},ahk_class Nexon.NWind
}
guicontrol, 2:text,������X, ��X %��X%
guicontrol, 2:text,������Y, ��Y %��Y%
guicontrol, 2:text,��X, ��X %X��ǥ%
guicontrol, 2:text,��Y, ��Y %Y��ǥ%
guicontrol, 2:text,�ʱ�ȭ��, �� %�ʱ�ȭ%
return
��ǳ������:
if(DefenseHupung=1){
Loop{
ImageSearch, x, y, 1, 1, 800, 600, *TransFFFFFF img\mob.bmp
if(ErrorLevel=0){
��X:=17, ��Y:=11
Gosub, ���ν�
Gosub, ����
Gosub, ��ǥ
}
if(ErrorLevel=1){
break
}
}
Sleep 10000
Loop{
��X:=16, ��Y:=13
Gosub, ��ǥ
ImageSearch,x,y, 200, 1, 800 ,200, *TransFFFFFF Img\X-10.bmp
if(ErrorLevel=0){
break
}
}
}
return
����ī��Ʈ:
if(�����ʱ�ȭ=0){
����:=����+1
guicontrol,text,text2,%����%����
�����ʱ�ȭ=1
}
return
�����̵�:
Cal_RandomTimer:=A_TickCount-RandomTimer
if(Cal_RandomTimer<1000){
����X��ǥ=%X��ǥ%
����Y��ǥ=%Y��ǥ%
}
if(Cal_RandomTimer>2500){
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
return
��ǳ������:
ImageSearch, X��, Y��, 450, 500, 800, 450, img\hu.bmp
if(ErrorLevel=0){
if(�˸���=1){
soundplay img\QUERY.wav
}
if(�ٶ�����=1){
WinActivate �ٶ��ǳ���
Sleep 1000
Send {Alt down}{F4}{Alt up}
Sleep 1000
}
}
return
Pgup::
����:
CheckA=0
CheckB=0
CheckC=0
WinActivate, �ٶ��ǳ���
LoR=Left
��Count=0
����Count=0
gui, submit,nohide
Time:=A_TickCount
skillTimer1:=A_TickCount
skillTimer2:=A_TickCount
RandomTimer:=A_TickCount
settimer,Timer,on
guicontrol,text,text2,0����
�ʱ�ȭ=0
����=0
Sleep 2000
ImageSearch, X1, Y1, 800, 100, 950, 300, img\Hwansu.bmp
if(ErrorLevel=1){
Send p
}
Loop{
SearchCount++
if(searchcount>=100){
break
}
ImageSearch, Xã, Yã, 0, 0, 1400, 1400, *transFFFFFF img\X.bmp
if(ErrorLevel=0){
checkA=1
break
}
}
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
����Y�Ʒ�:= Yã + 10
ImageSearch, xȯã, yȯã, 1, 1, 1400, 1400, img\HwanSearch.bmp
if(ErrorLevel=0){
checkB=1
}
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
ImageSearch, Xü, Yü, 500, 500, 1400, 1400, img\ü.bmp
if(ErrorLevel=0){
checkC=1
}
����Xüa:= Xü + 48
����Yü:= Yü
����Y��:= Yü + 19
����HP:=����Xüa+(100-Sliderü��)
����SP:=����Xüa+(100-Slider����)
if(CheckA=1 and CheckB=1 and CheckC=1){
msgbox ������ �Ϸ�Ǿ����ϴ�!
} else {
msgbox ������ �����Ͽ����ϴ� ������ư�� �ٽ� �����ּ���`n`n���� ��ü��� ����������, ���ӻ󿡼� PgUp��ư�� ������ ��� ��ٷ��ּ���
}
return
Timer:
Sec:=Floor((A_TickCount-Time)/1000)
If Sec<60
{
guicontrol,text,text1,%Sec%��
}
else
{
Min:=Floor(Sec/60)
Sec2:=Mod(Sec,60)
guicontrol,text,text1, %Min%�� %Sec2%��
}
return
����:
msgbox ����Ű�� ��ȭâ����/����ȿ��/�þ�ǥ�ø� ������, Ÿ���̵��� 3������ �ٲټ��� `n`n����Ű�Է½� �ٷ��̵��� �ݵ�� Ű���� �̰ž�Ű�� �ȿ����� �Ѥ�`n`n�ݵ�� �̸�ǥ��-��Ÿ �� Ű����`n`n�ϴܿ� ä���ʿ��ִ� < �� ������ ������������ �Ⱥ��̰� �ϼ��� `n`n �溯��, �ʾ������ġ�� d�� `n`n �ൿ����ȯ��/�Ǹ� ��ġ�� i �Դϴ� `n`n �Ͻ�����,�ٽý����� Page down ó������ �ٽý����ҷ��� ���� Ű���� `n`n �񿵻�õ���� �빮�� Z`n`n http://dmcmcr.blogspot.com return
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
����üũ:
gui,3:destroy
Gui,3: Add, Text, vGUINewVer x10 y10 w200 h20 Cblue, �ֽ� ���� :
Gui,3: Add, Text, vGuiNowVer x10 y30 w200 h20 CRed, ���� ���� :
Gui,3: Add, Text, vGUI300 x10 y50 w300 h20 , -
Gui,3: Add, Text, vGUI301 x10 y70 w300 h20 , -
Gui,3: Add, Text, vGUI302 x10 y90 w300 h20 , -
Gui,3: Add, Text, vGUI303 x10 y110 w300 h20 , -
Gui,3: Add, Text, vGUI304 x10 y130 w300 h20 , -
Gui,3: Add, Text, vGUI305 x10 y130 w300 h20 , -
Gui,3: Add, Text, vGUI306 x10 y130 w300 h20 , -
Gui,3: Add, Text, vGUI307 x10 y130 w300 h20 , -
Gui,3: Add, Text, vGUI308 x10 y130 w300 h20 , -
GUI,3:Show, w300 h300, �������� ġ��ġ��@���
urldownloadtofile,http://cfs.tistory.com/custom/blog/49/495518/skin/images/NangsanVersioninfo.ini,NangsanVersioninfo.ini
iniRead, NewVersion, NangsanVersioninfo.ini, version, New
iniRead, text1, NangsanVersioninfo.ini, info, text1
iniRead, text2, NangsanVersioninfo.ini, info, text2
iniRead, text3, NangsanVersioninfo.ini, info, text3
iniRead, text4, NangsanVersioninfo.ini, info, text4
iniRead, text5, NangsanVersioninfo.ini, info, text5
iniRead, text6, NangsanVersioninfo.ini, info, text6
iniRead, text7, NangsanVersioninfo.ini, info, text7
iniRead, text8, NangsanVersioninfo.ini, info, text8
iniRead, text9, NangsanVersioninfo.ini, info, text9
iniRead, text10, NangsanVersioninfo.ini, info, text10
guicontrol, 3:text,GuiNewVer, �ֽ� ���� : %Newversion%
guicontrol, 3:text,GuiNowVer, ���� ���� : %version%
if(Version = NewVersion){
guicontrol, 3:text,GUI300, �ֽŹ����Դϴ�.
} else {
guicontrol, 3:text,GUI300, �ֽŹ����� �ƴմϴ�. �ֽŹ��� ����� �����մϴ�.
}
guicontrol, 3:text,GUI301, %text1%
guicontrol, 3:text,GUI302, %text2%
guicontrol, 3:text,GUI303, %text3%
guicontrol, 3:text,GUI304, %text4%
guicontrol, 3:text,GUI305, %text5%
guicontrol, 3:text,GUI306, %text6%
guicontrol, 3:text,GUI307, %text7%
guicontrol, 3:text,GUI308, %text8%
guicontrol, 3:text,GUI309, %text9%
guicontrol, 3:text,GUI310, %text10%
return
guiclose:
exitapp
return
2guiclose:
gui,2:destroy
return
3guiclose:
gui,3:destroy
return
^End::
Exitapp
return
Pgdn::
Pause
return
