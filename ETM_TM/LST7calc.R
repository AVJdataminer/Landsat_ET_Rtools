#This function calculates land surface temperature for ETM data
LST7calc<-function(nomin){
	for(n in nomin){
		setwd(filepath<-file.path(paste(home,"/", n, sep="")))
		L<- raster(list.files(path=".",pattern = "B6"))
		#lm = as.matrix(L)
		df = as(L, "SpatialGridDataFrame")
		LST<-thermalband(df, 61)
		outr<-raster(LST)
		longn<-substr(list.files(path=".",pattern = "B4"),1,22)
		
writeRaster(outr,filename=paste(longn,"LST.tif",sep =""), format="GTiff", overwrite=TRUE)
}}