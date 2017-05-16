BinRead(file, ByRef data, n=0, offset=0)
{
   h := DllCall("CreateFile","Str",file,"Uint",0x80000000,"Uint",3,"UInt",0,"UInt",3,"Uint",0,"UInt",0)
   IfEqual h,-1, SetEnv, ErrorLevel, -1
   IfNotEqual ErrorLevel,0,Return,0
   m = 0
   IfLess offset,0, SetEnv,m,2
   r := DllCall("SetFilePointerEx","Uint",h,"Int64",offset,"UInt *",p,"Int",m)
   IfEqual r,0, SetEnv, ErrorLevel, -3
   IfNotEqual ErrorLevel,0, {
      t = %ErrorLevel%
      DllCall("CloseHandle", "Uint", h)
      ErrorLevel = %t%
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