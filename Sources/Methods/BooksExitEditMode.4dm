//%attributes = {}
C_BOOLEAN:C305($1)
C_BOOLEAN:C305($saveRecord)
If (Count parameters:C259=1)
	$saveRecord:=$1
	If ($saveRecord)
		SAVE RECORD:C53([Books:1])
	End if 
Else 
	If (Modified record:C314([Books:1]))
		C_OBJECT:C1216($oParam)
		C_TIME:C306($winRef)
		$oParam:=New object:C1471("message";"This book has been edited. Do you want to save the modifications ?";"textOK";"Save";"textCancel";"Cancel")
		$winRef:=Open form window:C675("WarningDialog";Sheet form window:K39:12)
		DIALOG:C40("WarningDialog";$oParam)
		
		If (ok=1)
			SAVE RECORD:C53([Books:1])
		End if 
	End if 
End if 

<>booksEditMode:=False:C215
BooksReOrder 
BookGotoHighLighted 
BooksSetInterface 