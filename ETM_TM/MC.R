#this function is for a Monte Carlo simulation analysis of LST layer

MC<-function(data, band){
	#subset to this size
	#b6(5500:6000,3500:4000)
	set.seed(1234)
	N = 10 #sets the number of simulations
	n.reject = 0 #counter of number of rejections
	k1 = 666.09 #coeffs for landsat 7
	k2 = 1282.71
	 if (band == 6) 
        band.coefs <- c(0.055376, 1.18, 607.76, 1260.56)
    if (band == 61) 
        band.coefs <- c(0.067087, -0.07, 666.09, 1282.71)
    if (band == 62) 
        band.coefs <- c(0.037205, 3.16, 666.09, 1282.7)
    results <- x
    x <- as.vector(as.matrix(x))
    x <- x * band.coefs[1] + band.coefs[2]
    x <- band.coefs[4]/log(band.coefs[3]/x + 1)
    if (class(results) == "SpatialGridDataFrame") 
        results@data[, 1] <- x
    else if (is.data.frame(results)) 
        results <- data.frame(matrix(x, nrow = nrow(results), 
            ncol = ncol(results)))
    else if (is.matrix(results)) 
        results <- matrix(x, nrow = nrow(results), ncol = ncol(results))
    else results <- x
    results
	for (i in 1:N){
		
		#d1 <-rnorm(i, mean =0 , sd = 1)
		d1 =  runif(i, min=273+34, max=273+ 91),
		d2 <-rnorm(i, mean =0 , sd = 1)
		hit = 

		LST = k2/(log(((k1*.9)/therm)+1))
		
		if ((abs(LST)< 273+34)& LST >273+ 91) #exceeds minimum record temp average
		n.reject = n.reject +1
		
	}	
	LST_out = raster(mean(LST))
	plot(LST_out)
}