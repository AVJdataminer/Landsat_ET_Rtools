#to estimate at-surface reflaectance band by band
#clac surface reflectance using MODTRAN
#Pair = air pressure in kPa
#Kt = clearness coef of the air 0-1
#W =Precipitable water in the atmophere in mm
#zen = Solar zenith angle in radians

SurfR<-function(Pair, Kt,W, zen){
	setwd(tiffs)
b1<- raster(list.files(path=".",pattern="B1.T"))
b2<- raster(list.files(path=".",pattern="B2.T"))
b3<- raster(list.files(path=".",pattern="B3.T"))
b4<- raster(list.files(path=".",pattern="B4.T"))
b5<- raster(list.files(path=".",pattern="B5.T"))
b6<- raster(list.files(path=".",pattern="B6.T"))
b7<- raster(list.files(path=".",pattern="B7.T"))
b9<- raster(list.files(path=".",pattern="B9.T"))

#MODTRAN coeffcients
B1C1=0.987; B2C1 =2.319;B3C1= 0.951;B4C1 = 0.375;B5C1= 0.234;B6C1= 0.365; 
B1C2=-0.00071; B2C2 =-0.00016;B3C2=  -0.00033;B4C2 = -0.00048;B5C2=  -0.00101;B6C2=  -0.00097; 
B1C3=0.000036 ;B2C3=0.000105 ;B3C3=0.00028;B4C3= 0.005018 ;B5C3=0.004336;B6C3= 0.004296;
B1C4=0.0880; B2C4=0.0437; B3C4=0.0875;B4C4= 0.1355 ;B5C4=0.0560; B6C4=0.0155 ;
B1C5=0.0789; B2C5=-1.2697;B3C5= 0.1014;B4C5= 0.6621;B5C5= 0.7757 ;B6C5=0.639; 
B1Pab=0.0726;B2Pab= 0.0597;B3Pab= 0.0344;B4Pab= 0.0193;B5Pab= 0.0180;B6Pab= 0.0152; 
	
TinB1 = B1C1*exp(((B1C2*Pair)/(Kt*1))-((B1C3*W+B1C4)/cos(zen)))+B1C5
TinB1 = B1C1*exp(((B1C2*Pair)/(Kt*1))-((B1C3*W+B1C4)/cos(zen)))+B1C5	
	
	
}