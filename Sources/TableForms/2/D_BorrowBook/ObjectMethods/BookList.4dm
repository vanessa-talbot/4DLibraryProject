C_LONGINT:C283($n)

$n:=Records in set:C195("$highlightedBooks")
If ($n#0)
	
	COPY SET:C600("$highlightedBooks";"$TempHighlighted")
	CUT NAMED SELECTION:C334([Books:1];"foundBooks")
	
	USE SET:C118("$highlightedBooks")
	SELECTION TO ARRAY:C260([Books:1]id:1;<>_borrowedBooksIDs)
	
	USE NAMED SELECTION:C332("foundBooks")
	COPY SET:C600("$TempHighlighted";"$highlightedBooks")
	
	OBJECT SET ENABLED:C1123(*;"btnOK";True:C214)
	
Else 
	
	<>bookID:=0
	ARRAY LONGINT:C221(<>_borrowedBooksIDs;0)
	OBJECT SET ENABLED:C1123(*;"btnOK";False:C215)
	
End if 