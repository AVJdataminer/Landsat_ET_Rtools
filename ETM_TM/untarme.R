#building an unzipper in r
untarme<- function(pathin, pathout){
un_data<- list.files(path = pathin, pattern = "tar.gz", all.files = TRUE,
           full.names = FALSE, recursive = FALSE,
           ignore.case = FALSE, include.dirs = FALSE)
len<-length(un_data) 
files_I_want = un_data[c(1:len)]
setwd(pathin)
my_tars = lapply(files_I_want, untar) 
setwd(pathin)

#move those Tiffs
sub_data<-list.files(path = ".", pattern =".TIF")
len<-length(sub_data) 
files_I_want = sub_data[c(1:len)]
my_rasters = lapply(files_I_want, raster) 
for(i in sub_data){
	file.rename(i, filepath <- file.path(tiffs,paste(i,sep="")))
  }

setwd(home)
#for(i in 1:len){	
  #v1<-raster(files_I_want[i])
 # unzipd<- untar("un_data", files = NULL, list = TRUE, exdir = "pathout",
  #    compressed = NA, extras = NULL, verbose = FALSE,
   #   tar = Sys.getenv("TAR"))
#return(unzipd)

 # }
  }