#generate SW albedo from Landsat data following Liang, #et al. 2000
L5albedo<-function(n){
	setwd(filepath<-file.path(paste(home,"/", n, sep="")))
b1<- raster(list.files(path=".",pattern="B1.T"))
#b2<- raster(list.files(path=".",pattern="B2.T"))
b3<- raster(list.files(path=".",pattern="B3.T"))
b4<- raster(list.files(path=".",pattern="B4.T"))
b5<- raster(list.files(path=".",pattern="B5.T"))
#b6<- raster(list.files(path=".",pattern="B6.T"))
b7<- raster(list.files(path=".",pattern="B7.T"))
#b9<- raster(list.files(path=".",pattern="B9.T"))
#calc the shortwave albedo 
SWA = ((b1*0.356)+(b3*0.130)+(b4*0.373)+(b5*0.085)+(b7*0.072)-0.0018)/10000
image.plot(SWA, zlim=c(0,1))
nom = substr(list.files(path = ".", pattern = "B11"),1, 22)
writeRaster(SWA,filename=paste(nom,"albedo_v1.tif",sep = ""), format="GTiff", overwrite=TRUE)

setwd(home)
 }
