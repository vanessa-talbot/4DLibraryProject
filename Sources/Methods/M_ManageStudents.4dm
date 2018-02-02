//%attributes = {}
  // This method is pseudo recursive
  // It calls itself as a new process (with a parameter to create the new process)

C_LONGINT:C283(<>PS_Students)

If (<>PS_Students=0)
	  // process not lauched yet
	<>PS_Students:=New process:C317("P_ManageStudents";64000;"P_ManageStudents";0)
Else 
	BRING TO FRONT:C326(<>PS_Students)
End if 
