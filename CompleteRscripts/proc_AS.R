#main file for processing Landsat 8
home<-("/AllAdamsFiles08/MWCC/2013 Fall Symposium/Johnson Sigler/Project_Files/Rcode")
setwd(home)
getwd ()
list.files()
# you should see the list of files for the folder we are working in
source("Install_packs.r")#Checks location of code and compiles it (checks it)
# if you don't see an error message, it worked

Install_packs(home)#Goes to the web and installs neccessary R packages for processing imagery
# A dialogue box will come up asking which location you want to download from; choose on in US

source("load_packs.r")#checks location of code and compiles it (checks it)
load_packs() #actually loads the packages into workspace for use

#Set up directories
pathin<- (paste(home,"/tarballs", sep=""))#path of where to save tar.gz file
tiffs <- (paste(home,"/tiffs", sep="")) #path of location of tiff files
subs<-(paste(home,"/subs", sep="")) #path of subset Landsat data
csvs<-(paste(home,"/csvs", sep="")) #path of image data written out as csv file

# Unzip the Landsat files (11 different files representing 11 bands plus a QA and metadata file)
source("untarme.r") #checks location of code and compiles it
untarme(pathin,tiffs) #unzips the tar.gz files and moves images to tiffs folder

#set up image visualization from R
source("viewimages.R")#checks location of code and compiles it
viewimages(tiffs)#creates several data visualization of imagery; may take quite some time to complete.

Source("NDVI.r") #checks location of code and compiles it
NDVI(tiffs) #creates the Normalized Difference Vegetation Index from imagery

image.plot(NDVI) #Will create a graphic of the NDVI image