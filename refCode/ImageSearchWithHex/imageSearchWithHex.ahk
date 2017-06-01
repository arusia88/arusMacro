#SingleInstance, Force
#NoEnv
SetBatchLines, -1
HayStack=SampleWindow
CF_DIB = 8
imageHex =
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
imageLen := Hex2Bin(image, imageHex)
SetClipboardData(CF_DIB, image, imageLen)
If !pToken := Gdip_Startup()
{
   MsgBox, 48, gdiplus error!, Gdiplus failed to start. Please ensure you have gdiplus on your system
   ExitApp
}
OnExit, Exit
WinGet, hwndHay, ID, %HayStack%
pBitmapHayStack := Gdip_BitmapFromHWND(hwndHay)
pBitmapNeedle := Gdip_CreateBitmapFromClipboard()
Width1 := Gdip_GetImageWidth(pBitmapHayStack), Height1 := Gdip_GetImageHeight(pBitmapHayStack)
Width2 := Gdip_GetImageWidth(pBitmapNeedle), Height2 := Gdip_GetImageHeight(pBitmapNeedle)
E1 := Gdip_LockBits(pBitmapHayStack, 0, 0, Width1, Height1, Stride1, Scan01)
E2 := Gdip_LockBits(pBitmapNeedle, 0, 0, Width2, Height2, Stride2, Scan02)
MCode(Gdip_ImageSearch, "83EC148B4424309983E20303C28BC88B442434995383E2035503C2C1F80256C1F902837C24"
. "30005789442420C7442410000000000F8EBE0000008B5C24288B7C24388D048D00000000894424188B442430895C241CE"
. "B098DA424000000008BFFC74424440000000085C07E6D895C24148B6C242CC7442440000000008D6424008B4C24403B4C"
. "243C0F8D8600000033C985FF7E158BD58BF38B063B02751F4183C20483C6043BCF7CEF8B442420035C2418FF44244003C"
. "003C003E8EBC38B4C24448B5C24148B4424304183C3043BC8894C2444895C24147C978B4C24108B5C241C035C2418413B"
. "4C2434894C2410895C241C0F8C68FFFFFF8B5424488B44244C5F5E5DC702FFFFFFFFC700FFFFFFFF5B83C414C38B4C244"
. "48B5424488B44244C5F495E890A8B4C24085D89085B83C414C3")
VarSetCapacity(x, 8, 0), VarSetCapacity(y, 8, 0)
Loop, 5
   DllCall(&Gdip_ImageSearch, "uint", Scan01, "uint", Scan02, "int", Width1, "int", Height1, "int", Width2, "int", Height2, "int", Stride1, "int", Stride2, "int*", x, "int*", y)
MsgBox, %x%`n%y%
Gdip_UnlockBits(pBitmapHayStack), Gdip_UnlockBits(pBitmapNeedle)
Gdip_DisposeImage(pBitmapHayStack), Gdip_DisposeImage(pBitmapNeedle)
return

MCode(ByRef code, hex)
{
   VarSetCapacity(code, StrLen(hex)//2)
   Loop % StrLen(hex)//2      ;%
      NumPut("0x" SubStr(hex, 2*A_Index-1, 2), code, A_Index-1, "char")
}
Exit:
Gdip_Shutdown(pToken)
ExitApp
return
CreateRect(ByRef Rect, x, y, w, h)
{
   VarSetCapacity(Rect, 16)
   NumPut(x, Rect, 0, "uint"), NumPut(y, Rect, 4, "uint"), NumPut(w, Rect, 8, "uint"), NumPut(h, Rect, 12, "uint")
}
Gdip_LockBits(pBitmap, x, y, w, h, ByRef Stride, ByRef Scan0, LockMode = 3, PixelFormat = 0x26200a)
{
   CreateRect(Rect, x, y, w, h)
   VarSetCapacity(BitmapData, 21, 0)
   E := DllCall("GdiplusGdipBitmapLockBits", "uint", pBitmap, "uint", &Rect, "uint", LockMode, "int", PixelFormat, "uint", &BitmapData)
   Stride := NumGet(BitmapData, 8)
   Scan0 := NumGet(BitmapData, 16)
   return E
}

Gdip_UnlockBits(pBitmap)
{
   return DllCall("GdiplusGdipBitmapUnlockBits", "uint", pBitmap, "uint", &BitmapData)
}
Gdip_Startup()
{
 if !DllCall("GetModuleHandle", "str", "gdiplus")
  DllCall("LoadLibrary", "str", "gdiplus")
 VarSetCapacity(si, 16, 0), si := Chr(1)
 DllCall("gdiplusGdiplusStartup", "uint*", pToken, "uint", &si, "uint", 0)
 return pToken
}
Gdip_Shutdown(pToken)
{
 DllCall("gdiplusGdiplusShutdown", "uint", pToken)
 if hModule := DllCall("GetModuleHandle", "str", "gdiplus")
  DllCall("FreeLibrary", "uint", hModule)
 return 0
}

Gdip_CreateBitmapFromFile(sFile, IconNumber=1, IconSize="")
{
 SplitPath, sFile,,, ext
 if ext in exe,dll
 {
  Sizes := IconSize ? IconSize : 256 "|" 128 "|" 64 "|" 48 "|" 32 "|" 16
  VarSetCapacity(buf, 40)
  Loop, Parse, Sizes, |
  {
   DllCall("PrivateExtractIcons", "str", sFile, "int", IconNumber-1, "int", A_LoopField, "int", A_LoopField, "uint*", hIcon, "uint*", 0, "uint", 1, "uint", 0)
   if !hIcon
    continue
   if !DllCall("GetIconInfo", "uint", hIcon, "uint", &buf)
   {
    DestroyIcon(hIcon)
    continue
   }
   hbmColor := NumGet(buf, 16)
   hbmMask  := NumGet(buf, 12)
   if !(hbmColor && DllCall("GetObject", "uint", hbmColor, "int", 24, "uint", &buf))
   {
    DestroyIcon(hIcon)
    continue
   }
   break
  }
  if !hIcon
   return -1
  Width := NumGet(buf, 4, "int"),  Height := NumGet(buf, 8, "int")
  hbm := CreateDIBSection(Width, -Height), hdc := CreateCompatibleDC(), obm := SelectObject(hdc, hbm)
  if !DllCall("DrawIconEx", "uint", hdc, "int", 0, "int", 0, "uint", hIcon, "uint", Width, "uint", Height, "uint", 0, "uint", 0, "uint", 3)
  {
   DestroyIcon(hIcon)
   return -2
  }
  VarSetCapacity(dib, 84)
  DllCall("GetObject", "uint", hbm, "int", 84, "uint", &dib)
  Stride := NumGet(dib, 12), Bits := NumGet(dib, 20)
  DllCall("gdiplusGdipCreateBitmapFromScan0", "int", Width, "int", Height, "int", Stride, "int", 0x26200A, "uint", Bits, "uint*", pBitmapOld)
  pBitmap := Gdip_CreateBitmap(Width, Height), G := Gdip_GraphicsFromImage(pBitmap)
  Gdip_DrawImage(G, pBitmapOld, 0, 0, Width, Height, 0, 0, Width, Height)
  SelectObject(hdc, obm), DeleteObject(hbm), DeleteDC(hdc)
  Gdip_DeleteGraphics(G), Gdip_DisposeImage(pBitmapOld)
  DestroyIcon(hIcon)
 }
 else
 {
  if !A_IsUnicode
  {
   VarSetCapacity(wFile, 1023)
   DllCall("kernel32MultiByteToWideChar", "uint", 0, "uint", 0, "uint", &sFile, "int", -1, "uint", &wFile, "int", 512)
   DllCall("gdiplusGdipCreateBitmapFromFile", "uint", &wFile, "uint*", pBitmap)
  }
  else
   DllCall("gdiplusGdipCreateBitmapFromFile", "uint", &sFile, "uint*", pBitmap)
 }
 return pBitmap
}
Gdip_GetImageWidth(pBitmap)
{
   DllCall("gdiplusGdipGetImageWidth", "uint", pBitmap, "uint*", Width)
   return Width
}
Gdip_GetImageHeight(pBitmap)
{
   DllCall("gdiplusGdipGetImageHeight", "uint", pBitmap, "uint*", Height)
   return Height
}
Gdip_DisposeImage(pBitmap)
{
   return DllCall("gdiplusGdipDisposeImage", "uint", pBitmap)
}
Gdip_BitmapFromHWND(hwnd)
{
 WinGetPos,,, Width, Height, ahk_id %hwnd%
 hbm := CreateDIBSection(Width, Height), hdc := CreateCompatibleDC(), obm := SelectObject(hdc, hbm)
 PrintWindow(hwnd, hdc)
 pBitmap := Gdip_CreateBitmapFromHBITMAP(hbm)
 SelectObject(hdc, obm), DeleteObject(hbm), DeleteDC(hdc)
 return pBitmap
}
DestroyIcon(hIcon)
{
   return DllCall("DestroyIcon", "uint", hIcon)
}
CreateDIBSection(w, h, hdc="", bpp=32, ByRef ppvBits=0)
{
 hdc2 := hdc ? hdc : GetDC()
 VarSetCapacity(bi, 40, 0)
 NumPut(w, bi, 4), NumPut(h, bi, 8), NumPut(40, bi, 0), NumPut(1, bi, 12, "ushort"), NumPut(0, bi, 16), NumPut(bpp, bi, 14, "ushort")
 hbm := DllCall("CreateDIBSection", "uint" , hdc2, "uint" , &bi, "uint" , 0, "uint*", ppvBits, "uint" , 0, "uint" , 0)
 if !hdc
  ReleaseDC(hdc2)
 return hbm
}
CreateCompatibleDC(hdc=0)
{
   return DllCall("CreateCompatibleDC", "uint", hdc)
}
Gdip_CreateBitmap(Width, Height, Format=0x26200A)
{
    DllCall("gdiplusGdipCreateBitmapFromScan0", "int", Width, "int", Height, "int", 0, "int", Format, "uint", 0, "uint*", pBitmap)
    Return pBitmap
}
Gdip_GraphicsFromImage(pBitmap)
{
    DllCall("gdiplusGdipGetImageGraphicsContext", "uint", pBitmap, "uint*", pGraphics)
    return pGraphics
}
Gdip_DrawImage(pGraphics, pBitmap, dx="", dy="", dw="", dh="", sx="", sy="", sw="", sh="", Matrix=1)
{
 if (Matrix&1 = "")
  ImageAttr := Gdip_SetImageAttributesColorMatrix(Matrix)
 else if (Matrix != 1)
  ImageAttr := Gdip_SetImageAttributesColorMatrix("1|0|0|0|0|0|1|0|0|0|0|0|1|0|0|0|0|0|" Matrix "|0|0|0|0|0|1")
 if (sx = "" && sy = "" && sw = "" && sh = "")
 {
  if (dx = "" && dy = "" && dw = "" && dh = "")
  {
   sx := dx := 0, sy := dy := 0
   sw := dw := Gdip_GetImageWidth(pBitmap)
   sh := dh := Gdip_GetImageHeight(pBitmap)
  }
  else
  {
   sx := sy := 0
   sw := Gdip_GetImageWidth(pBitmap)
   sh := Gdip_GetImageHeight(pBitmap)
  }
 }
 E := DllCall("gdiplusGdipDrawImageRectRect", "uint", pGraphics, "uint", pBitmap
 , "float", dx, "float", dy, "float", dw, "float", dh
 , "float", sx, "float", sy, "float", sw, "float", sh
 , "int", 2, "uint", ImageAttr, "uint", 0, "uint", 0)
 if ImageAttr
  Gdip_DisposeImageAttributes(ImageAttr)
 return E
}
SelectObject(hdc, hgdiobj)
{
   return DllCall("SelectObject", "uint", hdc, "uint", hgdiobj)
}
DeleteObject(hObject)
{
   return DllCall("DeleteObject", "uint", hObject)
}
GetDC(hwnd=0)
{
 return DllCall("GetDC", "uint", hwnd)
}
DeleteDC(hdc)
{
   return DllCall("DeleteDC", "uint", hdc)
}
Gdip_DeleteGraphics(pGraphics)
{
   return DllCall("gdiplusGdipDeleteGraphics", "uint", pGraphics)
}
Gdip_DisposeImageAttributes(ImageAttr)
{
 return DllCall("gdiplusGdipDisposeImageAttributes", "uint", ImageAttr)
}
PrintWindow(hwnd, hdc, Flags=0)
{
 return DllCall("PrintWindow", "uint", hwnd, "uint", hdc, "uint", Flags)
}
ReleaseDC(hdc, hwnd=0)
{
   return DllCall("ReleaseDC", "uint", hwnd, "uint", hdc)
}
Gdip_SetImageAttributesColorMatrix(Matrix)
{
 VarSetCapacity(ColourMatrix, 100, 0)
 Matrix := RegExReplace(RegExReplace(Matrix, "^[^d-.]+([d.])", "$1", "", 1), "[^d-.]+", "|")
 StringSplit, Matrix, Matrix, |
 Loop, 25
 {
  Matrix := (Matrix%A_Index% != "") ? Matrix%A_Index% : Mod(A_Index-1, 6) ? 0 : 1
  NumPut(Matrix, ColourMatrix, (A_Index-1)*4, "float")
 }
 DllCall("gdiplusGdipCreateImageAttributes", "uint*", ImageAttr)
 DllCall("gdiplusGdipSetImageAttributesColorMatrix", "uint", ImageAttr, "int", 1, "int", 1, "uint", &ColourMatrix, "int", 0, "int", 0)
 return ImageAttr
}
Gdip_CreateBitmapFromHBITMAP(hBitmap, Palette=0)
{
 DllCall("gdiplusGdipCreateBitmapFromHBITMAP", "uint", hBitmap, "uint", Palette, "uint*", pBitmap)
 return pBitmap
}

Gdip_CreateBitmapFromClipboard()
{
 if !DllCall("OpenClipboard", "uint", 0)
  return -1
 if !DllCall("IsClipboardFormatAvailable", "uint", 8)
  return -2
 if !hBitmap := DllCall("GetClipboardData", "uint", 2)
  return -3
 if !pBitmap := Gdip_CreateBitmapFromHBITMAP(hBitmap)
  return -4
 if !DllCall("CloseClipboard")
  return -5
 DeleteObject(hBitmap)
 return pBitmap
}


Hex2Bin(ByRef @bin, ByRef @hex, _byteNb=0)
{
 local l, data, granted, dataAddress
 If (_byteNb < 1 or _byteNb > dataSize)
 {
  ; Get size of data
  l := StrLen(@hex)
  _byteNb := l // 2
  if (l = 0 or _byteNb * 2 != l)
  {
   ; Invalid string, empty or odd number of digits
   ErrorLevel = Param
   Return -1
  }
 }
 ; Make enough room
 granted := VarSetCapacity(@bin, _byteNb, 0)
 if (granted < _byteNb)
 {
  ; Cannot allocate enough memory
  ErrorLevel = Mem=%granted%
  Return -1
 }
 data := RegExReplace(@hex, "..", "0x$0!")
 StringLeft data, data, _byteNb * 5
 dataAddress := &@bin
 Loop Parse, data, !
 {
  ; Store integer in memory
  DllCall("RtlFillMemory"
    , "UInt", dataAddress++
    , "UInt", 1
    , "UChar", A_LoopField)
 }
 Return _byteNb
}
SetClipboardData(_format, ByRef @data, _dataSize=0, _bEmptyClipboard=true)
{
   local res, mem, str, cfFormat, errorCode
   errorCode = 0
   If (_dataSize = 0)
   {
      ; Assume it is a simple string; otherwise, should provide real length...
      _dataSize := StrLen(@data)
      If (_dataSize = 0)
      {
         errorCode = SIZE
         Goto SCD_End
      }
   }
   ; Open the clipboard, and empty it.
   res := DllCall("OpenClipboard", "UInt", 0)
   If (res = 0)
   {
      errorCode = OC
      Goto SCD_End
   }
   If (_bEmptyClipboard)
   {
      DllCall("EmptyClipboard")
   }
   ; Allocate a global memory object for the text
   mem := DllCall("GlobalAlloc"
         , "UInt", 2 ; GMEM_MOVEABLE
         , "UInt", _dataSize + 1) ; +1 in case it is a zero-terminated string
   If (mem = 0)
   {
      errorCode = GA
      Goto SCD_End
   }
   ; Lock the handle and copy the text to the buffer
   str := DllCall("GlobalLock", "UInt", mem)
   ; str is a pointer to a memory area, so is treated as UInt
   DllCall("RtlMoveMemory"
         , "UInt", str
         , "Str", @data
         , "UInt",_dataSize)
   ; In case it is a zero-terminated string, we put the final zero
   DllCall("RtlZeroMemory", "UInt", str + _dataSize, "UInt", 1)
   DllCall("GlobalUnlock", "UInt", mem)
   ; Handle format
   If _format is integer
   {
      cfFormat := _format
   }
   Else
   {
      cfFormat := DllCall("RegisterClipboardFormat", "Str", _format)
      If (cfFormat = 0)
      {
         errorCode = RCF
         Goto SCD_End
      }
   }
   ; Place the handle on the clipboard
   res := DllCall("SetClipboardData"
         , "UInt", cfFormat
         , "UInt", mem)
   If (res = 0)
   {
      errorCode = SCD
      Goto SCD_End
   }
SCD_End:
   If errorCode != 0
   {
      errorCode = %errorCode%  (%A_LastError%)
   }
   ; Close the clipboard
   DllCall("CloseClipboard")
   ErrorLevel := errorCode
}
