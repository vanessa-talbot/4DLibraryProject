//%attributes = {}
  //This method is called to manage User Interface

C_LONGINT:C283($n)


If (<>booksEditMode=True:C214)
	
	  // disable buttons in the toolbar
	OBJECT SET ENABLED:C1123(*;"btnShowAll";False:C215)
	OBJECT SET ENABLED:C1123(*;"btnShowSubset";False:C215)
	OBJECT SET ENABLED:C1123(*;"btnAdd";False:C215)
	OBJECT SET ENABLED:C1123(*;"btnDelete";False:C215)
	OBJECT SET ENABLED:C1123(*;"btnPrint";False:C215)
	
	
	  // display the cancel button (invisible by default)
	OBJECT SET VISIBLE:C603(*;"BtnCancel";True:C214)
	  // hide status info
	OBJECT SET VISIBLE:C603(*;"Pict_Available";False:C215)
	OBJECT SET VISIBLE:C603(*;"Pict_Unavailable";False:C215)
	OBJECT SET VISIBLE:C603(*;"Status";False:C215)
	  // set fields enterable
	OBJECT SET ENTERABLE:C238(*;"@Field@";True:C214)
	  // give fields a system border
	OBJECT SET BORDER STYLE:C1262(*;"@Field@";Border System:K42:33)
	  // turn listbox to grey (to simulate inactivity (but still is available)
	OBJECT SET RGB COLORS:C628(*;"listBoxBooks";0x00C0C0C0;Background color:K23:2)  // foreground /  background
	  // switch the title and icon of the button to save
	OBJECT SET TITLE:C194(*;"BtnEditSave";"Save")  // <TRANSLATION>
	OBJECT SET FORMAT:C236(*;"BtnEditSave";";#Pictures/Buttons/Validate.png")
	
Else 
	
	  // reverse everything above
	
	  // Enable buttons in the toolbar
	OBJECT SET ENABLED:C1123(*;"btnShowAll";True:C214)
	OBJECT SET ENABLED:C1123(*;"btnAdd";True:C214)
	OBJECT SET ENABLED:C1123(*;"btnPrint";True:C214)
	
	$n:=Records in set:C195("$highlightedBooks")
	Case of 
			
		: ($n=0)
			OBJECT SET ENABLED:C1123(*;"btnShowSubset";False:C215)
			OBJECT SET ENABLED:C1123(*;"btnDelete";False:C215)
			OBJECT SET ENABLED:C1123(*;"BtnEditSave";False:C215)
			
		: ($n=1)
			OBJECT SET ENABLED:C1123(*;"btnShowSubset";True:C214)
			OBJECT SET ENABLED:C1123(*;"btnDelete";True:C214)
			OBJECT SET ENABLED:C1123(*;"BtnEditSave";True:C214)
			
		: ($n>1)
			OBJECT SET ENABLED:C1123(*;"btnShowSubset";True:C214)
			OBJECT SET ENABLED:C1123(*;"btnDelete";True:C214)
			OBJECT SET ENABLED:C1123(*;"BtnEditSave";False:C215)
			
	End case 
	
	  // hide cancel button
	OBJECT SET VISIBLE:C603(*;"BtnCancel";False:C215)
	  // show status info
	C_LONGINT:C283($color)
	OBJECT GET RGB COLORS:C1074(*;"Status";$color)
	If ($color=0xB000)
		OBJECT SET VISIBLE:C603(*;"Pict_Available";True:C214)
	Else 
		OBJECT SET VISIBLE:C603(*;"Pict_Unavailable";True:C214)
	End if 
	OBJECT SET VISIBLE:C603(*;"Status";True:C214)
	
	OBJECT SET ENTERABLE:C238(*;"@Field@";False:C215)
	
	OBJECT SET BORDER STYLE:C1262(*;"@Field@";Border None:K42:27)
	
	OBJECT SET RGB COLORS:C628(*;"listBoxBooks";Background color:K23:2;Foreground color:K23:1)
	
	OBJECT SET TITLE:C194(*;"BtnEditSave";"Edit")  // <TRANSLATION>
	OBJECT SET FORMAT:C236(*;"BtnEditSave";";#Pictures/Buttons/EditRecord.png")
	
End if 
