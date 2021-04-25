connection <- url("https://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en&oi=ao")
html.code <- readLines(connection)
close(connection)

#Jangan coba2 print, nanti error
html.code

#Pake package XML supaya hasilnya punya format
install.packages("XML")
library(XML)

#Mau melihat judul dari suatu webpage
url <- "http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en&oi=ao"

html <- htmlTreeParse(url, useInternalNodes = T)
xpathSApply(html, "//title", xmlValue)

#Itu gagal, harus pake package Rcurl
install.packages("RCurl")
library(RCurl)

surl <- "https://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en&oi=ao"
url <- getURL(surl)

html <- htmlTreeParse(url, useInternalNodes = T)
xpathSApply(html, "//title", xmlValue)

#Lihat isi dari suatu tabel (tabel berapa kali di sitasi)
xpathSApply(html, "//td[@id='col-citedby']", xmlValue)

#Itu nggak bisa juga, harus diubah jadi begini
xpathSApply(html, "//td[@class='gsc_a_c']", xmlValue)
