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