
C_LONGINT:C283($n)
C_POINTER:C301($ptr)
C_LONGINT:C283($col;$row)

Case of 
		
	: (Form event:C388=On Selection Change:K2:29)
		
		$n:=Records in set:C195("$highlightedBooks")
		If ($n=1)
			LISTBOX GET CELL POSITION:C971(*;"listBoxBooks";$col;$row)
			GOTO SELECTED RECORD:C245([Books:1];$row)
		Else 
			CREATE RECORD:C68([Books:1])  // naver saved, just for the interface !!!
			If ($n>1)
				[Books:1]title:2:=String:C10($n)+" Books selected."  // <TRANSLATION>
			Else 
				[Books:1]title:2:="No Book selected."  // <TRANSLATION>
			End if 
		End if 
		
		  //BookGotoHighLighted 
		
		BooksSetInterface 
		
		BookSetStatus 
		
	: (Form event:C388=On Unload:K2:2)
		
	: (Form event:C388=On Getting Focus:K2:7)
		
		If (<>booksEditMode=True:C214)
			BooksExitEditMode 
		End if 
		
	: (Form event:C388=On Header Click:K2:40)
		
		  // : Note when clicked, the button still has it's OLD value
		
		$ptr:=OBJECT Get pointer:C1124(Object current:K67:2)
		
		Case of 
			: ($ptr=-><>headTitle)
				<>booksOrderByField:=->[Books:1]title:2
				<>booksOrderByOrder:=3-<>headTitle  // 1 or 2
				
			: ($ptr=-><>headAuthor)
				<>booksOrderByField:=->[Books:1]author:6
				<>booksOrderByOrder:=3-<>headAuthor
				
			: ($ptr=-><>headPurchase)
				<>booksOrderByField:=->[Books:1]purchaseDate:5
				<>booksOrderByOrder:=3-<>headPurchase
				
		End case 
		
End case 
