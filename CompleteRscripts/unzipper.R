temp<-('/Users/aidenvjohnson/Downloads/NLCD2006_landcover_4-20-11_se5.zip')

unzip(temp, files = NULL, list = FALSE, overwrite = TRUE,
      junkpaths = FALSE, exdir = ".", unzip = "internal",
      setTimes = FALSE)

pathin="C:/downloads"
pathout="C:/Users/aidenjohnson/Documents/R/win-library/3.5"
un_data<- list.files(path = pathin, pattern = "zip", all.files = TRUE,
           full.names = FALSE, recursive = FALSE,
           ignore.case = FALSE, include.dirs = FALSE)
len<-length(un_data) 
files_I_want = un_data[c(1:len)]
setwd(pathin)
my_zip = lapply(files_I_want, unzip, exdir = pathout) 
