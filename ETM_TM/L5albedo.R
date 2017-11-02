#generate SW albedo from Landsat data following Tasumi and Allen, 2005
L5albedo<-function(nomin){
	for(n in nomin){
	setwd(filepath<-file.path(paste(home,"/", n, sep="")))
b1<- raster(list.files(path=".",pattern="B1"))
b2<- raster(list.files(path=".",pattern="B2"))
b3<- raster(list.files(path=".",pattern="B3"))
b4<- raster(list.files(path=".",pattern="B4"))
b5<- raster(list.files(path=".",pattern="B5"))
#b6<- raster(list.files(path=".",pattern="B6.T"))
b7<- raster(list.files(path=".",pattern="B7"))
#b9<- raster(list.files(path=".",pattern="B9.T"))
#calc the shortwave albedo 
SWA = ((b1*0.254)+(b2*0.254)+(b3*0.149)+(b4*0.147)+(b5*0.311)+(b7*0.036))/100
plot(SWA)

image.plot(SWA, zlim=c(0,1))
nom = substr(list.files(path = ".", pattern = "B5"),1, 22)
writeRaster(SWA,filename=paste(nom,"albedo_v1.tif",sep = ""), format="GTiff", overwrite=TRUE)

setwd(home)
}
}