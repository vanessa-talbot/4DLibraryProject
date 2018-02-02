//%attributes = {}
C_LONGINT:C283($i;$n;$p)
C_LONGINT:C283($bookRecId)


  // the highlight set has been modified by programming or by clicking
  // and adding a record in the highlight set does not mean it still is the current record
  // so let's make the first highlighted record the current one (loaded in memory)

$n:=Records in set:C195("$highlightedBooks")
If ($n#0)
	
	
	
	Case of 
			
		: (False:C215)  // most simple way to proceed
			
			
			$n:=Records in selection:C76([Books:1])
			For ($i;1;$n;1)
				GOTO SELECTED RECORD:C245([Books:1];$i)
				If (Is in set:C273("$highlightedBooks"))
					$i:=$n+1  // exit loop
				End if 
			End for 
			
			
			
			
		: (True:C214)  // another way to proceed, more complicated but quicker in some cases
			
			COPY SET:C600("$highlightedBooks";"$tempoBooks")
			
			ARRAY LONGINT:C221($_recIds;0)
			ARRAY LONGINT:C221($_highlightedRecIds;0)
			
			LONGINT ARRAY FROM SELECTION:C647([Books:1];$_recIds)
			
			CUT NAMED SELECTION:C334([Books:1];"$tempoBooksSelection")
			
			USE SET:C118("$highlightedBooks")
			BooksReOrder   // a set is NOT ordered so sorting again is mandatory
			ARRAY LONGINT:C221($_highlightedRecIds;0)
			LONGINT ARRAY FROM SELECTION:C647([Books:1];$_highlightedRecIds)
			$bookRecId:=$_highlightedRecIds{1}
			
			USE NAMED SELECTION:C332("$tempoBooksSelection")
			$p:=Find in array:C230($_recIds;$bookRecId)
			If ($p>0)
				  // always (otherwise it's a bug)
				GOTO SELECTED RECORD:C245([Books:1];$p)
			End if 
			
			COPY SET:C600("$tempoBooks";"$highlightedBooks")
			
	End case 
	
	
Else 
	UNLOAD RECORD:C212([Books:1])
End if 

