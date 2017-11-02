#calculate the surface temperature for landsat 8 only different data input for tm 
SurfT<-function(n){
setwd(filepath<-file.path(paste(home,"/", n, sep="")))
	#first calc Thermal Radiance via Allen et al (2007) from multiple MODTRAN runs
	#NDVI<- raster(list.files(path=".", pattern = "ndvi"))
	#E0 = 1.009+0.047*log(NDVI)
	E0<- raster(list.files(path=".", pattern = "E0"))
	B10<- raster(list.files(path=".", pattern = "B10.T"))
	
	nom = substr(list.files(path = ".", pattern = "B5"),1,22)
	indat <-read.table(paste(nom,"meta", sep = ""), header = T)
	attach(indat)
	
	TOAB10 =  RADIANCE_MULT_BAND_10*B10+RADIANCE_ADD_BAND_10 
	#Rc =( (TOAB10-0.91)/0.866)-(1-ENB)*1.32
	
	B11<- raster(list.files(path=".", pattern = "B11.T"))
	TOAB11=  RADIANCE_MULT_BAND_11*B11+RADIANCE_ADD_BAND_11
	#Rc1 =( (TOAB11-0.91)/0.866)-(1-ENB)*1.32
	
	#Using Plank's Law calc Surface temperature
		Ts10 =( K2_CONSTANT_BAND_10/(log((K1_CONSTANT_BAND_10)/TOAB10)+1)+20)
		TK10 = Ts10/E0^.25
		Ts11= (K2_CONSTANT_BAND_11/(log((K1_CONSTANT_BAND_11)/TOAB11)+1)+20)
		TK11 = Ts11/E0^.25
	longn<-substr(list.files(path=".", pattern = ".tif"),1,22)
	writeRaster(TK10,filename=paste(longn,"Ts10.tif",sep =""), format="GTiff", overwrite=TRUE)
	writeRaster(TK11,filename=paste(longn,"Ts11.tif",sep =""), format="GTiff", overwrite=TRUE)
	#writeRaster(E0,filename=paste(longn,"E0.tif",sep =""), format="GTiff", overwrite=TRUE)
setwd(home)		

	
	
}