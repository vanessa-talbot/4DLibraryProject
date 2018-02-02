
COPY SET:C600("$highlightedBooks";"$tempoBooks")

ALL RECORDS:C47([Books:1])
BooksReOrder 
BookGotoHighLighted 

COPY SET:C600("$tempoBooks";"$highlightedBooks")

BooksSetInterface   // manages user interface (buttons etc.)
