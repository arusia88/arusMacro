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