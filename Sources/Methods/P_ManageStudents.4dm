//%attributes = {}
  // This méthod is running as a process

C_LONGINT:C283(<>PS_Students)
C_LONGINT:C283($ref)


READ WRITE:C146([Students:3])
READ WRITE:C146([Loans:2])
READ ONLY:C145([Books:1])

ALL RECORDS:C47([Students:3])

FORM SET OUTPUT:C54([Students:3];"Output")
FORM SET INPUT:C55([Students:3];"Input")

$ref:=Open form window:C675([Students:3];"Output";Plain form window:K39:10;120;140;*)
SET WINDOW TITLE:C213("Manage Students")

ALL RECORDS:C47([Students:3])
DIALOG:C40([Students:3];"Output")
CLOSE WINDOW:C154($ref)

<>PS_Students:=0
