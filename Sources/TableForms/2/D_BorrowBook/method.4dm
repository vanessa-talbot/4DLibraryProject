Case of 
	: (Form event:C388=On Load:K2:1)
		
		<>bookSearch:=""
		<>bookList:=New list:C375
		
		  // create a set that can NOT be borrowed because they are already loaned
		  // this set will be used in the "BuildBookList" method
		ALL RECORDS:C47([Loans:2])
		RELATE ONE SELECTION:C349([Loans:2];[Books:1])
		CREATE SET:C116([Books:1];"$borrowed")
		
		  // select all the books 
		ALL RECORDS:C47([Books:1])
		  // Remove allready borrowed books
		CREATE SET:C116([Books:1];"$match")  // the set "Match" will be used again, no need to clear it yet
		DIFFERENCE:C122("$match";"$borrowed";"$match")  // remove books allready borrowed
		USE SET:C118("$match")  // new selection build from the set
		
		  // prepare the list of borrowed books (more than one at once is allowed)
		ARRAY LONGINT:C221(<>_borrowedBooksIDs;0)
		
	: (Form event:C388=On Unload:K2:2)
		
		CLEAR SET:C117("$borrowed")
		CLEAR SET:C117("$match")
		
End case 