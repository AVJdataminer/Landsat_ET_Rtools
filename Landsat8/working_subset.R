#temporary code to read in subsets from ndvi and use as masks for other data sets
setwd(filepath<-file.path(masks))
m1<-raster(list.files(path=".",pattern = "moc_mask.tif$"))
m2<-raster(list.files(path=".",pattern = "mor_mask.tif$"))
m3<-raster(list.files(path=".",pattern = "stan_mask.tif$"))

t <- overlay(a, m1, fun=function(x, y){ a[m1<1] <- NA; return(x)  } )

# set values below 100 to NA. 
fun <- function(x) { x[x<100] <- NA; return(x) }
rc2 <- calc(r, fun)


#for (n in nomin){
	setwd(filepath<-file.path(paste(home,"/", n, sep="")))	
	a<-raster(list.files(path=".",pattern = "albedo.t"))
	Ts<- raster(list.files(path=".",pattern="Ts11.t"))
	#ndvi<- raster(list.files(path=".",pattern="ndvi.t"))
	lai<- raster(list.files(path=".",pattern="LAI.t"))
	rn <-raster(list.files(path=".",pattern="Rn.t"))
	g<-raster(list.files(path=".",pattern="G.tif"))
	
	extent(a) <- extent(m1)
	u<-mask(a,m1)
	mocr <- rasterize(Moc,ndvi, mask = T)
	#extent(ndvi) <- extent(Moore)
	#moor <- rasterize(Moore,ndvi, mask = T)
	#extent(ndvi) <- extent(Stan)
	#stanr <- rasterize(Stan,ndvi, mask = T)
writeRaster(mocr, file = Moccasin_ndvi, sep = ",", row.names = F, col.names = F, qmethod = "double")

