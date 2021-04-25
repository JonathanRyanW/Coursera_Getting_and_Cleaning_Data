library(RMySQL)

#Membuat koneksi (dengan server?)
connection <- dbConnect(MySQL(),
                        user = "genome",
                        host = "genome-mysql.cse.ucsc.edu")

#Meminta daftar semua database yang ada
result <- dbGetQuery(connection, "show databases;")

#Koneksi harus diputuskan setiap selesai query
dbDisconnect(connection)

#Membuat koneksi (dengan database?)
hg19 <- dbConnect(MySQL(),
                  user = "genome",
                  db = "hg19",
                  host = "genome-mysql.cse.ucsc.edu")

#Minta semua tabel (dataframe) yang ada di database itu
all.tables <- dbListTables(hg19)

#Minta semua kolom (field) dari sebuah table dari database
dbListFields(hg19, "encTfChipPkENCFF520CSO")
dbListFields(hg19, "affyU133Plus2")

#Cari tahu jumlah baris (observation / record) dari sebuah tabel
dbGetQuery(hg19, "select count(*) from affyU133Plus2")

#Baca tabelnya
affy.data <- dbReadTable(hg19, "affyU133Plus2")

#Minta subset dari suatu tabel
query <- dbSendQuery(hg19,
                     "select * from affyU133Plus2 where misMatches between 1 and 3")
affy.mis <- fetch(query)

#Kalau cuman mau sebagian dari tabel tersebut
aff.mis.small <- fetch(query, n = 10)

#Membersihkan query dari server
dbClearResult(query)
