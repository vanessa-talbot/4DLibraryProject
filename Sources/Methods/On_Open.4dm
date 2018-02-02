//%attributes = {}

If (Records in table:C83([Books:1])=0) & (Records in table:C83([Students:3])=0)
	C_OBJECT:C1216($oParam)
	C_TIME:C306($winRef)
	$oParam:=New object:C1471("message";"Your database is emty."+Char:C90(Carriage return:K15:38)+"Do you want to import some sample data ?";"textOK";"Yes please !";"textCancel";"No Thank's")
	$winRef:=Open form window:C675("WarningDialog";Modal form dialog box:K39:7)
	DIALOG:C40("WarningDialog";$oParam)
	
	If (ok=1)
		Tool_ImportSampleData 
	End if 
End if 


M_ManageStudents 

DELAY PROCESS:C323(Current process:C322;10)
M_ManageBooks 
