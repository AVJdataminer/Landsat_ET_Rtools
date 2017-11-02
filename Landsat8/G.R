#clac soil heat flux
G = function(nomin){
	for (n in nomin){
setwd(filepath<-file.path(paste(home,"/", n, sep="")))
	Ts<- raster(list.files(path=".",pattern="Ts11.t"))
	ndvi<- raster(list.files(path=".",pattern="ndvi.t"))
	rn <-raster(list.files(path=".",pattern="Rn.t"))
	a<-raster(list.files(path= ".",pattern ="albedo.t"))
	GRn = (Ts/a)*(0.0038*a+0.0074*a^2)*(1-.98*ndvi^4)
	G = rn*GRn
		longn<-substr(list.files(path=".",pattern = "B5.T"),1,22)
writeRaster(G,filename=paste(longn,"G.tif",sep = ""), format="GTiff", overwrite=TRUE)
#plot(G)
	}
	setwd(home)
	}