//%attributes = {}

C_LONGINT:C283(<>PS_Books)

If (<>PS_Books=0)
	  // process not lauched yet
	<>PS_Books:=New process:C317("P_ManageBooks";64000;"P_ManageBooks";0)
Else 
	BRING TO FRONT:C326(<>PS_Books)
End if 
