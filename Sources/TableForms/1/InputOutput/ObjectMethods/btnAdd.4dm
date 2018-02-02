C_LONGINT:C283($winRef)
C_LONGINT:C283($bookRecId)

  // memorize current displayed books
CREATE SET:C116([Books:1];"$tempoBooks")

  // define form for input

FORM SET INPUT:C55([Books:1];"NewBook")
$winRef:=Open form window:C675([Books:1];"NewBook";Sheet form window:K39:12)
ADD RECORD:C56([Books:1];*)

If (ok=1)  // a new book has been created
	
	$bookRecId:=Record number:C243([Books:1])  // memorize its record ID
	
	  // create a set with this new book
	CREATE EMPTY SET:C140([Books:1];"$newBook")
	ADD TO SET:C119([Books:1];"$newBook")
	
	  // add this new book to current books selection
	UNION:C120("$tempoBooks";"$newBook";"$tempoBooks")
	USE SET:C118("$tempoBooks")
	
	  // sort this selection to put the new book at the right place
	BooksReOrder 
	
	
	
	  // *** the code below is OPTIONAL ***
	
	
	  // highlight the just created book
	COPY SET:C600("$newBook";"$highlightedBooks")
	BookGotoHighLighted 
	
	COPY SET:C600("$newBook";"$highlightedBooks")
	CLEAR SET:C117("$newBook")
End if 

