C_LONGINT:C283($n)

$n:=Records in set:C195("$highlightedBooks")
If ($n>0)
	C_OBJECT:C1216($oParam)
	C_TIME:C306($winRef)
	$oParam:=New object:C1471("message";"Do you really want to delete "+String:C10($n)+" records ?";"textOK";"OK";"textCancel";"Cancel")
	$winRef:=Open form window:C675("WarningDialog";Sheet form window:K39:12)
	DIALOG:C40("WarningDialog";$oParam)
	
	If (ok=1)
		  // create a local ($) set for the current selection of books
		CREATE SET:C116([Books:1];"$tempoBooks")
		  // use the hightlight set definded for the listbox
		USE SET:C118("$highlightedBooks")
		  // delete selected records
		DELETE SELECTION:C66([Books:1])
		  // reuse the local set (deleted records will not appear anymore)
		USE SET:C118("$tempoBooks")
		  // reorder the selection (sets are NOT sorted)
		BooksReOrder 
	End if 
Else 
	  // the button should be disabled !
End if 


