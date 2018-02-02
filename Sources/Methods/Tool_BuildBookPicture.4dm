//%attributes = {}
C_TEXT:C284($1;$2)
C_PICTURE:C286($0)

C_TEXT:C284($author;$title)
C_TEXT:C284($bookRef)
C_TEXT:C284($rect)
C_TEXT:C284($font)

C_LONGINT:C283($margin)
C_LONGINT:C283($width;$height)

C_TEXT:C284($foregroundColor;$backgroundColor)
C_TEXT:C284($text)

$author:=$1
$title:=$2

ARRAY TEXT:C222($_fonts;3)
$_fonts{1}:="Arial"
$_fonts{2}:="Times New Romand"
$_fonts{3}:="Verdana"

ARRAY TEXT:C222($_foregroundColor;3)
$_foregroundColor{1}:="rgb(200,20,10)"
$_foregroundColor{2}:="rgb(10,120,10)"
$_foregroundColor{3}:="rgb(20,10,200)"

$width:=400
$height:=600
$bookRef:=SVG_New ($width;$height)

$margin:=10
$foregroundColor:="rgb("+String:C10(180+(Random:C100%30))+","+String:C10(180+(Random:C100%30))+","+String:C10(180+(Random:C100%30))+")"
$backgroundColor:=$foregroundColor
$rect:=SVG_New_rect ($bookRef;$margin;$margin;$width-(2*$margin);$height-(2*$margin);0;0;$foregroundColor;$backgroundColor;0)

$foregroundColor:=$_foregroundColor{Random:C100%3+1}
$backgroundColor:="rgb("+String:C10(220+(Random:C100%30))+","+String:C10(220+(Random:C100%30))+","+String:C10(220+(Random:C100%30))+")"

$margin:=30+(Random:C100%10)
$rect:=SVG_New_rect ($bookRef;$margin;$margin;($width-(2*$margin));($height-(2*$margin));0;0;$foregroundColor;$backgroundColor;Random:C100%4+3)


$margin:=60
$font:=$_fonts{1+(Random:C100%3)}
$text:=SVG_New_textArea ($bookRef;$title;$margin;2*$margin;400-(2*$margin);400;$font;30+(Random:C100%10);Plain:K14:1;3)

$margin:=60
$text:=SVG_New_textArea ($bookRef;$author;$margin;400;400-(2*$margin);400;$font;20+(Random:C100%10);Plain:K14:1;3)

$0:=SVG_Export_to_picture ($bookRef)

