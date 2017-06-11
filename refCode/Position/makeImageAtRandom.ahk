
Gui 1:+LastFound
GUI1:=WinExist() , hDC:=DllCall("GetDC",UInt,Gui1)
Gui, Add, Text, x100 y100 vPic Hidden w20 h17 0xE hwndhPic
Gui, Add, Button, x10 y270 gBt, Move
Gui, Add, Text, x160 y275 w120 vPos
GoSub, LoadBitmap1
hBMP := DllCall( "CreateDIBitmap", UInt,hDC, UInt,(bmiHAddr:=&BMP+14)
       ,UInt,(CBM_INIT:=4), UInt,&BMP+NumGet(BMP,10), UInt,&BMP+14, UInt,(DIB_PAL_COLORS:=1) )
SendMessage, (STM_SETIMAGE:=0x172), (IMAGE_BITMAP:=0x0), hBMP,, ahk_id %hPic%
Gui, Show, w300 h300, SampleWindow
hwnd := WinExist()
Gosub,Bt
GuiControl, Show, Pic
Return
Bt:
Random, X, 20, 260
Random, Y, 20, 240
GuiControl, Move, Pic, x%X% y%Y%
ClientToWin(hwnd, X, Y)
GuiControl, , Pos, x:%X% y:%Y%
return
LoadBitmap1:
BMPH =
( Join
424d3204000000000000360000002800000014000000110000
000100180000000000fc030000000000000000000000000000
00000000ffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffff0000ff0000ff0000ffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffff0000ff0000ff0000ff0000ff00
00ff0000ff0000ffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffff0000ff
0000ff0000ff0000ff0000ff0000ff0000ffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffff0000ff0000ff0000ff0000ff0000ff0000ff0000ff
0000ff0000ffffffffffffffffffffffffffffffffffffffff
ffffffffffffff0000ff0000ffffffffff0000ff0000ff0000
ff0000ff0000ff0000ff0000ff0000ffffffffffffffffffff
ffffffffffffffffffffff0000ff0000ff0000ff0000ffffff
ffffffffffffffff0000ff0000ff0000ff0000ff0000ff0000
ffffffffffffffffffffffffffffffffffffffffff0000ff00
00ff0000ff0000ff0000ffffffffffffffff0000ff0000ff00
00ff0000ff0000ffffffffffffffffffffffffffffffffffff
ffffff0000ff0000ff0000ff0000ff0000ff0000ffffffffff
ffffffffffff0000ff0000ff0000ff0000ffffffffffffffff
ffffffffffffffffffffffffff0000ff0000ff0000ff0000ff
0000ff0000ff0000ff0000ffffffffff0000ff0000ffffffff
ffffffffffffffffffffffffffffffffffffffffffffff0000
ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff0000ff
ffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffff0000ff0000ff0000ff0000ff0000
ff0000ff0000ffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffff0000ff00
00ff0000ff0000ff0000ff0000ff0000ffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffff0000ff0000ff0000ffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffff
)
nSize := StrLen(BMPH)//2
VarSetCapacity( BMP,nSize )
Loop % nSize
  NumPut( "0x" . SubStr(BMPH,2*A_Index-1,2), BMP, A_Index-1, "Char" )
BMPH= ; empty it
Return
ClientToWin(hwnd, ByRef x, ByRef y)
{
    VarSetCapacity(pt, 8)
    NumPut(x, pt, 0)
    NumPut(y, pt, 4)
    DllCall("ClientToScreen", "uint", hwnd, "uint", &pt)
    WinGetPos, wx, wy,,, ahk_id %hwnd%
    x := NumGet(pt, 0, "int") - wx
    y := NumGet(pt, 4, "int") - wy
}
GuiClose:
ExitApp




