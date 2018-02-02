C_TEXT:C284($search)
$search:=Get edited text:C655

  // Query books
QUERY:C277([Books:1];[Books:1]title:2="@"+$search+"@";*)
QUERY:C277([Books:1]; | ;[Books:1]author:6="@"+$search+"@")

  // Remove allready borrowed books
CREATE SET:C116([Books:1];"$match")  // the set "Match" will be used again, no need to clear it yet
DIFFERENCE:C122("$match";"$borrowed";"$match")  // remove books allready borrowed
USE SET:C118("$match")  // new selection build from the set

  // Highlight the first one in the list
CREATE EMPTY SET:C140([Books:1];"$highlightedBooks")
ADD TO SET:C119([Books:1];"$highlightedBooks")

  // BuildBookList