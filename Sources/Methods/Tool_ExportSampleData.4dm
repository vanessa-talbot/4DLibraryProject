//%attributes = {}

C_TEXT:C284($booksFile;$studentsFile)
C_TIME:C306($doc)

$booksFile:=Get 4D folder:C485(Current resources folder:K5:16)+"Books.txt"
$studentsFile:=Get 4D folder:C485(Current resources folder:K5:16)+"Students.txt"

If (Test path name:C476($booksFile)=Is a document:K24:1)
	DELETE DOCUMENT:C159($booksFile)
End if 

$doc:=Create document:C266($booksFile)
ALL RECORDS:C47([Books:1])
Repeat 
	  // from file
	SEND PACKET:C103($doc;[Books:1]author:6+Char:C90(Tab:K15:37))
	SEND PACKET:C103($doc;[Books:1]title:2+Char:C90(Tab:K15:37))
	SEND PACKET:C103($doc;[Books:1]description:3+Char:C90(Carriage return:K15:38))
	NEXT RECORD:C51([Books:1])
Until (End selection:C36([Books:1]))
CLOSE DOCUMENT:C267($doc)



If (Test path name:C476($studentsFile)=Is a document:K24:1)
	DELETE DOCUMENT:C159($studentsFile)
End if 


$doc:=Create document:C266($studentsFile)
ALL RECORDS:C47([Students:3])
Repeat 
	  // from file
	SEND PACKET:C103($doc;[Students:3]lastName:2+Char:C90(Tab:K15:37))
	SEND PACKET:C103($doc;[Students:3]firstName:3+Char:C90(Tab:K15:37))
	SEND PACKET:C103($doc;[Students:3]address:4+Char:C90(Tab:K15:37))
	SEND PACKET:C103($doc;[Students:3]zipCode:6+Char:C90(Tab:K15:37))
	SEND PACKET:C103($doc;[Students:3]city:7+Char:C90(Tab:K15:37))
	SEND PACKET:C103($doc;[Students:3]telephone:10+Char:C90(Tab:K15:37))
	SEND PACKET:C103($doc;[Students:3]email:11+Char:C90(Tab:K15:37))
	SEND PACKET:C103($doc;[Students:3]grade:8+Char:C90(Tab:K15:37))
	SEND PACKET:C103($doc;[Students:3]primaryTeacher:9+Char:C90(Carriage return:K15:38))
	
	NEXT RECORD:C51([Students:3])
Until (End selection:C36([Students:3]))
CLOSE DOCUMENT:C267($doc)


ALERT:C41("Data exported")
