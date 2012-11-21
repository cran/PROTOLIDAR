\name{Number_lidar_points_into_canopy_function}
\alias{Number_lidar_points_into_canopy_function}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Number of LIDAR points into the canopy.
}
\description{
This function describe the number of points measured with LIDAR scan into the canopy.
}
\usage{
Number_lidar_points_into_canopy_function(data_3D, distance_left, distance_right, min_canopy, max_canopy)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data_3D}{
data_3D is the output from Extract_plant_grapevine_function.
}
  \item{distance_left}{
the left distance of the plant, generally here we can write the half of the distance between plants, but is better the real distance from the center of the plant. Measured in meters.
}
  \item{distance_right}{
the right distance of the plant, generally here we can write the half of the distance between plants, but is better the real distance from the center of the plant. Measured in meters.
}
  \item{min_canopy}{
the minimum height of the canopy.
}
  \item{max_canopy}{
the maximum height of the canopy.
}
}
\author{
Monica Fernanda Rinaldi
}
\examples{
## Should be DIRECTLY executable !! ----
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
   min_canopy <- 0.4
   max_canopy <- 2

## The function is currently defined as
Number_LIDAR_points_into_canopy_function <- function (data_3D,distance_left,distance_right,min_canopy,max_canopy){
  x_plant <- y_plant <- z_plant <- NULL
  canopy <- subset(data_3D, data_3D$z_plant >= distance_left & data_3D$z_plant <= distance_right & data_3D$y_plant >= min_canopy & data_3D$y_plant <= max_canopy,select=c(x_plant,y_plant,z_plant))
  N_points <- length(canopy[,1])
  return (N_points)
  }
  Number_LIDAR_points_into_canopy_function(data_3D,distance_left,distance_right,min_canopy,max_canopy)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{math}