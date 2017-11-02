#function for reading NDVI and displaying with huc layer over the top

viewNDVI<-function(pathin){
	setwd(pathin)
	N<- list.files(path=".",pattern = "NDVI")
	ndvi<-raster(NDVI)
	image.plot(NDVI, main = "NDVI")
	setwd(home)
		
}