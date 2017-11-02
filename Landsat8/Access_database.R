#downloading subwatershed.mbd from MT NRIS
require(RCurl)
bin <- getBinaryURL("http://nris.mt.gov/nsdi/nris/mdb/subwatershed.zip",
                    ssl.verifypeer=FALSE)  #read in the https as a binary
con <- file("subwatershed.zip", open = "wb")
writeBin(bin, con)
close(con)               #use this to close the connection
unzip("subwatershed.zip", exdir = ".", unzip = "internal", setTimes = FALSE) #unzips the file
dir()                    #Look at files in the directory.  
unlink("subwatershed.zip")    #delete the zip file
#  shell.exec("SRC2010.mdb")

require(Hmisc)
#next read in huc data from subwatersheds.mdb
d <- mdb.get('subwatershed.mdb')
Huc8<-list.files(d,pattern = "HUC8")
tble<-as.character(contents(d))
write.table(tble,'files.txt')
for(huc12 in d) print(contents(huc12))
mdb.get('subwatershed.mdb', tables=TRUE)
#close(d)
