//%attributes = {}

C_TEXT:C284($booksFile;$studentsFile)
C_TEXT:C284($author)
C_TEXT:C284($title)
C_TEXT:C284($description)

C_TEXT:C284($lastName)
C_TEXT:C284($firstName)
C_TEXT:C284($address)
C_TEXT:C284($zipCode)
C_TEXT:C284($city)
C_TEXT:C284($telephone)
C_TEXT:C284($email)
C_TEXT:C284($grade)
C_TEXT:C284($primaryTeacher)

C_BOOLEAN:C305($import)
C_TIME:C306($doc)

C_LONGINT:C283($i;$n;$m;$rndBook)

TRUNCATE TABLE:C1051([Books:1])
TRUNCATE TABLE:C1051([Loans:2])
TRUNCATE TABLE:C1051([Students:3])

$booksFile:=Get 4D folder:C485(Current resources folder:K5:16)+"Books.txt"
$studentsFile:=Get 4D folder:C485(Current resources folder:K5:16)+"Students.txt"

If (Test path name:C476($booksFile)=Is a document:K24:1) & (Test path name:C476($studentsFile)=Is a document:K24:1)
	$import:=True:C214
Else 
	$import:=False:C215
End if 

If ($import)
	
	$doc:=Open document:C264($booksFile)
	If (ok=1)
		Repeat 
			  // from file
			RECEIVE PACKET:C104($doc;$author;Char:C90(Tab:K15:37))
			RECEIVE PACKET:C104($doc;$title;Char:C90(Tab:K15:37))
			RECEIVE PACKET:C104($doc;$description;Char:C90(Carriage return:K15:38))
			If (ok=1)
				CREATE RECORD:C68([Books:1])
				[Books:1]author:6:=$author
				[Books:1]title:2:=$title
				[Books:1]description:3:=$description
				  // random generation
				[Books:1]purchaseDate:5:=Current date:C33-(Random:C100%1000)
				[Books:1]photo:4:=Tool_BuildBookPicture ([Books:1]author:6;[Books:1]title:2)
				SAVE RECORD:C53([Books:1])
			End if 
		Until (ok=0)
		UNLOAD RECORD:C212([Books:1])
		CLOSE DOCUMENT:C267($doc)
	End if 
	
	$doc:=Open document:C264($studentsFile)
	If (ok=1)
		Repeat 
			  // from file
			RECEIVE PACKET:C104($doc;$lastName;Char:C90(Tab:K15:37))
			RECEIVE PACKET:C104($doc;$firstName;Char:C90(Tab:K15:37))
			RECEIVE PACKET:C104($doc;$address;Char:C90(Tab:K15:37))
			RECEIVE PACKET:C104($doc;$zipCode;Char:C90(Tab:K15:37))
			RECEIVE PACKET:C104($doc;$city;Char:C90(Tab:K15:37))
			RECEIVE PACKET:C104($doc;$telephone;Char:C90(Tab:K15:37))
			RECEIVE PACKET:C104($doc;$email;Char:C90(Tab:K15:37))
			RECEIVE PACKET:C104($doc;$grade;Char:C90(Tab:K15:37))
			RECEIVE PACKET:C104($doc;$primaryTeacher;Char:C90(Carriage return:K15:38))
			If (ok=1)
				CREATE RECORD:C68([Students:3])
				[Students:3]lastName:2:=$lastName
				[Students:3]firstName:3:=$firstName
				[Students:3]address:4:=$address
				[Students:3]zipCode:6:=$zipCode
				[Students:3]city:7:=$city
				[Students:3]telephone:10:=$telephone
				[Students:3]email:11:=$email
				[Students:3]grade:8:=$grade
				[Students:3]primaryTeacher:9:=$primaryTeacher
				SAVE RECORD:C53([Students:3])
			End if 
		Until (ok=0)
		CLOSE DOCUMENT:C267($doc)
	End if 
	
	  // generate a couple of loands (1/3 of books)
	
	ARRAY LONGINT:C221($_BookID;0)
	ALL RECORDS:C47([Books:1])
	SELECTION TO ARRAY:C260([Books:1]id:1;$_BookID)
	
	ARRAY LONGINT:C221($_StudendID;0)
	ALL RECORDS:C47([Students:3])
	SELECTION TO ARRAY:C260([Students:3]id:1;$_StudendID)
	
	$n:=Size of array:C274($_BookID)
	$m:=Size of array:C274($_StudendID)
	
	For ($i;1;Int:C8($n/3))  // one book out of 3 is borrowed
		
		CREATE RECORD:C68([Loans:2])
		
		$rndBook:=1+(Random:C100%Size of array:C274($_BookID))  // pick a random book
		[Loans:2]book_Id:1:=$_BookID{$rndBook}
		[Loans:2]student_Id:2:=$_StudendID{1+(Random:C100%$m)}
		DELETE FROM ARRAY:C228($_BookID;$rndBook;1)  // a book can't be borrowed twice at once
		
		[Loans:2]borrowDate:3:=Current date:C33-10-(Random:C100%20)  // random borrow date between 10 and 30 days ago
		[Loans:2]returnDate:4:=[Loans:2]borrowDate:3+21  // three weeks later (some should have been returned yet !)
		
		SAVE RECORD:C53([Loans:2])
		
	End for 
	
	$0:=True:C214
	
Else 
	
	$0:=False:C215
	
End if 
