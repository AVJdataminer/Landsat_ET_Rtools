#calc the net radiation from Landsat 8
Rn<-function(nomin){
	for(n in nomin){
setwd(filepath<-file.path(paste(home,"/", n, sep="")))
nom = substr(list.files(path = ".", pattern = "B5"),1,22)
indat <-read.table(paste(nom,"meta", sep = ""), header = T)
attach(indat)
zen = cos(90-SUN_ELEVATION)
	#calculate the shortwave incoming
DOY = as.numeric(substr(list.files(path=".",pattern="B1.T"),14,16))
dr = 1+0.033*cos(DOY*((2*pi)/365))
Tw = 0.75+2E-5*z
Rsin<- 1367*cos(zen)*dr
Ea = 0.85*(-log((Tw)^0.09))
	a<-raster(list.files(path= ".",pattern ="albedo.t"))
	E0<- raster(list.files(path=".",pattern="E0"))
	Ts<- raster(list.files(path=".",pattern="Ts11.t"))
	Tsm<-cellStats(Ts, 'min')
	SBcons= 5.67E-8
	Rsin = Rsin #sw downwelling radiation
	RLIn<-Ea*SBcons*(Tsm)^4
	RLout<-E0*SBcons*(Ts)^4
	Rn<-Rsin-(a*Rsin)+RLIn-RLout-(1-E0)*RLIn
	#plot(Rn)

writeRaster(Rn,filename=paste(nom,"Rn.tif",sep = ""), format="GTiff", overwrite=TRUE)
}

setwd(home)
}