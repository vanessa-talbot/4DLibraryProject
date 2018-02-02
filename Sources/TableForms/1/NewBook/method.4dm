Case of 
	: (Form event:C388=On Load:K2:1)
		
		  //if there is no picture for the book, lets build a fake one.
		If (Picture size:C356([Books:1]photo:4)=0)
			[Books:1]photo:4:=Tool_BuildBookPicture ([Books:1]author:6;[Books:1]title:2)
		End if 
		
		  // Check if the book is available
		
		
		QUERY:C277([Loans:2];[Loans:2]book_Id:1=[Books:1]id:1)
		
		If (Records in selection:C76([Loans:2])=0)
			
			  // No loans, the book is available
			OBJECT SET VISIBLE:C603(*;"Pict_Available";True:C214)
			OBJECT SET VISIBLE:C603(*;"Pict_Unavailable";False:C215)
			OBJECT SET RGB COLORS:C628(*;"status";0xB000;Background color none:K23:10)  //  green
			<>bookStatus:=Char:C90(Carriage return:K15:38)+"Book Available"  // <Translation>
			
		Else 
			
			OBJECT SET VISIBLE:C603(*;"Pict_Available";False:C215)
			OBJECT SET VISIBLE:C603(*;"Pict_Unavailable";True:C214)
			OBJECT SET RGB COLORS:C628(*;"status";0x00D00000;Background color none:K23:10)  //  red
			
			  //Search for the current borrower of the book
			RELATE ONE SELECTION:C349([Loans:2];[Students:3])
			
			<>bookStatus:="Borrowed on "+String:C10([Loans:2]borrowDate:3)+Char:C90(Carriage return:K15:38)
			<>bookStatus:=<>bookStatus+"by "+[Students:3]firstName:3+" "+[Students:3]lastName:2+"."+Char:C90(Carriage return:K15:38)
			<>bookStatus:=<>bookStatus+"Return expected on "+String:C10([Loans:2]returnDate:4;System date short:K1:1)+"."
			
		End if 
		If (Record number:C243([Books:1])=New record:K29:1)
			GOTO OBJECT:C206(*;"Title")
			[Books:1]purchaseDate:5:=Current date:C33
		Else 
			GOTO OBJECT:C206(*;"Photo")
		End if 
		
End case 