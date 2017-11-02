#generate SW albedo from Landsat 8 data adapting the coefficients from Tasumi and Allen, 2005
#rm(list=ls())#clears workspace
L8albedo<-function(z,zen){
	setwd(tiffs)
b1<- raster(list.files(path=".",pattern="B1.T"))
b2<- raster(list.files(path=".",pattern="B2.T"))
b3<- raster(list.files(path=".",pattern="B3.T"))
b4<- raster(list.files(path=".",pattern="B4.T"))
b5<- raster(list.files(path=".",pattern="B5.T"))
#b6<- raster(list.files(path=".",pattern="B6.T"))
b7<- raster(list.files(path=".",pattern="B7.T"))
b9<- raster(list.files(path=".",pattern="B9.T"))
#calc the shortwave albedo 
SWA = ((b1*0.254)+(b2*0.254)+(b3*0.149)+(b4*0.147)+(b5*0.311)+(b7*0.036))/100000
plot(SWA)
nom = substr(list.files(path = ".", pattern = "B11"),1, 22)
writeRaster(SWA,filename=paste(nom,"albedo.tif",sep = ""), format="GTiff", overwrite=TRUE)

#calculate the shortwave incoming
DOY = as.numeric(substr(list.files(path=".",pattern="B1.T"),14,16))
dr = 1+0.033*cos(DOY*((2*pi)/365))
Tw = 0.75+2E-5*z
Rsin<- 1367*cos(zen)*dr
Ea = 0.85*(-log((Tw)^0.09))
setwd(home)
 }
