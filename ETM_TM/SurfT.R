#calculate the surface temperature for landsat 8 only different data input for tm 
SurfT<-function(){
	setwd(tiffs)
	#first calc Thermal Radiance via Allen et al (2007) from multiple MODTRAN runs
	NDVI<- raster(list.files(path=".", pattern = "ndvi"))
	E0 = 1.009+0.047*log(NDVI)
	B10<- raster(list.files(path=".", pattern = "B10.T"))
	RADIANCE_MULT_BAND_10 = 3.3420E-04
	RADIANCE_ADD_BAND_10 = 0.10000
	TOAB10 =  RADIANCE_MULT_BAND_10*B10+RADIANCE_ADD_BAND_10 
	#Rc =( (TOAB10-0.91)/0.866)-(1-ENB)*1.32
	
	B11<- raster(list.files(path=".", pattern = "B11.T"))
	RADIANCE_MULT_BAND_11 = 3.3420E-04
	RADIANCE_ADD_BAND_11 = 0.10000
	TOAB11=  RADIANCE_MULT_BAND_11*B11+RADIANCE_ADD_BAND_11
	#Rc1 =( (TOAB11-0.91)/0.866)-(1-ENB)*1.32
	
	#Using Plank's Law calc Surface temperature
	K1_CONSTANT_BAND_10 = 774.89
    K1_CONSTANT_BAND_11 = 480.89
    K2_CONSTANT_BAND_10 = 1321.08
	K2_CONSTANT_BAND_11 = 1201.14
	
		Ts10 = K2_CONSTANT_BAND_10/(log((K1_CONSTANT_BAND_10)/TOAB10)+1)
		TK10 = Ts10/E0^.25
		Ts11= K2_CONSTANT_BAND_11/(log((K1_CONSTANT_BAND_11)/TOAB11)+1)
		TK11 = Ts11/E0^.25
	longn<-substr(list.files(path=".", pattern = "LAI.tif"),1,22)
	writeRaster(TK10,filename=paste(longn,"Ts10.tif",sep =""), format="GTiff", overwrite=TRUE)
	writeRaster(TK11,filename=paste(longn,"Ts11.tif",sep =""), format="GTiff", overwrite=TRUE)
	writeRaster(E0,filename=paste(longn,"E0.tif",sep =""), format="GTiff", overwrite=TRUE)
setwd(home)		

	
	
}