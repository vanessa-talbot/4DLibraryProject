COPY SET:C600("$highlightedBooks";"$tempoBooks")

USE SET:C118("$highlightedBooks")

BooksReOrder 
BookGotoHighLighted 

COPY SET:C600("$tempoBooks";"$highlightedBooks")

BooksSetInterface   // manages user interface (buttons etc.)
