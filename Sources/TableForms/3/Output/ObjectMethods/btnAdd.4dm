  // Memorize current displayed Students
CREATE SET:C116([Students:3];"$tempoStudents")

  // define form for input
FORM SET INPUT:C55([Students:3];"Input")
ADD RECORD:C56([Students:3];*)
If (ok=1)  // a new student has been created
	  // add this new student to current Students selection
	ADD TO SET:C119([Students:3];"$tempoStudents")
	USE SET:C118("$tempoStudents")
	  // sort this selection to put the new student at the right place
	StudentsReOrder 
End if 