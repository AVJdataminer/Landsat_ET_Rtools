#function to convert metadata to txt and rewrite to useable format
metcon<-function(nomin){
for(n in nomin){
	setwd(pathin)
	metfile<-readMetadata(list.files(path=pathin, pattern =paste(n,"_MTL",sep ="")))	
	df<-as.data.frame(metfile)
	mat = as.matrix(metfile)
	nums =as.numeric(metfile[ ,2])
	nams =(metfile[ ,1])
	metal = rbind(nams,nums)
	setwd(filepath<-file.path(paste(home,"/", n, sep="")))
	longn<-substr(list.files(path=".",pattern = "B5.T"),1,22)
	write.table(metal, file =paste(longn,"meta",sep =""), col.names = F)
	setwd(pathin)
	}
setwd(home)
}
