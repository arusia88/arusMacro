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