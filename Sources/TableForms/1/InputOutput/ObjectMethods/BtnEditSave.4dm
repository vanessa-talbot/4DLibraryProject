
If (<>booksEditMode=False:C215)
	
	LOAD RECORD:C52([Books:1])
	
	If (ok=1)
		<>booksEditMode:=True:C214
		GOTO OBJECT:C206(*;"TitleField")
		
	Else 
		ALERT:C41("This book can not be modified. It's already beeing modified by someone else !")
	End if 
	
	BooksSetInterface   // also called inside BooksExitEditMode (see below)
	
Else 
	
	BooksExitEditMode (True:C214)  // true will be interpreted as "save"
	GOTO OBJECT:C206(*;"listBoxBooks")
	
End if 


