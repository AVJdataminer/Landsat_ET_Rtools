
#Read metadata text file
readMetadata <- function(filename) {
	meta <- readIniFile(filename)
	meta <- meta[,-1]
	meta[,2] <- gsub('/"', "", meta[,2])
	return(meta)
}

#Read the Landsat calibration paramter file (CPF) via ftp
#readLandsatCPF <- function(sensor, filename) {
#	if (sensor == "ETM+")   
#		ftpdir <- "ftp://edclpdsftp.cr.usgs.gov/pub/data/CPF/ETM/"
#	else  
#		ftpdir <- "ftp://edclpdsftp.cr.usgs.gov/pub/data/CPF/TM/" 
	
#	n <- nchar(filename)
#	cpf_filename <- paste(substr(filename, 1, n-3), ".", substr(filename,n-1,n), sep="")
#	download.file(paste(ftpdir, cpf_filename, sep=""), filename)
#	cpf <- readMetadata(filename)
#	return(cpf)
#}

#parse Landsat metadata file and extract needed parameters
landsat <- function(filename) {
	
	pars <- readMetadata(filename)
	pathname <- dirname(filename)
	
	spacecraft	   			<- pars[pars[,1]=="SPACECRAFT_ID",2]
	sensor	        	    	<-  pars[pars[,1]=="SENSOR_ID",2]
	acquisition_date			<-  pars[pars[,1]=="ACQUISITION_DATE",2]
	product_creation_date		<-  pars[pars[,1]=="PRODUCT_CREATION_TIME",2]
	sun_elevation 			<- as.numeric(pars[pars[,1]=="SUN_ELEVATION",2])
	sun_azimuth 			<- as.numeric(pars[pars[,1]=="SUN_AZIMUTH",2])
	cpf_filename			<- pars[pars[,1]=="CPF_FILE_NAME",2]
	
	starting_row			<- pars[pars[,1]=="STARTING_ROW",2]
	ending_row				<- pars[pars[,1]=="ENDING_ROW",2]
	zone					<- paste("p",pars[pars[,1]=="WRS_PATH",2],"r", ifelse(starting_row==ending_row,starting_row,paste(starting_row,"-",ending_row, sep="")),sep="")
	
	bandcomb       			<- pars[pars[,1]=="BAND_COMBINATION",2]
	n_bands              		<- as.integer(nchar(bandcomb))
	bandn    <- rep(NA,n_bands)
	for (i in 1:n_bands) {
		bandn[i] <- paste("BAND", substr(bandcomb,i,i), sep="")
	}
	
	if (sensor == "ETM+") {                        
		bandn[6] <- "BAND61"
		bandn[7] <- "BAND62"
	}
	
	lmax      <- rep(NA, n_bands)
	lmin       <- rep(NA, n_bands)
	qcalmax <- rep(NA, n_bands)
	qcalmin  <- rep(NA, n_bands)
	band_filenames  <- rep(NA, n_bands)
	
	names(lmax) 	  		<- bandn	
	names(lmin) 	  		<- bandn	
	names(qcalmax) 			<- bandn	
	names(qcalmin)  			<- bandn	
	names(band_filenames)  	<- bandn	
	
	for (i in 1:n_bands) {
		lmax[i]      		<- as.numeric(pars[pars[,1]==paste("LMAX_", bandn[i], sep=""),2])
		lmin[i]       		<- as.numeric(pars[pars[,1]==paste("LMIN_", bandn[i], sep=""),2])
		qcalmax[i] 		<- as.numeric(pars[pars[,1]==paste("QCALMAX_", bandn[i], sep=""),2])
		qcalmin[i]  		<- as.numeric(pars[pars[,1]==paste("QCALMIN_", bandn[i], sep=""),2])
		band_filenames[i]  	<- paste(pathname, '/', pars[pars[,1]==paste( bandn[i], "_FILE_NAME", sep=""),2], sep='')
	}
	
	#cpf <- readLandsatCPF(sensor, cpf_filename)
	#acquisition_time <- cpf[cpf[,1]=="Turn_Around_Time",2]
	
	if (sensor == "ETM+") {			
		img <- new("LandsatETMp")	
		img@bands <- stack(c(band_filenames["BAND1"], band_filenames["BAND2"], band_filenames["BAND3"], band_filenames["BAND4"], band_filenames["BAND5"], band_filenames["BAND7"]))
		img@thermal <- stack(c(band_filenames["BAND61"], band_filenames["BAND62"]))
		img@panchromatic <- raster(band_filenames["BAND8"])
	}
	else {		stop('not done yet')	}			
	
	img@spacecraft	   		<- spacecraft		
	img@sensor	        	<-  sensor		
	img@product_creation_date	<-  product_creation_date		
	img@acquisition_date		<-  acquisition_date		
	#img@acquisition_time		<- acquisition_time		
	img@sun_elevation 		<- sun_elevation				
	img@sun_azimuth			<- sun_azimuth		
	img@cpf_filename		<- cpf_filename		
	img@meta_filename		<- filename		
	img@band_filenames 		<- band_filenames		
	img@zone				<- zone		
	img@lmax	     			<- lmax		
	img@lmin          			<- lmin		
	img@qcalmax			<- qcalmax		
	img@qcalmin			<- qcalmin		

	return (img)
 }
 
