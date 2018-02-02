If (Records in set:C195("$highlightedLoans")>0)
	OBJECT SET ENABLED:C1123(*;"bDeleteLoan";True:C214)
Else 
	OBJECT SET ENABLED:C1123(*;"bDeleteLoan";False:C215)
End if 
