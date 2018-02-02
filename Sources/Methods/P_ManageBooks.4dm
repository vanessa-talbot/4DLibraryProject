//%attributes = {}
C_LONGINT:C283($ref)

  // this method is running as a process

READ ONLY:C145([Students:3])
READ ONLY:C145([Loans:2])
READ WRITE:C146([Books:1])

$ref:=Open form window:C675([Books:1];"InputOutput";Plain form window:K39:10;40;120;*)
SET WINDOW TITLE:C213("Manage Books")

DIALOG:C40([Books:1];"InputOutput")

<>PS_Books:=0
