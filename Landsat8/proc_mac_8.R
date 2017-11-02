#main file for processing Landsat 8
home<-("/Users/aidenjohnson/Dropbox/water_conf/Rcode_L8")
setwd(home)
#source("Install_packs.r")#checks location of code and compiles it
#Install_packs(home)#Installs neccessary packages for processing imagery
source("load_packs.r")#checks location of code and compiles it
load_packs() #actually loads the packages into workspace for use
source('load_code.r')#checks location of processing code
load_code(home) # loads source code for data processing of imagery

#set up other directories for processing data
pathin<- (paste(home,"/tarballs", sep=""))
tiffs <- (paste(home,"/tiffs", sep=""))
subs<-(paste(home,"/subs", sep=""))
csvs<-(paste(home,"/csvs", sep=""))
shps<-(paste(home,"/shps",sep =""))
masks<-(paste(home,"/masks_tiff",sep =""))
#z = elevation in meters from the SCAN site
z = 1297.23

setwd(pathin)
names<-list.files(path = pathin, pattern = "tar.gz") #get list of files
#imagecount = length(names)
nomin<-substr(names,1,21) #Create a name for each image file in the tarballs folder from its original name

####Start of data processing###
#untarme(pathin,tiffs)#unzips the image files and creates tiffs

#mv(home) #moves files into individual folders
##If previsously run untarme start here
setwd(home)
metcon(nomin)
NDVI(nomin)
SurfT(nomin)
L8albedo(nomin)
Rn(nomin)
detach(indat)
#may want to run purge here#
G(nomin)
#may want to run purge here#
LAI(nomin)
#####wait to run plotting after files have been fully uploaded to db#######
plotset(nomin)	
#testing out shape mask code###
source('inshape.r')
inshape(nomin)



