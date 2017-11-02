#main file for processing Landsat 8
home<-("/Users/aidenjohnson/Dropbox/Job_app/Connecticut Job apps/Boston University Data Analyst I/Rcode_pieces/Rcode")
setwd(home)
##test using dropbox links for files
##perhaps make a git hub project for this
library(RCurl)
source("Install_packs.r")#checks location of code and compiles it
Install_packs(home)#Installs neccessary packages for processing imagery
source("load_packs.r")#checks location of code and compiles it
load_packs() #actually loads the packages into workspace for use
pathin<- (paste(home,"/tarballs", sep=""))#path of where to save tar.gz file
tiffs <- (paste(home,"/tiffs", sep="")) #path of location of tiff files
subs<-(paste(home,"/subs", sep="")) #path of subset Landsat data
csvs<-(paste(home,"/csvs", sep="")) #path of image data written out as csv file
source("untarme.r") #checks location of code and compiles it
untarme(pathin,tiffs) #unzips the tar.gz files and moves images to tiffs folder
source("mv.r")
mv(tiffs)
#set up image visualization from R
source("viewimages.R")#checks location of code and compiles it
viewimages(tiffs)#creates several data visualization of imagery; may take quite some time to complete.
Source("NDVI.r") #checks location of code and compiles it
NDVI(tiffs) #creates the Normalized Difference Vegetation Index from imagery

