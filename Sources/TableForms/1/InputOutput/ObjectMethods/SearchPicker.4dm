  //Searchpicker sample code
C_LONGINT:C283($i;$n)
C_TEXT:C284($search)

Case of 
		
	: (Form event:C388=On Load:K2:1)
		
		  // Init the var itself
		  // this can be done anywhere else in your code
		C_TEXT:C284(vSearch)
		
		  // the let's customise the SearchPicker (if needed)
		
		C_BOOLEAN:C305($customise)
		$customise:=True:C214
		
		C_TEXT:C284($objectName)
		$objectName:=OBJECT Get name:C1087(Object current:K67:2)
		
		  // The exemple below shows how to set a label (ex : "name") inside the search zone
		
		If ($customise)
			
			SearchPicker SET HELP TEXT ($objectName;"Title or Author")  //<TRANSLATION>
			
		End if 
		
		
	: (Form event:C388=On Getting Focus:K2:7)
		
		If (<>booksEditMode=True:C214)
			BooksExitEditMode 
		End if 
		
	: (Form event:C388=On Data Change:K2:15)
		
		If (vSearch="")
			ALL RECORDS:C47([Books:1])
		Else 
			
			If (False:C215)  // if you want to keep it simple, do this…
				
				QUERY:C277([Books:1];[Books:1]author:6="@"+vSearch+"@";*)
				QUERY:C277([Books:1]; | ;[Books:1]title:2="@"+vSearch+"@")
				
			Else   // otherwise do this…
				
				ARRAY TEXT:C222($_words;0)
				GET TEXT KEYWORDS:C1141(vSearch;$_words)  //  "ed ros cyr ber" allow to find "edmond rostand cyrano de bergerac"
				ALL RECORDS:C47([Books:1])
				CREATE SET:C116([Books:1];"$foundBooks")
				
				$n:=Size of array:C274($_words)
				For ($i;1;$n)
					$search:=$_words{$i}
					QUERY:C277([Books:1];[Books:1]author:6="@"+$search+"@";*)
					QUERY:C277([Books:1]; | ;[Books:1]title:2="@"+$search+"@")
					CREATE SET:C116([Books:1];"$lastFoundBooks")
					INTERSECTION:C121("$foundBooks";"$lastFoundBooks";"$foundBooks")
				End for 
				
				USE SET:C118("$foundBooks")
				CLEAR SET:C117("$foundBooks")
				CLEAR SET:C117("$lastFoundBooks")
				
			End if 
			
		End if 
		
		
		If (Records in selection:C76([Books:1])>0)
			CREATE EMPTY SET:C140([Books:1];"$highlightedBooks")
			BooksReOrder 
			ADD TO SET:C119([Books:1];"$highlightedBooks")
			
		Else 
			
		End if 
		
		BooksSetInterface 
		BookSetStatus 
		
End case 
