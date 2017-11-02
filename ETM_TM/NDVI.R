#this function reads in Landsat 8 data and generates NDVI
NDVI<-function(nomin){
	for (n in nomin){
setwd(filepath<-file.path(paste(home,"/", n, sep="")))
N<- raster(list.files(path=".",pattern = "B4"))
R<-raster(list.files(path=".",pattern = "B3"))
NDVI = (N-R)/(N+R) 
longn<-substr(list.files(path=".",pattern = "B5"),1,22)
writeRaster(NDVI,filename=paste(longn,"ndvi.tif",sep =""), format="GTiff", overwrite=TRUE)

E0 = 1.009+0.047*log(NDVI)

writeRaster(E0,filename=paste(longn,"E0.tif",sep =""), format="GTiff", overwrite=TRUE)

#image.plot(NDVI, main = "NDVI")
#soil adjusted NDVI = SAVI
#SAVI = 1.1*(N-R)/(0.1*N+R)

#calc LAI from SAVI based on form of Bastiaanssen)
#SAVIdf<-as.data.frame(SAVI)
#SAVIdf[is.na(SAVIdf)] <- 0 #replaces NA with 0
#SAVIdf[(SAVIdf<0)]<-0 #less than 0 make 0

#LAI = -((log(0.69-SAVIdf)/0.59)/0.91)

#setwd(csvs)
#m<- as.matrix(NDVI)
#write.table(m, file =paste(longn,"ndvi.csv", sep =""), sep = ",", row.names = F, col.names = F, qmethod = "double")
setwd(home)
#next raster
}
}