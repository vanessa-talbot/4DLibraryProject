Case of 
	: (Form event:C388=On Load:K2:1)
		
		ALL RECORDS:C47([Books:1])
		<>booksOrderByField:=->[Books:1]title:2
		<>booksOrderByOrder:=1
		<>headTitle:=1
		BooksReOrder 
		UNLOAD RECORD:C212([Books:1])
		BookSetStatus 
		
		<>booksEditMode:=False:C215
		BooksSetInterface 
		
		CREATE SET:C116([Books:1];"$tempoBooks")
		
		GOTO OBJECT:C206(*;"listBoxBooks")
		
		
	: (Form event:C388=On Unload:K2:2)
		
		CLEAR SET:C117("$tempoBooks")
		
		
End case 