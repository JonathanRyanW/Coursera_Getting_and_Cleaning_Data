link <- "http://biostat.jhsph.edu/~jleek/contact.html" 
conn <- url(link)
html.code <- readLines(conn)
close(conn)

nchar(html.code[10])
nchar(html.code[20])
nchar(html.code[30])
nchar(html.code[100])

text <- read.fwf("getdata_wksst8110.for", widths = 98, skip = 4)
test <- str_