Case of 
	: (Form event:C388=On Load:K2:1)
		
		If (Record number:C243([Students:3])=New record:K29:1)
			GOTO OBJECT:C206(*;"LastName")
		End if 
		
		OBJECT SET ENABLED:C1123(*;"bDeleteLoan";False:C215)
		
End case 

