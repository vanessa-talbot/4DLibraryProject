If (Records in set:C195("$highlightedLoans")>0)
	USE SET:C118("$highlightedLoans")
	DELETE SELECTION:C66([Loans:2])
	
	QUERY:C277([Loans:2];[Loans:2]student_Id:2=[Students:3]id:1)
	ORDER BY:C49([Loans:2];[Loans:2]borrowDate:3;>)
	
End if 