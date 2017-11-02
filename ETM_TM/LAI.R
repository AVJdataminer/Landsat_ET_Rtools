#estimate an LAI layer from an NDVI
LAI <-function(nomin){
	for (n in nomin){
setwd(filepath<-file.path(paste(home,"/", n, sep="")))
		N<- raster(list.files(path=".", pattern = "ndvi.tif"))
			LAI = -0.397+2.268*(N)
	longn<-substr(list.files(path=".",pattern = "B4"),1,22)
	writeRaster(LAI,filename=paste(longn,"LAI.tif",sep =""), format="GTiff", overwrite=TRUE)
#image.plot(LAI, main = "LAI")

}
setwd(home)	
	}
