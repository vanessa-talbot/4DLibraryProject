//%attributes = {}
If (<>booksOrderByOrder=1)
	ORDER BY:C49([Books:1];<>booksOrderByField->;>)
Else 
	ORDER BY:C49([Books:1];<>booksOrderByField->;<)
End if 

  //UNLOAD RECORD([Books])
  //CREATE EMPTY SET([Books];"$highlightedBooks")
