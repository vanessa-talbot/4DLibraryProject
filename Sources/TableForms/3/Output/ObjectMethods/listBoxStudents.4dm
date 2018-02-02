C_LONGINT:C283($n)
C_POINTER:C301($ptr)

Case of 
		
	: (Form event:C388=On Selection Change:K2:29)
		
		$n:=Records in set:C195("$highlightedStudents")
		If ($n>0)
			OBJECT SET ENABLED:C1123(*;"btnShowSubset";True:C214)
			OBJECT SET ENABLED:C1123(*;"btnDelete";True:C214)
		Else 
			OBJECT SET ENABLED:C1123(*;"btnShowSubset";False:C215)
			OBJECT SET ENABLED:C1123(*;"btnDelete";False:C215)
		End if 
		
	: (Form event:C388=On Double Clicked:K2:5)
		
		$n:=Records in set:C195("$highlightedStudents")
		If ($n>0)
			COPY SET:C600("$highlightedStudents";"$tempSet")
			MODIFY RECORD:C57([Students:3];*)
			StudentsReOrder 
			COPY SET:C600("$tempSet";"$highlightedStudents")
		Else 
			  // this part can be deleted if you don't allow to create a record
			  // using double click on an empty line.
			CREATE SET:C116([Students:3];"$tempoStudents")
			
			  // define form for input
			FORM SET INPUT:C55([Students:3];"Input")
			ADD RECORD:C56([Students:3];*)
			If (ok=1)  // a new student has been created
				  // add this new student to current students selection
				ADD TO SET:C119([Students:3];"$tempoStudents")
				USE SET:C118("$tempoStudents")
				  // sort this selection to put the new student at the right place
				StudentsReOrder 
			End if 
		End if 
		
	: (Form event:C388=On Header Click:K2:40)
		
		  // Note when clicked, the button still has it's OLD value
		
		$ptr:=OBJECT Get pointer:C1124(Object current:K67:2)
		
		Case of 
			: ($ptr=-><>headLastname)
				<>studentsOrderByField:=->[Students:3]lastName:2
				<>studentsOrderByOrder:=3-<>headLastname  // 1 or 2
				
			: ($ptr=-><>headFirstname)
				<>studentsOrderByField:=->[Students:3]firstName:3
				<>studentsOrderByOrder:=3-<>headFirstname  // 1 or 2
				
			: ($ptr=-><>headGrade)
				<>studentsOrderByField:=->[Students:3]grade:8
				<>studentsOrderByOrder:=3-<>headGrade  // 1 or 2
				
		End case 
		
End case 
