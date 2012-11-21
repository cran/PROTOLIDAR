\name{Height_canopy_function}
\alias{Height_canopy_function}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Height of the canopy measured with LIDAR scan.
}
\description{
From the LIDAR dataset can be calculate the height of the grapevine plant. The function returns the average, minimum and maximum value of the height measured in meters.
}
\usage{
Height_canopy_function(data_3D, distance_left, distance_right, min_canopy, max_canopy)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data_3D}{
data_3D is the output from Extract_plant_3D_function.
}
  \item{distance_left}{
the left distance of the plant, generally here we can write the half of the distance between plants, but is better the real distance from the center of the plant. Measured in meters.
}
  \item{distance_right}{
the right distance of the plant, generally here we can write the half of the distance between plants, but is better the real distance from the center of the plant. Measured in meters.
}
  \item{min_canopy}{
the minimum height of the canopy, measured in meters.
}
  \item{max_canopy}{
the maximum height of the canopy, measured in meters.
}
}
\details{
Maximum and minimum values of height of canopy could be approximative values.
}
\author{
Monica Fernanda Rinaldi
}
\examples{
## Should be DIRECTLY executable !! ----
## Data_3D is the output from the Extrac_plant_3D_function.
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
   data_3D <- Extract_plant_3D_function(out,z_min,z_max,y_min,y_max,distance_left,distance_right)
   min_canopy <- 0.4 # is the minimum height of the canopy, approximately . Measured in meters.
   max_canopy <- 2   # is the maximum height of the canopy, approximately . Measured in meters.

## The function is currently defined as
Height_canopy_function <- function(data_3D,distance_left,distance_right,min_canopy,max_canopy){
  x_plant <- y_plant <- z_plant <- NULL
  canopy <- subset(data_3D, data_3D$z_plant >= distance_left & data_3D$z_plant <= distance_right & data_3D$y_plant >= min_canopy & data_3D$y_plant <= max_canopy,select=c(x_plant,y_plant,z_plant))
  mean_height_canopy <- mean(canopy[,2])
  min_height_canopy  <- min(canopy[,2])
  max_height_canopy  <- max(canopy[,2])
  return(data.frame(mean_height_canopy,min_height_canopy,max_height_canopy))
  }
  height_canopy <- Height_canopy_function(data_3D,distance_left,distance_right,min_canopy,max_canopy)[,1]
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{array}
\keyword{math}