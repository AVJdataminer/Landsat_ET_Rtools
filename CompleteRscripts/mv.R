#create iterative directories based on names of tarballs
#move tiffs to to individual folders before analysis
mv<-function(filepath){
	setwd(pathin)
	names<-list.files(path = pathin, pattern = "tar.gz", all.files = TRUE,
           full.names = FALSE, recursive = FALSE,
           ignore.case = FALSE, include.dirs = FALSE)
            nomin<-substr(names,1,21) 
            for (j in nomin){
            	mainDir <- paste(home)
	subDir <- j
if (file.exists(subDir)){
    setwd(tiffs)
  } else {
    dir.create(file.path(mainDir, subDir))
    setwd(tiffs)
}
sub_data<-list.files(path = ".", pattern =j)
len<-length(sub_data) 
files_I_want = sub_data[c(1:len)]
my_rasters = lapply(files_I_want, raster) 
newdir<-file.path(paste(home,"/",j, sep=""))
for(i in sub_data){
	file.rename(i, filepath <-file.path(newdir,paste(i, sep="")))
  }
} 
setwd(home)
}