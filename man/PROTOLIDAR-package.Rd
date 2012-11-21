\name{PROTOLIDAR-package}
\alias{PROTOLIDAR-package}
\alias{PROTOLIDAR}
\docType{package}
\title{
PRocess TOol LIdar DAta in R.
}
\description{
PROTOLIDAR package contains functions for analyze the LIDAR scan of plants (grapevine) and make with the outputs 3D maps in GRASS-GIS.
}
\details{
\tabular{ll}{
Package: \tab PROTOLIDAR\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2012-12-14\cr
License: \tab GPL(>=2)\cr
LazyLoad: \tab yes\cr
}
This package help to analyze the LIDAR scan and extract the grapevine plant for see the plant in 3D GRASS GIS maps.

The package contains the following dataset and functions:

 LIDAR_data is the dataset of the LIDAR scan. Represent the grapevine plant (BBCH 65).

 Extract_plant_grapevine_function: which cuts the excess data.
 
  Extract_plant_3D_function: helps to position the axis in the center of the plant.

   Height_canopy_function: to measure the height of canopy from the LIDAR scan.
   
   Width_canopy_function:to measure the width of canopy from the LIDAR scan.
    
   Number_LIDAR_points_function: to calculate the number of points into the canopy.

   LAI_function: to calculate the leaf area index.

   LWA_lidar_function:to calculate the leaf wall area.

   TRV_lidar_function: to calculate tree row volume in m^3*ha^-1.

   Rotate_function: to rotate plants to match with the planting line.

    Replicate_plants_function: to replicate plants.
}
\author{
Monica Fernanda Rinaldi<monica.rinaldi@gmail.com>

 Emilio Gil<emilio.gil@upc.edu>

 Jordi Llorens<jordi.llorens.calveras@upc.edu>

Maintainer: 
Monica Fernanda Rinaldi<monica.rinaldi@gmail.com>
}
\references{
Rinaldi, M. F.,2012. Modelling the impact of climate change on the Interaction between host and pest/pathogen phenologies at regional level: Trentino - Italy. Unpublished PhD diss. Doctoral School on the Agro-food System - Agrisystem - Cycle XXIV - Universita Cattolica del Sacro Cuore -UNICATT - Piacenza- Italy.
}
\keyword{datasets}
\keyword{array}
\keyword{aplot}
\keyword{math}
\seealso{PROTOLIDAR-package}
\examples{
## Should be DIRECTLY executable !! 
## For example:
   data (LIDAR_data)
   x <- LIDAR_data [,1]
   y <- LIDAR_data [,2]
   z <- LIDAR_data [,3]
   zdistance <- 190 # total LIDAR scan distance measured in cm.
   miny <- 0 # minimum height of the plant measured in cm.
   maxy <- 2000 # maximum height of the plant measured in cm.
   minx <- 450 # minimum width from where LIDAR starts to measure (cm).
   maxx <- 1470# maximum width from where LIDAR starts to measure (cm).
   minz <- 0 # the beginning of the LIDAR scan measured in cm.
   maxz <- 186 # the end of the LIDAR scan measured in cm (length of interest).
  
## The function is currently defined as
  Extract_plant_grapevine_function <- function(x,y,z,zdistance,miny,maxy,minx,maxx,minz,maxz){
      y <- -y
      y <- y-min(y)
      z<- (z*zdistance)/max(z)
      x_cm <- 0
      y_cm <- 0
      z_cm <- 0
      for (i in 1:length(x)){ 
        if (x[i] >= minx  && x[i] <= maxx && y[i] >= miny && y[i] <= maxy &&  z[i] >= minz  && z[i] <= maxz) {  
          y_cm[i] <- y[i]
          x_cm[i] <- x[i]
          z_cm[i] <- z[i]
        }
      }
      y_cm <- na.omit(y_cm[2:length(y_cm)])
      y_cm <- as.numeric((y_cm-min(y_cm))/1000)
      x_cm <- as.numeric(na.omit(x_cm[2:length(x_cm)])/1000)
      z_cm <- as.numeric(na.omit(z_cm[2:length(z_cm)])/100)
      return <- data.frame(x_cm,y_cm,z_cm)
    }
    out <- Extract_plant_grapevine_function(x,y,z,zdistance,miny,maxy,minx,maxx,minz,maxz)
      
       x = out[,1]
       y = out[,2]
       z = out[,3]
      # plot
       par(mfcol=c(2,2))
       plot(x,y,pch=20,cex=.4,xlab='Width (m)', ylab='Height (m)', main='Grapevine BBCH')
       plot(x,z,pch=20,cex=.4,xlab='Width (m)', ylab='Front (m)', main='Grapevine BBCH')
       plot(z,y,pch=20,cex=.4,xlab='Front (m)', ylab='Height (m)', main='Grapevine BBCH')
}