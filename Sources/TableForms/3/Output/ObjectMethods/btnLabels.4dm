CREATE SET:C116([Students:3];"$tempostudents")

If (Records in set:C195("$highlightedStudents")>0)
	C_OBJECT:C1216($oParam)
	C_TIME:C306($winRef)
	$oParam:=New object:C1471("message";"Print all students in list or only highlighted ones ?";"textOK";"Highlighted";"textCancel";"All")
	$winRef:=Open form window:C675("WarningDialog";Sheet form window:K39:12)
	DIALOG:C40("WarningDialog";$oParam)
	
	If (ok=1)
		USE SET:C118("$highlightedStudents")
	End if 
End if 

PRINT LABEL:C39([Students:3];Char:C90(1))

USE SET:C118("$tempostudents")
StudentsReOrder 
