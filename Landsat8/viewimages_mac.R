#this function reads in Landsat 8 data files and creates image visualization plots
#also creates stacks RGB and NIR,R,G
viewimages<-function(n){
	setwd(filepath<-file.path(paste(home,"/", n, sep="")))
#read in the raster files
N<- raster(list.files(path=".",pattern = "B5.T"))
R<-raster(list.files(path=".",pattern = "B4"))
G<- raster(list.files(path=".",pattern = "B3.T"))
TH<-raster(list.files(path=".",pattern = "B10"))
B<- raster(list.files(path=".",pattern = "B2.T"))
RGB<-stack(R,G,B)
NRG<-stack(N,R,G)
brick1<-brick(RGB)
brick2<-brick(NRG)
par(mfrow= c(1,3))
image.plot(R, main = "Red Band")
image.plot(G, main = "Green Band")
image.plot(B, main = "Blue Band")
#windows( ) # for opening new plot window on a pc
x11() #for opening a new plot window on a mac
plotRGB(brick1, main = "Visible Bands")
#windows( ) # for opening new plot window on a pc
x11()
par(mfrow= c(1,3))
image.plot(TH, main = "Thermal band 10")
image.plot(N, main = "Near Infrared Band")
plotRGB(brick2)
setwd(home)	
}
