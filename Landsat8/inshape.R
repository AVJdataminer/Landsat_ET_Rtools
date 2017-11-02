#subsetting the rasters by landform from shapefiles
inshape<-function(nomin){
setwd(shps)
	
	Moc<-readShapePoly("Moccasin_Poly.shp")
	Moore<-readShapePoly("Moore_Poly.shp")
	Stan<-readShapePoly("Stanford_Poly.shp")
	#reproject the shapes into UTM
	
	for (n in nomin){
	setwd(filepath<-file.path(paste(home,"/", n, sep="")))	
	a<-raster(list.files(path=".",pattern = "albedo.t"))
	Ts<- raster(list.files(path=".",pattern="Ts11.t"))
	ndvi<- raster(list.files(path=".",pattern="ndvi.t"))
	lai<- raster(list.files(path=".",pattern="LAI.t"))
	rn <-raster(list.files(path=".",pattern="Rn.t"))
	g<-raster(list.files(path=".",pattern="G.tif"))
	
	extent(ndvi) <- extent(Moc)
	mocr <- rasterize(Moc,ndvi, mask = T)
	#extent(ndvi) <- extent(Moore)
	#moor <- rasterize(Moore,ndvi, mask = T)
	#extent(ndvi) <- extent(Stan)
	#stanr <- rasterize(Stan,ndvi, mask = T)
writeRaster(mocr, file = Moccasin_ndvi, sep = ",", row.names = F, col.names = F, qmethod = "double")

#writeRaster(moor, file = Moore_ndvi, sep = ",", row.names = F, col.names = F, qmethod = "double")


#writeRaster(stanr, file = Stanford_ndvi, sep = ",", row.names = F, col.names = F, qmethod = "double")
	
#shps_data<-list.files(path=".",pattern = ".shp$")#the dollar sign isolates the .shp from the .shp.xml files.
#require(maps)
#require(maptools)
#len<-length(shps_data) 
#files_I_want = shps_data[c(1:len)]
 #shp<-lapply(files_I_want, readShapePoly) 
	#for(i in files_I_want){
	#extent(ndvi) <- extent(shp)
	#rn <- rasterize(shp,ndvi, mask = T)		
		#}
	}
	}