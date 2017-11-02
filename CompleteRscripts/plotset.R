#view ET variables and landsat products
plotset<-function(nomin){
	for (n in nomin){
	setwd(filepath<-file.path(paste(home,"/", n, sep="")))	
	a<-raster(list.files(path=".",pattern = "albedo.t"))
	Ts<- raster(list.files(path=".",pattern="Ts11.t"))
	ndvi<- raster(list.files(path=".",pattern="ndvi.t"))
	lai<- raster(list.files(path=".",pattern="LAI.t"))
	rn <-raster(list.files(path=".",pattern="Rn.t"))
	g<-raster(list.files(path=".",pattern="G.tif"))
	
	#make short name  turn DOY to date
	shortn = substr(list.files(path=".",pattern = "B5.T"),10,16)
	gdate = strptime(shortn, "%Y %j")
	year= substr(gdate,1,4)
	month = substr(gdate,6,7)
	day = substr(gdate,9,10)
	ndate = mdy.date(as.numeric(month),as.numeric(day), as.numeric(year))

#x11()                                  # opens the window
pdf("albedo.pdf")
image.plot(a, main = paste(ndate,"Albedo.tif",sep =" "), zlim=c(0,1))
dev.off()

pdf("LST.pdf")
image.plot(Ts, main = paste(ndate,"Land Surface Temp K",sep = " "),zlim=c(minValue(Ts),maxValue(Ts)))
dev.off()

pdf("ndvi.pdf")
image.plot(ndvi, main = paste(ndate,"NDVI",sep = " "),zlim=c(-1,1))
dev.off()

pdf('LAI.pdf')
image.plot(lai, main = paste(ndate, "Leaf Area Index",sep = " "), zlim=c(minValue(lai),maxValue(lai)))
dev.off()

pdf("Rn.pdf")
image.plot(rn, main = paste(ndate,"Net Radiation Wm^2", sep = " "),zlim=c(minValue(rn),maxValue(rn)))
dev.off()

pdf('Soil heat flux.pdf')
image.plot(g, main =paste(ndate, "Soil Heat Flux W/m^2", sep =" "),zlim=c(minValue(g),maxValue(g)))  	
 dev.off() 
 }
setwd(home)
}
