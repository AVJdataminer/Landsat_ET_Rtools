#subset the visible raster stack 
class       : Extent 
xmin        = 437606.3 
xmax        = 510116.3 
ymin        = 5100728 
ymax        = 5147138 

 #g<-raster(files_I_want[i])
  bb <- extent(xmin, xmax, ymin, ymax)
  r <- crop(RGB, bb)
writeRaster(r,filename=paste(longn,"_","rgb.tif", sep=""),format="GTiff", overwrite=TRUE)
