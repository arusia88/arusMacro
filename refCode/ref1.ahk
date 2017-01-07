;1.출발좌표 확인
;2.목표좌표 비교
;3.이동좌표확인
;4.이동좌표 목표좌표 비교
;5.이동
;.
;.
;.
;6.완료
F1::

시작:
dx:=079
dy:=137
gosub, 최초좌표확인
msgbox, 시작x:%sx백%%sx십%%sx일%, 시작y:%sy백%%sy십%%sy일%
loop
{
gosub, 이동좌표확인
gosub, 이동
}
return

최초좌표확인:
sx백=0
sx십=0
sx일=0
sy백=0
sy십=0
sy일=0
goto, sx백찾기
sx백찾기:
loop
{
imagesearch,vx,vy,916,763,925,800, *50 img\%sx백%.bmp
if(errorlevel=0)
{
 goto, sx십찾기
}
if(errorlevel=1)
{
 sx백++
 if (sx백 = 10)
 {
  sx백=0
 }
}
}
return
sx십찾기:
loop
{
imagesearch,vx,vy,924,763,934,800, *50 img\%sx십%.bmp
if(errorlevel=0)
{
 goto, sx일찾기
}
if(errorlevel=1)
{
 sx십++
 if (sx십 = 10)
 {
  sx십:=0
 }
}
}
return
sx일찾기:
loop
{
imagesearch,vx,vy,933,763,946,800, *50 img\%sx일%.bmp
if(errorlevel=0)
{
 goto, sy백찾기
}
if(errorlevel=1)
{
 sx일++
 if (sx일 = 10)
 {
  sx일:=0
 }
}
}
return
sy백찾기:
loop
{
imagesearch,vx,vy,973,763,984,800, *50 img\%sy백%.bmp
if(errorlevel=0)
{
 goto, sy십찾기
}
if(errorlevel=1)
{
 sy백++
 if (sy백 = 10)
 {
  sy백=0
 }
}
}
return

sy십찾기:
loop
{
imagesearch,vx,vy,981,763,992,800, *50 img\%sy십%.bmp
if(errorlevel=0)
{
 goto, sy일찾기
}
if(errorlevel=1)
{
 sy십++
 if (sy십 = 10)
 {
  sy십:=0
 }
}
}
return
sy일찾기:
loop
{
imagesearch,vx,vy,989,763,1000,800, *50 img\%sy일%.bmp
if(errorlevel=0)
 {
  goto, 최초찾기완료
 }
 if(errorlevel=1)
 {
  sy일++
  if (sy일 = 10)
 {
  sy일:=0
 }
}
}
return
최초찾기완료:
sx=%sx백%%sx십%%sx일%
sy=%sy백%%sy십%%sy일%
return
이동좌표확인:
mx백=0
mx십=0
mx일=0
my백=0
my십=0
my일=0
goto, mx백찾기
mx백찾기:
loop
{
imagesearch,vx,vy,916,763,925,800, *50 img\%mx백%.bmp
if(errorlevel=0)
{
 goto, mx십찾기
}
if(errorlevel=1)
{
 mx백++
 if (mx백 = 10)
 {
  mx백=0
 }
}
}
return
mx십찾기:
loop
{
imagesearch,vx,vy,924,763,934,800, *50 img\%mx십%.bmp
if(errorlevel=0)
{
 goto, mx일찾기
}
if(errorlevel=1)
{
 mx십++
 if (mx십 = 10)
 {
  mx십:=0
 }
}
}
return
mx일찾기:
loop
{
imagesearch,vx,vy,933,763,946,800, *50 img\%mx일%.bmp
if(errorlevel=0)
{
 goto, my백찾기
}
if(errorlevel=1)
{
 mx일++
 if (mx일 = 10)
 {
  mx일:=0
 }
}
}
return
my백찾기:
loop
{
imagesearch,vx,vy,973,763,984,800, *50 img\%my백%.bmp
if(errorlevel=0)
{
 goto, my십찾기
}
if(errorlevel=1)
{
 my백++
 if (my백 = 10)
 {
  my백=0
 }
}
}
return

my십찾기:
loop
{
imagesearch,vx,vy,981,763,992,800, *50 img\%my십%.bmp
if(errorlevel=0)
{
 goto, my일찾기
}
if(errorlevel=1)
{
 my십++
 if (my십 = 10)
 {
  my십:=0
 }
}
}
return
my일찾기:
loop
{
imagesearch,vx,vy,989,763,1000,800, *50 img\%my일%.bmp
if(errorlevel=0)
{
 goto, 이동좌표
}
if(errorlevel=1)
{
 my일++
 if (my일 = 10)
 {
  my일:=0
 }
}
}
return
이동좌표:
mx=%mx백%%mx십%%mx일%
my=%my백%%my십%%my일%
return
;이동시작:
;random,A,1,2
;loop,3
;{
;if(A=1)
;{
; if(sx>dx)
; {
;  goto, 이동
; }
; else if(sx<dx)
; {
;  goto, 이동
; }
; else if(sx=dx)
; {
;  goto, 좌표비교
; }
;
;}
;if(A=2)
;{
; if(sy>dy)
; {
;  goto, 이동
; }
; else if(sy<dy)
; {
;  goto, 이동
; }
; else if(sy=dy)
; {
;  goto, 좌표비교
; }
;
;}
;}
;return
이동:
loop,3
{
 random,A,1,2
 if(A=1)
 {
  loop,3
  {
   if( mx > dx )
   {
    send,{left}
    sleep, 10
   }
   else if( mx < dx )
   {
    send,{right}
    sleep, 10
   }
   else if( mx = dx )
   {
    goto, 좌표비교
   }
  }
 }
 if(A=2)
 {
  loop,3
  {
   if( my > dy )
   {
    send,{up}
    sleep, 10
   }
   else if( my < dy )
   {
    send,{down}
    sleep, 10
   }
   else if( my = dy )
   {
    goto, 좌표비교
   }
  }
 }
}
return
좌표비교:
gosub, x비교
gosub, y비교
return
x비교:
if(mx>dx)
{
 goto,이동
}
else if(mx<dx)
{
 goto,이동
}
else if(mx=dx)
{
 return
}
y비교:
if(my>dy)
{
 goto,이동
}
else if(my<dy)
{
 goto,이동
}
else if(my=dy)
{
 return
}

f2::
exitapp
