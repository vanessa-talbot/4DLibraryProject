
CREATE SET:C116([Books:1];"$tempoBooks")

If (Records in set:C195("$highlightedBooks")>0)
	C_OBJECT:C1216($oParam)
	C_TIME:C306($winRef)
	$oParam:=New object:C1471("message";"Print all books in list or only highlighted ones ?";"textOK";"Highlighted";"textCancel";"All")
	$winRef:=Open form window:C675("WarningDialog";Sheet form window:K39:12)
	DIALOG:C40("WarningDialog";$oParam)
	
	If (ok=1)
		USE SET:C118("$highlightedBooks")
	End if 
End if 
FORM SET OUTPUT:C54([Books:1];"PrintedList")
PRINT SELECTION:C60([Books:1])

USE SET:C118("$tempoBooks")
BooksReOrder 
