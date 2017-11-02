#this function reads in Landsat 8 data files and creates image visualization plots
#also creates stacks RGB and NIR,R,G
viewimages<-function(filepath){
#read in the raster files
NIR<- list.files(path=filepath,pattern = "B5")
RED<-list.files(path=filepath,pattern = "B4")
GREEN<- list.files(path=filepath,pattern = "B3")
BLUE<- list.files(path=filepath,pattern = "B2")
THERM<-list.files(path=filepath,pattern = "B10")
setwd(filepath)
R<-raster(RED)
N<-raster(NIR)
G<-raster(GREEN)
B<-raster(BLUE)
TH<-raster(THERM)
RGB<-stack(R,G,B)
NRG<-stack(N,R,G)
brick1<-brick(RGB)
brick2<-brick(NRG)
par(mfrow= c(1,3))
image.plot(R, main = "Red Band")
image.plot(G, main = "Green Band")
image.plot(B, main = "Blue Band")
windows( ) # for opening new plot window on a pc
#x11() #for opening a new plot window on a mac
plotRGB(brick1, main = "Visible Bands")
windows( ) # for opening new plot window on a pc
#x11()
par(mfrow= c(1,3))
image.plot(TH, main = "Thermal band 10")
image.plot(N, main = "Near Infrared Band")
plotRGB(brick2)
setwd(home)	
}
