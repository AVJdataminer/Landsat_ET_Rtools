#main file for processing Landsat ETM
home<-("/Users/aidenjohnson/Dropbox/water_conf/Rcode_ETM")
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

#z = elevation in meters from the SCAN site
#z = 1297.23
Z= 100 #Innoko is very low elevation
setwd(pathin)
names<-list.files(path = pathin, pattern = "tar.gz") #get list of files
#imagecount = length(names)
nomin<-substr('L5075016_01619850802',1,21) #Create a name for each image file in the tarballs folder from its original name

####Start of data processing###
untarme(pathin,tiffs)#unzips the image files and creates tiffs

mv(home) #moves files into individual folders
##If previsously run untarme start here
setwd(home)
metcon(nomin)
NDVI(nomin)
LAI(nomin)
LST7calc(nomin)
LST5calc(nomin)
L5albedo(nomin) #computes the SW albedo and incoming sw radiation
Rn(nomin)
#may want to run purge here#
G(nomin)
plotset(nomin)
