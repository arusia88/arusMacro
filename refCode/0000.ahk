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
 msgbox, 이용가능
 goto, Go
}
Ifinstring,text, Offoffoff
{
 filedelete,check%a%.txt
 Msgbox, 서버 오프
 ExitApp
}
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
Gui, Add, Edit, x180 y100 w20 h20 v변환횟수 +Center, 4
Gui, Add, GroupBox, x26 y140 w190 h230 , http://dmcmcr.blogspot.kr/
Gui, Add, CheckBox, x33 y160 w44 h20 vc보무, 보무
Gui, Add, Edit, x78 y160 w20 h20 ve보호, q
Gui, Add, Edit, x98 y160 w20 h20 ve무장, w
Gui, Add, CheckBox, x123 y160 w44 h20 vc명상 checked, 명상
Gui, Add, DropDownList, x168 y160 w40 vd명상 choose7, 1|2|3|4|5|6|7|8|9|0
Gui, Add, CheckBox, x33 y180 w44 h20 vc기원 checked, 기원
Gui, Add, DropDownList, x78 y180 w40 vd기원 choose3, 1|2|3|4|5|6|7|8|9|0
Gui, Add, CheckBox, x33 y200 w44 h20 vc공증 checked, 공증
Gui, Add, DropDownList, x78 y200 w40 vd공증 choose2, 1|2|3|4|5|6|7|8|9|0
Gui, Add, Slider, x123 y180 w80 h20 vSlider체력, 50
Gui, Add, Slider, x123 y200 w80 h20 vSlider마력, 70
Gui, Add, CheckBox, x33 y220 w44 h20 vc헬파 checked, 헬파
Gui, Add, DropDownList, x78 y220 w40 vd헬파 choose6, 1|2|3|4|5|6|7|8|9|0
Gui, Add, CheckBox, x33 y240 w44 h20 vc성려 checked, 성려
Gui, Add, DropDownList, x78 y240 w40 vd성려 choose1, 1|2|3|4|5|6|7|8|9|0
Gui, Add, CheckBox, x33 y260 w44 h20 vc혼첨 +disabled, 혼첨
Gui, Add, DropDownList, x78 y260 w40 vd혼첨 choose5, 1|2|3|4|5|6|7|8|9|0
Gui, Add, CheckBox, x33 y300 w44 h20 vc지폭 , 지폭
Gui, Add, DropDownList, x78 y300 w40 vd지폭 choose8, 1|2|3|4|5|6|7|8|9|0
Gui, Add, CheckBox, x33 y320 w44 h20 vc폭류 , 폭류
Gui, Add, DropDownList, x78 y320 w40 vd폭류 choose9, 1|2|3|4|5|6|7|8|9|0
Gui, Add, CheckBox, x33 y280 w44 h20 vc시폭 checked, 시폭
Gui, Add, DropDownList, x78 y280 w40 vd시폭 choose10, 1|2|3|4|5|6|7|8|9|0
Gui, Add, CheckBox, x123 y220 w44 h20 vc혼 , 혼
Gui, Add, DropDownList, x168 y220 w40 vd혼 choose4, 1|2|3|4|5|6|7|8|9|0
Gui, Add, CheckBox, x123 y240 w68 h20 vc마기지체 checked, 마기지체
Gui, Add, Edit, x194 y240 w15 h20 ve마기지체 +Center, x
Gui, Add, CheckBox, x123 y260 w68 h20 vc쾌속시전 checked, 쾌속시전
Gui, Add, Edit, x194 y260 w15 h20 ve쾌속시전 +Center, y
Gui, Add, CheckBox, x123 y280 w68 h20 vc마력방패 checked, 마력방패
Gui, Add, Edit, x194 y280 w15 h20 ve마력방패 +Center, z
Gui, Add, CheckBox, x123 y300 w68 h20 vc즉발마방 g즉발마방설명, 즉발마방
Gui, Add, Edit, x194 y300 w15 h20 ve즉발마방 +Center, n
Gui, Add, CheckBox, x33 y340 h20 v옵션1 +disabled, 옵션1
Gui, Add, CheckBox, x123 y340 h20 v축지 +disabled, 축지사용(z)
Gui, Add, Button, x226 y20 w55 h30 g시작, 시작
Gui, Add, Button, x281 y20 w55 h30 +disabled, 설치
Gui, Add, Button, x336 y20 w55 h30 g설정, 설정
Gui, Add, Button, x226 y50 w55 h30 g설명서, 설명서
Gui, Add, Button, x336 y50 w55 h30 g상황판, 상황판
Gui, Add, Button, x281 y50 w55 h30 g성능향상, 성능향상
Gui, Add, GroupBox, x226 y83 w170 h60 +Center, you win
Gui, Add, Text, x236 y100 w155 +Center, 메크로를 돌려라 마신이 눈에 보일것이다.
Gui, Add, GroupBox, x226 y150 w90 h40 +Center, 경과시간
Gui, Add, Text, x236 y170 w70 h15 vtext1 +Center, 대기중
Gui, Add, GroupBox, x326 y150 w70 h40 +Center, 횟수
Gui, Add, Text, x336 y170 w50 h15 vtext2 +Center, 대기중
Gui, Add, Tab, x226 y200 w170 h170 , 환수|입장방법|허풍선
Gui, Tab, 환수
Gui, Add, CheckBox, x233 y230 w44 h20 vHwanCheck, 소환
Gui, Add, DropDownList, x280 y230 w40 vSummoncount choose1, 1|2|3|4
Gui, Add, CheckBox, x233 y250 h20 vHwanreturn, 환수귀환
Gui, Add, CheckBox, x233 y270 w38 h20 vHwanA1, 1번
Gui, Add, Edit, x271 y270 w80 h20 vHwanB1, 환수이름
Gui, Add, CheckBox, x233 y290 w38 h20 vHwanA2, 2번
Gui, Add, Edit, x271 y290 w80 h20 vHwanB2, 환수이름
Gui, Add, CheckBox, x233 y310 w38 h20 vHwanA3, 3번
Gui, Add, Edit, x271 y310 w80 h20 vHwanB3, 환수이름
Gui, Add, CheckBox, x233 y330 w38 h20 vHwanA4, 4번
Gui, Add, Edit, x271 y330 w80 h20 vHwanB4, 환수이름
Gui, Tab, 입장방법
Gui, Add, Radio, x236 y230 h20 v혼자 Checked, 혼자입장
Gui, Add, Radio, x236 y250 h20 v같이, 일행과입장
Gui, Add, Radio, x236 y270 h20, 입장안함
Gui, Tab, 허풍선
Gui, Add, Radio, x236 y230 h20 v알림음 Checked, 알림음
Gui, Add, Radio, x236 y250 h20 v바람종료, 바람종료
Gui, Add, CheckBox, x236 y270 h20 vDefenseHupung, 허풍선방지
Gui, Add, Radio, x236 y290 h20 CBlue +disabled, 재접속
Gui, Add, Text, x236 y313 w20 h20 CBlue, ID
Gui, Add, Text, x236 y333 w20 h20 CBlue, PW
Gui, Add, Edit, x256 y310 w60 h20 +disabled, 아이디
Gui, Add, Edit, x256 y330 w60 h20 +disabled, 비밀번호
Gui, Show, xCenter yCenter h400 w420, DM 낭산 %Version%
Gosub, 성능향상
return
시작:
GuiControl, Disable, 시작
if(CheckA<>1 and CheckB<>1 and CheckC<>1){
Gosub, 설정
}
GuiControl, Disable, 시작
WinActivate 바람의나라
Loop{
Gui, submit, nohide
Gosub, 좌표리스트
Gosub, 좌표
Gosub, 랜덤이동
if(magic=1){
Gosub, 버프
Gosub, 몹인식
}
Gosub, 허풍선감지
}
return
버프:
Gosub, 쾌속
Gosub, 마방
Gosub, 보무
Gosub, 공증
Gosub, 기원
Gosub, 명상
Gosub, 마기
return
보무:
if(c보무=1){
ImageSearch, x보, y보, 20, 70, 900, 600, img\bufb.bmp
if(ErrorLevel=1){
Send, {esc}{Shift down}z{Shift up}%e보호%{home}{enter}
}
ImageSearch, x무, y무, 20, 70, 900, 600, img\bufm.bmp
if(ErrorLevel=1){
Send, {esc}{Shift down}z{Shift up}%e무장%{home}{enter}
Sleep 2000
}
}
return
공증:
if(c공증=1){
범위SP:=범위X체a+(100-Slider마력)
ImageSearch, xx, yy, %범위SP%, %범위Y마%, %범위SP%, %범위Y마%, img\spcolor.bmp
if(ErrorLevel=1){
Send, %d공증%
}
}
return
기원:
if(c기원=1){
범위HP:=범위X체a+(100-Slider체력)
ImageSearch, xx, yy, %범위HP%, %범위Y체%, %범위HP%, %범위Y체%, img\hpcolor.bmp
if(ErrorLevel=1){
SendInput, {esc}v{home}v%d기원%{esc}
Sleep 100
}
}
return
명상:
if(c명상=1){
ImageSearch, X1, Y1, 20, 70, 900, 600, img\meda.bmp
if(ErrorLevel=1){
Sleep 200
Send, %d명상%
sleep 2000
}
}
return
쾌속:
if(c쾌속시전=1){
ImageSearch, x보, y보, 20, 70, 900, 600, Img\fast.bmp
if(ErrorLevel=1){
Send {esc}{Shift down}z{Shift up}%e쾌속시전%{home}{enter}
Sleep 2000
}
}
return
마방:
if(c마력방패=1 and c즉발마방=0){
ImageSearch, x보, y보, 20, 70, 900, 600, Img\spdefence.bmp
if(ErrorLevel=1){
Send {Shift down}z{Shift up}%e마력방패%
Sleep 8000
}
}
if(c마력방패=1 and c즉발마방=1){
ImageSearch, x보, y보, 20, 70, 900, 600, Img\spdefence.bmp
if(ErrorLevel=1){
Send {Shift down}z{Shift up}%e즉발마방%
Sleep 700
Send {Shift down}z{Shift up}%e마력방패%
Sleep 1000
Loop{
ImageSearch, x보, y보, 20, 70, 900, 600, Img\spdefence.bmp
if(ErrorLevel=0){
break
}
if(ErrorLevel=1){
Send {Shift down}z{Shift up}%e마력방패%
Sleep 8000
break
}
}
}
}
return
마기:
if(c마기지체=1){
ImageSearch, x보, y보, 20, 70, 900, 600, Img\magi.bmp
if(ErrorLevel=1){
Send {Shift down}z{Shift up}%e마기지체%
}
}
return
몹인식:
ImageSearch, x몹, y몹, 30, 70, 820, 750, *TransFFFFFF Img\Mob2.bmp
if(ErrorLevel=0){
Gosub, 좌우랜덤
Gosub, 전체
Gosub, 헬파
Gosub, 성려
Gosub, 시폭
Gosub, 혼
Gosub, 혼첨
Gosub, 전체
}
return
전체:
Loop, 1{
Cal_skillTimer1:=A_TickCount-skillTimer1
Cal_skillTimer2:=A_TickCount-skillTimer2
if(c지폭=1 and Cal_skillTimer1>10000 and Y좌표<=10){
Send %d지폭%
skillTimer1:=A_TickCount
break
}
if(c폭류=1 and Cal_skillTimer2>10000 and Y좌표<=10){
Send %d폭류%
skillTimer2:=A_TickCount
break
}
}
return
헬파:
if(c헬파=1 and c혼=1 and 헬Count>=10){
Send, {esc}v{home}{%LoR%}v%d혼%%d헬파%{esc}
헬Count=0
}
if(c헬파=1 and c혼=0 and 헬Count>=10){
Send, {esc}v{home}{%LoR%}v%d헬파%{esc}
헬Count=0
}
헬Count++
return
성려:
if(c혼=1 and c성려=1){
Send, {esc}v{home}{%LoR%}v%d혼%%d성려%{esc}
}
if(c혼=0 and c성려=1){
Send, {esc}v{home}{%LoR%}v%d성려%{esc}
}
return
시폭:
if(c시폭=1 and 시폭count>=5){
Random, explotionRand, 1, 4
if(explotionRand=1){
Send, {Shift down}{up}{Shift up}%d시폭%
}
if(explotionRand=2){
Send, {Shift down}{down}{Shift up}%d시폭%
}
if(explotionRand=3){
Send, {Shift down}{left}{Shift up}%d시폭%
}
if(explotionRand=4){
Send, {Shift down}{right}{Shift up}%d시폭%
}
시폭Count=0
}
시폭count++
return
혼:
if(c혼=1){
Send, {esc}%d혼%{up}{enter}{esc}
}
return
혼첨:
if(c혼첨=1){
Send, {esc}%d혼첨%{esc}
}
return
오른쪽시폭:
if(c시폭=1 시폭Count>=5){
Send, {esc}{Shift down}{up}{Left}{shift up}%d시폭%
시폭Count=0
}
return
좌표리스트:
Loop, 1{
ImageSearch,x,y, 200, 1, 800 ,200, *TransFFFFFF Img\nangsan.bmp
if(ErrorLevel=0){
magic=0
guicontrol, 2:text,Gui2Text6, 마한집결지대기실
갈X:=24, 갈Y:=13
if(초기화=0){
Gosub, 환수귀환
Gosub, 환수행동력
Gosub, 경험치
gosub, 바퀴카운트
초기화=1
}
if(초기화<>0 and X좌표<30 and Y좌표>8){
Gosub, 포탈입장
}
break
}
ImageSearch,x,y, 200, 1, 800 ,200, *TransFFFFFF Img\nangsanin1.bmp
if(ErrorLevel=0){
magic=1
guicontrol, 2:text,Gui2Text6, 낭산산성1
바퀴초기화=0
if(초기화=1){
Gosub, 환수소환
갈X:=10, 갈Y:=18
초기화=0
}
if(X좌표=10 and Y좌표=18 or 초기화=2){
갈X:=10, 갈Y:=8
}
if(X좌표=10 and Y좌표=8){
초기화=2
}
ImageSearch, X1, Y1, 200, 1, 1000, 200, *transFFFFFF Img\next.bmp
if(ErrorLevel=0){
if(초기화=2){
갈X:=10, 갈Y:=8
초기화=3
}
if(X좌표=10 and Y좌표=8){
갈X:=10, 갈Y:=0
}
}
break
}
ImageSearch, X1, Y1, 200, 1, 1100, 100, *transFFFFFF Img\nangsanin2.bmp
if(ErrorLevel=0){
magic=1
guicontrol, 2:text,Gui2Text6, 낭산산성2
if(초기화=3){
Gosub, 환수소환
갈X:=17, 갈Y:=5
초기화=4
}
if(X좌표=18 and Y좌표=5){
갈X:=17, 갈Y:=5
}
if(X좌표=17 and Y좌표=5){
갈X:=18, 갈Y:=5
}
break
}
ImageSearch, X1, Y1, 200, 1, 1100, 100, *transFFFFFF Img\nangsanin3.bmp
if(ErrorLevel=0){
magic=1
guicontrol, 2:text,Gui2Text6, 낭산산성3
if(초기화=4){
Gosub, 환수소환
갈X:=14, 갈Y:=23
초기화=0
}
ImageSearch, X1, Y1, 200, 1, 1100, 100, *transFFFFFF Img\Exit.bmp
if(ErrorLevel=0){
if(초기화=0){
갈X:=14, 갈Y:=29
}
if(X좌표=14 and Y좌표=28){
갈X:=16, 갈Y:=29
}
}
break
}
ImageSearch,x,y, 200, 1, 800 ,200, *TransFFFFFF Img\위례성.bmp
if(ErrorLevel=0){
magic=0
guicontrol, 2:text,Gui2Text6, 위례성
if(초기화=0100 or 초기화=0 or 초기화=1){
갈X:=18, 갈Y:=71
초기화=0101
}
if(X좌표=18 and Y좌표=71){
갈X:=35, 갈Y:=71
}
if(X좌표=35 and Y좌표=71){
갈X:=35, 갈Y:=70
}
if(초기화=1004 or 초기화=0011){
갈X:=79, 갈Y:=99
초기화=0010
}
break
}
ImageSearch,x,y, 200, 1, 800 ,200, *TransFFFFFF Img\영혼사.bmp
if(ErrorLevel=0){
magic=0
guicontrol, 2:text,Gui2Text6, 영혼사
갈X:=6, 갈Y:=6
if(초기화=0101){
초기화=0102
Loop, {
MouseMove, 10, 10
ImageSearch, xNPC, yNPC, 1, 1, 1200, 1200, img\영혼사NPC.bmp
if(ErrorLevel=0){
Break
}
}
Loop, %변환횟수%{
Sleep 500
Send {up}
Send {esc}
Click, %xNPC%, %yNPC%
sleep 1000
Send {down}
Sleep 500
Send {enteR}
Sleep 1000
if(영혼체력=1){
Send {down}
sleep 500
}
if(영혼마력=1){
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
초기화=1004
if(초기화=1004){
Send {Shift down}zz{Shift up}3{enter}
sleep 7000
}
break
}
ImageSearch,x,y, 200, 1, 800 ,200, *TransFFFFFF Img\남쪽숲.bmp
if(ErrorLevel=0){
magic=0
guicontrol, 2:text,Gui2Text6, 위례성-남쪽숲갈림길
if(초기화=0010){
갈X:=8, 갈Y:=7
초기화=0
}
if(X좌표=8 and Y좌표:=8){
갈X:=0, 갈Y:=8
}
if(X좌표=0 and Y좌표=8){
갈X:=0, 갈Y:=10
초기화=0
}
if(X좌표=0 and Y좌표=10){
갈X:=16, 갈Y:=8
초기화=0
}
break
}
}
return
좌우랜덤:
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
환수귀환:
if(Hwanreturn=1){
Clipboard = 환수 귀환
Send, '^v`n
}
return
환수행동력:
if(HwanA1=1){
ImageSearch, x환수1, y환수1, %x환1%, %환1Y1%, %x환2%, %환1Y2%, img\hwanwork.bmp
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
ImageSearch, x환수2, y환수2, %x환1%, %환2Y1%, %x환2%, %환2Y2%, img\Hwanwork.bmp
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
ImageSearch, x환수3, y환수3, %x환1%, %환3Y1%, %x환2%, %환3Y2%, img\Hwanwork.bmp
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
ImageSearch, x환수4, y환수4, %x환1%, %환4Y1%, %x환2%, %환4Y2%, img\Hwanwork.bmp
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
포탈입장:
if(혼자=1 or 같이=1){
Send {esc}
sleep 100
Send {Ctrl down}r{Ctrl up}
Sleep 2000
Loop, 100 {
ImageSearch, X포탈, Y포탈, 1, 1, 1100, 800, Img\Potal.bmp
if(ErrorLevel=0){
break
}
Sleep 30
}
if(ErrorLevel=0){
Send {esc}
sleep 100
Click, %X포탈%, %Y포탈%
Click, 20, 90
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
}
}
return
환수소환:
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
즉발마방설명:
gui, submit, nohide
if(c즉발마방=1){
msgbox 즉발마방을 체크할경우, 즉발->마방 을 씁니다 (칸에는 즉발 알파벳을써주세요)`n마방 쓰는시간을 아껴서 죽는걸 방지하기위함입니다 필요하시다면쓰세요..
}
return
경험치:
ImageSearch, X1, Y1, 800, 700, 1100, 800, img\exp.bmp
if(ErrorLevel=0){
if(영혼체력=1 or 영혼마력=1){
Loop{
Send, {Shift down}zz{shift up}2{enter}
ImageSearch,x,y, 200, 1, 800 ,200, *TransFFFFFF Img\위례성.bmp
if(ErrorLevel=0){
초기화=0
break
}
}
}
if(중=1){
Loop {
Soundplay, img\PAGING.wav
Sleep 2000
ImageSearch, X1, Y1, 800, 700, 1100, 800, img\exp.bmp
if(ErrorLevel=1){
break
}
}
}
if(십=1){
Loop, %변환횟수%{
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
}
return
좌표:
X백=0
Loop, 2
{
ImageSearch, X백1, xY백1, %범위X백a%, %범위Y위%, %범위X백b%, %범위Y아래%, *TransFFFFFF img\%X백%.bmp
if(ErrorLevel=1){
X백:=X백+1
}
else if(ErrorLevel=0){
break
}
}
X십=0
Loop, 9
{
ImageSearch, X십1, xY십1, %범위X십a%, %범위Y위%, %범위X십b%, %범위Y아래%, *TransFFFFFF img\%X십%.bmp
if(ErrorLevel=1){
X십:=X십+1
}
else if(ErrorLevel=0){
break
}
}
X일=0
Loop, 9
{
ImageSearch, X일1, xY일1, %범위X일a%, %범위Y위%, %범위X일b%, %범위Y아래%, *TransFFFFFF img\%X일%.bmp
if(ErrorLevel=1){
X일:=X일+1
}
else if(ErrorLevel=0){
break
}
}
Y백=0
Loop, 2
{
ImageSearch, Y백1, xY백1, %범위Y백a%, %범위Y위%, %범위Y백b%, %범위Y아래%, *TransFFFFFF img\%Y백%.bmp
if(ErrorLevel=1){
Y백:=Y백+1
}
else if(ErrorLevel=0){
break
}
}
Y십=0
Loop, 9
{
ImageSearch, Y십1, xY십1, %범위Y십a%, %범위Y위%, %범위Y십b%, %범위Y아래%, *TransFFFFFF img\%Y십%.bmp
if(ErrorLevel=1){
Y십:=Y십+1
}
else if(ErrorLevel=0){
break
}
}
Y일=0
Loop, 9
{
ImageSearch, Y일1, xY일1, %범위Y일a%, %범위Y위%, %범위Y일b%, %범위Y아래%, *TransFFFFFF img\%Y일%.bmp
if(ErrorLevel=1){
Y일:=Y일+1
}
else if(ErrorLevel=0){
break
}
}
X좌표:=(X백*100)+(X십*10)+(X일)
Y좌표:=(Y백*100)+(Y십*10)+(Y일)
if(갈Y>Y좌표){
ControlSend,, {down},ahk_class Nexon.NWind
}
if(갈Y<Y좌표){
ControlSend,, {up},ahk_class Nexon.NWind
}
if(갈X>X좌표){
ControlSend,, {right},ahk_class Nexon.NWind
}
if(갈X<X좌표){
ControlSend,, {Left},ahk_class Nexon.NWind
}
guicontrol, 2:text,가야할X, 갈X %갈X%
guicontrol, 2:text,가야할Y, 갈Y %갈Y%
guicontrol, 2:text,현X, 현X %X좌표%
guicontrol, 2:text,현Y, 현Y %Y좌표%
guicontrol, 2:text,초기화값, 값 %초기화%
return
허풍선방지:
if(DefenseHupung=1){
Loop{
ImageSearch, x, y, 1, 1, 800, 600, *TransFFFFFF img\mob.bmp
if(ErrorLevel=0){
갈X:=17, 갈Y:=11
Gosub, 몹인식
Gosub, 버프
Gosub, 좌표
}
if(ErrorLevel=1){
break
}
}
Sleep 10000
Loop{
갈X:=16, 갈Y:=13
Gosub, 좌표
ImageSearch,x,y, 200, 1, 800 ,200, *TransFFFFFF Img\X-10.bmp
if(ErrorLevel=0){
break
}
}
}
return
바퀴카운트:
if(바퀴초기화=0){
바퀴:=바퀴+1
guicontrol,text,text2,%바퀴%바퀴
바퀴초기화=1
}
return
랜덤이동:
Cal_RandomTimer:=A_TickCount-RandomTimer
if(Cal_RandomTimer<1000){
이전X좌표=%X좌표%
이전Y좌표=%Y좌표%
}
if(Cal_RandomTimer>2500){
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
return
허풍선감지:
ImageSearch, X허, Y허, 450, 500, 800, 450, img\hu.bmp
if(ErrorLevel=0){
if(알림음=1){
soundplay img\QUERY.wav
}
if(바람종료=1){
WinActivate 바람의나라
Sleep 1000
Send {Alt down}{F4}{Alt up}
Sleep 1000
}
}
return
Pgup::
설정:
CheckA=0
CheckB=0
CheckC=0
WinActivate, 바람의나라
LoR=Left
헬Count=0
시폭Count=0
gui, submit,nohide
Time:=A_TickCount
skillTimer1:=A_TickCount
skillTimer2:=A_TickCount
RandomTimer:=A_TickCount
settimer,Timer,on
guicontrol,text,text2,0바퀴
초기화=0
바퀴=0
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
ImageSearch, X찾, Y찾, 0, 0, 1400, 1400, *transFFFFFF img\X.bmp
if(ErrorLevel=0){
checkA=1
break
}
}
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
범위Y아래:= Y찾 + 10
ImageSearch, x환찾, y환찾, 1, 1, 1400, 1400, img\HwanSearch.bmp
if(ErrorLevel=0){
checkB=1
}
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
ImageSearch, X체, Y체, 500, 500, 1400, 1400, img\체.bmp
if(ErrorLevel=0){
checkC=1
}
범위X체a:= X체 + 48
범위Y체:= Y체
범위Y마:= Y체 + 19
범위HP:=범위X체a+(100-Slider체력)
범위SP:=범위X체a+(100-Slider마력)
if(CheckA=1 and CheckB=1 and CheckC=1){
msgbox 설정이 완료되었습니다!
} else {
msgbox 설정에 실패하였습니다 설정버튼을 다시 눌러주세요`n`n만약 전체모드 사용유저라면, 게임상에서 PgUp버튼을 누르고 잠시 기다려주세요
}
return
Timer:
Sec:=Floor((A_TickCount-Time)/1000)
If Sec<60
{
guicontrol,text,text1,%Sec%초
}
else
{
Min:=Floor(Sec/60)
Sec2:=Mod(Sec,60)
guicontrol,text,text1, %Min%분 %Sec2%초
}
return
설명서:
msgbox 엔터키로 대화창열기/날씨효과/시야표시를 끄세요, 타겟이동을 3번으로 바꾸세요 `n`n방향키입력시 바로이동을 반드시 키세요 이거안키면 안움직임 ㅡㅡ`n`n반드시 이름표시-기타 를 키세요`n`n하단에 채팅쪽에있는 < 를 눌러서 마법퀵슬롯이 안보이게 하세요 `n`n 경변부, 십억경의위치는 d에 `n`n 행동력의환약/피리 위치는 i 입니다 `n`n 일시정지,다시시작은 Page down 처음부터 다시시작할려면 새로 키세요 `n`n 비영사천문은 대문자 Z`n`n http://dmcmcr.blogspot.com return
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
버전체크:
gui,3:destroy
Gui,3: Add, Text, vGUINewVer x10 y10 w200 h20 Cblue, 최신 버전 :
Gui,3: Add, Text, vGuiNowVer x10 y30 w200 h20 CRed, 현재 버전 :
Gui,3: Add, Text, vGUI300 x10 y50 w300 h20 , -
Gui,3: Add, Text, vGUI301 x10 y70 w300 h20 , -
Gui,3: Add, Text, vGUI302 x10 y90 w300 h20 , -
Gui,3: Add, Text, vGUI303 x10 y110 w300 h20 , -
Gui,3: Add, Text, vGUI304 x10 y130 w300 h20 , -
Gui,3: Add, Text, vGUI305 x10 y130 w300 h20 , -
Gui,3: Add, Text, vGUI306 x10 y130 w300 h20 , -
Gui,3: Add, Text, vGUI307 x10 y130 w300 h20 , -
Gui,3: Add, Text, vGUI308 x10 y130 w300 h20 , -
GUI,3:Show, w300 h300, 공지사항 치르치르@비류
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
guicontrol, 3:text,GuiNewVer, 최신 버전 : %Newversion%
guicontrol, 3:text,GuiNowVer, 현재 버전 : %version%
if(Version = NewVersion){
guicontrol, 3:text,GUI300, 최신버전입니다.
} else {
guicontrol, 3:text,GUI300, 최신버전이 아닙니다. 최신버전 사용을 권장합니다.
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
