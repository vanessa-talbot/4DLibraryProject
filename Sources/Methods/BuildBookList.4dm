//%attributes = {}
C_LONGINT:C283($i;$n)

  // clear the list below the input zone
CLEAR LIST:C377(<>bookList)
<>bookList:=New list:C375

$n:=Records in selection:C76([Books:1])
If ($n>0)
	  // sets are not sorted, so lets order books by title
	ORDER BY:C49([Books:1];[Books:1]title:2)
	  // then add each book in the list
	For ($i;1;$n)
		GOTO SELECTED RECORD:C245([Books:1];$i)
		APPEND TO LIST:C376(<>bookList;[Books:1]title:2+" ("+[Books:1]author:6+")";$i)
	End for 
	  // select the first book in the list
	SELECT LIST ITEMS BY POSITION:C381(<>bookList;1)
	GOTO SELECTED RECORD:C245([Books:1];1)
	<>bookID:=[Books:1]id:1
	
End if 
