COPY SET:C600("$highlightedStudents";"$tempSet")

USE SET:C118("$highlightedStudents")
StudentsReOrder 

COPY SET:C600("$tempSet";"$highlightedStudents")
