#Include, MLib\Gdip_All.ahk
#Include, MLib\Gdip_ImageSearch.ahk
#Include, MLib\Bin2Hex.ahk
#Include, MLib\BinRead.ahk
#Include, MLib\Hex2Bin.ahk
#Include, convertImgToPos.ahk

#SingleInstance, Force
#NoEnv
number = 0
F1::
SetKeyDelay, -1
SetWinDelay,-1
SetBatchLines,-1
SetControlDelay,-1
CoordMode, Pixel, SCreen

WinGetPos, findSelfX, findSelfY, findSelfWidth, findSelfHeight, 바람의나라
ImageSearch, X찾, Y찾, findSelfX+880, findSelfY+750, findSelfX+findSelfWidth, findSelfY+findSelfHeight, *transFFFFFF Img\X.bmp
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
return
; F2::
; StartTime:=A_TickCount
; ;#########################################################################################아래부분을 Code()로 구현 하시면 됩니다.
; X := convertImgToPos(범위X십a, 범위Y위)
; EndTime:=A_TickCount
; ResultTime:=EndTime - StartTime
; Msgbox, result = %ret% pos=%X% , Time=%ResultTime%
; ;#########################################################################################


; return

k:=1
value:=3
F3::
gdipToken := Gdip_Startup()
PosX := X찾-516
PosY := Y찾-736
string = %PosX%|%PosY%|72|17
MsgBox, %string%
pBitmap:=Gdip_BitmapFromScreen(string)
ret := Gdip_SaveBitmapToFile(pBitmap, "pos.bmp")
file = expected.bmp

BinRead(file, data)
Bin2Hex(resultHex,data,res)

; MsgBox, result : %resultHex%
; FileAppend, 자리 : %k% 값 : %value% 캡쳐 hex : %resultHex% `r, Test.txt
value += 1


Return