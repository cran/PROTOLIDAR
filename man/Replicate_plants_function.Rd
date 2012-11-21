\name{Replicate_plants_function}
\alias{Replicate_plants_function}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Replicate plants function.
}
\description{
This function helped to make 3D maps in GRASS GIS when you have only one scan of a plant. First needed rotate the plants and them could be replicate each plant in the row.
}
\usage{
Replicate_plants_function(plants_rotate, data_3D, latitude, longitude)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{plants_rotate}{
here need use the output of Rotate_function.
}
  \item{data_3D}{
here need use the output of Exract_plant_3D_function and Extract_plant_grapevine_function.
}
  \item{latitude}{
here need the latitudine of each plant.
}
  \item{longitude}{
here need the longitude of each plant.
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
   data_3D <- Extract_plant_3D_function(out,z_min,z_max,y_min,y_max,distance_left,distance_right)
   latitude  <- c(396626.74528,396627.689076,396628.632872,396629.576669,396630.520465)
   longitude <- c(4566489.007441,4566490.032831,4566491.058221,4566492.083612,4566493.109002)
   angle <- 14.96  
   plants_rotate <- Rotate_function(data_3D,angle)

## The function is currently defined as

Replicate_plants_function <- function(plants_rotate,data_3D,latitude,longitude){
  x_rot <- plants_rotate[,1]
  y_rot <- plants_rotate[,2]
  z     <- data_3D[,2]
  rep_z <- rep(z,length(latitude)) 
  rep_X <- rep(x_rot,length(latitude))
  rep_Y <- rep(y_rot,length(latitude))
  dup_xcoord <- rep(latitude ,each=length(x_rot))
  dup_ycoord <- rep(longitude,each=length(y_rot))
  XCOORD <- rep_X + dup_xcoord
  YCOORD <- rep_Y + dup_ycoord
  return (data.frame(XCOORD,YCOORD,z))
  }
  rep <- Replicate_plants_function(plants_rotate,data_3D,latitude,longitude)
   X <- rep[,1]
   Y <- rep[,2]
   Z <- rep[,3]
   ## plot
   par(mfcol=c(1,2))
   plot(X,Y)
   plot(X,Z)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{array}
\keyword{aplot}