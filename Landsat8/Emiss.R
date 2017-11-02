#calculate surface emissivity for ET calculation
#LAI must be calculated first
Emiss<-function( ){
	setwd(tiffs)
	L<- raster(list.files(path=".", pattern = "LAI.tif"))
	ENB <-0.97+0.00033*L
	E0<-0.95+0.01*L	
	longn<-substr(list.files(path=".", pattern = "LAI.tif"),1,22)
	writeRaster(ENB,filename=paste(longn,"ENB.tif",sep =""), format="GTiff", overwrite=TRUE)
	writeRaster(E0,filename=paste(longn,"E0.tif",sep =""), format="GTiff", overwrite=TRUE)
setwd(home)		
}