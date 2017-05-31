gui, add, edit, w400 vFile,
gui, add, button, w100 gOpen x+10,Open File
gui, add, edit, r40 w510 vOutput xm
gui, show
Open:
gui, submit, nohide
BinRead(file,data)
Bin2Hex(h,data,res)
guicontrol,,output,%h%
return
Bin2Hex(ByRef h, ByRef b, n=0)      ; n bytes binary data -> stream of 2-digit hex
{                                   ; n = 0: all (SetCapacity can be larger than used!)
   format = %A_FormatInteger%       ; save original integer format
   SetFormat Integer, Hex           ; for converting bytes to hex
   m := VarSetCapacity(b)
   If (n < 1 or n > m)
       n := m
   Address := &b
   h =
   Loop %n%
   {
      x := *Address                 ; get byte in hex
      StringTrimLeft x, x, 2        ; remove 0x
      x = 0%x%                      ; pad left
      StringRight x, x, 2           ; 2 hex digits
      h = %h%%x%
      Address++
   }
   SetFormat Integer, %format%      ; restore original format
}
BinRead(file, ByRef data, n=0, offset=0)
{
   h := DllCall("CreateFile","Str",file,"Uint",0x80000000,"Uint",3,"UInt",0,"UInt",3,"Uint",0,"UInt",0)
   IfEqual h,-1, SetEnv, ErrorLevel, -1
   IfNotEqual ErrorLevel,0,Return,0 ; couldn't open the file
   m = 0                            ; seek to offset
   IfLess offset,0, SetEnv,m,2
   r := DllCall("SetFilePointerEx","Uint",h,"Int64",offset,"UInt *",p,"Int",m)
   IfEqual r,0, SetEnv, ErrorLevel, -3
   IfNotEqual ErrorLevel,0, {
      t = %ErrorLevel%              ; save ErrorLevel to be returned
      DllCall("CloseHandle", "Uint", h)
      ErrorLevel = %t%              ; return seek error
      Return 0
   }
   m := DllCall("GetFileSize","UInt",h,"Int64 *",r)
   If (n < 1 or n > m)
       n := m
   Granted := VarSetCapacity(data, n, 0)
   IfLess Granted,%n%, {
      ErrorLevel = Mem=%Granted%
      Return 0
   }
   result := DllCall("ReadFile","UInt",h,"Str",data,"UInt",n,"UInt *",Read,"UInt",0)
   if (!result or Read < n)
       t = -3
   IfNotEqual ErrorLevel,0, SetEnv,t,%ErrorLevel%
   h := DllCall("CloseHandle", "Uint", h)
   IfEqual h,-1, SetEnv, ErrorLevel, -2
   IfNotEqual t,,SetEnv, ErrorLevel, %t%-%ErrorLevel%
   Return Read
}