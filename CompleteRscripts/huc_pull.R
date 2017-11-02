#read in hucs shapefile
require(maptools)
require(landsat)
require(rgdal)
require(raster)
require(fields)
require(maps)
require(scales)
require(shapefiles)
require(PBSmapping)
require(mapplots)
require(mapdata)
require(calibrate)
require(ggplot2)
huc_pull<-function(nomin){
	for (n in nomin){
setwd(hucs)
mt_hucs= readShapePoly('All_MT_huc10.shp')
bar <- fortify(mt_hucs, region = "Huc_10")

cfhuc=mt_hucs[which(mt_hucs$Huc_10=='1003010110')]

