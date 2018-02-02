C_LONGINT:C283($win)
C_LONGINT:C283($i;$n)

$win:=Open form window:C675([Loans:2];"D_BorrowBook";Sheet form window:K39:12)
DIALOG:C40([Loans:2];"D_BorrowBook")

$n:=Size of array:C274(<>_borrowedBooksIDs)
If (ok=1) & ($n>0)
	
	For ($i;1;$n)
		CREATE RECORD:C68([Loans:2])
		[Loans:2]book_Id:1:=<>_borrowedBooksIDs{$i}
		[Loans:2]student_Id:2:=[Students:3]id:1
		[Loans:2]borrowDate:3:=Current date:C33
		[Loans:2]returnDate:4:=Add to date:C393([Loans:2]borrowDate:3;0;0;21)  // 21 days = 3 weeks
		SAVE RECORD:C53([Loans:2])
	End for 
	
End if 

QUERY:C277([Loans:2];[Loans:2]student_Id:2=[Students:3]id:1)
ORDER BY:C49([Loans:2];[Loans:2]borrowDate:3;>)
