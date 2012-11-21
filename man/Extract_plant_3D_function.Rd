\name{Extract_plant_3D_function}
\alias{Extract_plant_3D_function}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Extract plant 3D (grapevine).
}
\description{
This function move the axes x,y,z to the center of the plant. This output could be exported and transformed in GRASS GIS in 3D maps.
}
\usage{
Extract_plant_3D_function(out, z_min, z_max, y_min, y_max, distance_left, distance_right)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{out}{
out is a data frame output from Extract_plant_grapevine_function.
}
  \item{z_min}{
the minimum position of the stem in z measured in meters.
}
  \item{z_max}{
the maximum position of the stem in z measured in meters.
}
  \item{y_min}{
the minimum position of the stem in y measured in meters.
}
  \item{y_max}{
the maximum position of the stem in y measured in meters.
}
  \item{distance_left}{
the left distance of the plant, generally here we can write the half of the distance between plants, but is better the real distance from the center of the plant. Measured in meters.
}
  \item{distance_right}{
the right distance of the plant, generally here we can write the half of the distance between plants, but is better the real distance from the center of the plant. Measured in meters.
}
}
\author{
Monica Fernanda Rinaldi
}
\examples{
## Should be DIRECTLY executable !!
## out come from Extract_plant_grapevine_function. The other parameters or inputs are needed to write before.
## For example:
   data (LIDAR_data)
   x <- LIDAR_data[,1]
   y <- LIDAR_data[,2]
   z <- LIDAR_data[,3]
   zdistance <- 190 # total LIDAR scan distance measured in cm.
   miny <- 0 # minimum height of the plant measured in cm.
   maxy <- 2000 # maximum height of the plant measured in cm.
   minx <- 450 # minimum width from where LIDAR starts to measure (cm).
   maxx <- 1470# maximum width from where LIDAR starts to measure (cm).
   minz <- 0 # the beginning of the LIDAR scan measured in cm.
   maxz <- 186 # the end of the LIDAR scan measured in cm (length of interest).
   out <- Extract_plant_grapevine_function(x,y,z,zdistance,miny,maxy,minx,maxx,minz,maxz)
   z_min <- 1.1 
   z_max <- 1.13
   y_min <- 0.4
   y_max <- 0.5
   distance_left <- -0.6
   distance_right <- 0.51
   

## The function is currently defined as

Extract_plant_3D_function <- function(out,z_min,z_max,y_min,y_max,distance_left,distance_right){ 
  x_cm <- y_cm <- z_cm <- NULL
  data_stem <- subset(out,out$y_cm > y_min & out$y_cm<= y_max & out$z_cm >= z_min  & out$z_cm <= z_max,select=c(x_cm,y_cm,z_cm))
  x_c       <- out$x_cm - min(data_stem$x_cm)
  y_c       <- out$y_cm
  z_c       <- out$z_cm - min(data_stem$z_cm)
  data_cero <- data.frame(x_c,y_c,z_c)
  data_plant <- subset(data_cero, data_cero$z_c >= distance_left & data_cero$z_c <= distance_right,select=c(x_c,y_c,z_c))
  x_plant <- data_plant[,1]
  y_plant <- data_plant[,2]
  z_plant <- data_plant[,3]
  return(data.frame(x_plant,y_plant,z_plant))
  }
  data_3D <- Extract_plant_3D_function(out,z_min,z_max,y_min,y_max,distance_left,distance_right)
  x_plant <- data_3D[,1]
  y_plant <- data_3D[,2]
  z_plant <- data_3D[,3]
  # plot
  par(mfcol=c(2,2))
    plot(x_plant,y_plant,pch=20,cex=.4)
    plot(x_plant,z_plant,pch=20,cex=.4)
    plot(z_plant,y_plant,pch=20,cex=.4)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{array}
\keyword{aplot}
