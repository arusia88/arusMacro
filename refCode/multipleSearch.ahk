^s::
SetBatchLines,-1
CoordMode,Pixel,Screen
CoordMode,ToolTip,Screen
result:=MultipleImagesearch(1,1,1024,768,"Position\Img\0.bmp")
Loop,Parse,result,`n
{
If A_LoopField=
Break


StringSplit,Pos,A_LoopField,a
ToolTip,%A_Index%,%Pos1%,%Pos2%,%A_Index%
}
return



MultipleImagesearch(xs,ys,xl,yl,image)
{
pos=
xss:=xs
yss:=ys


loop
{
Imagesearch,x,yi,%xss%,%yss%,%xl%,%yl%,%image%
If Errorlevel=1
Break


pos=%pos%%x%a%yi%`n
loop
{
xss:=x+1
If xss=%xl%
Break


Imagesearch,x,y,%xss%,%yss%,%xl%,%yl%,%image%
If Errorlevel=1
Break


pos=%pos%%x%a%y%`n
}
xss:=xs
yss:=yi+1
If yss=%yl%
Break
}
Sort,pos,u
return pos
}
