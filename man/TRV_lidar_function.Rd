\name{TRV_lidar_function}
\alias{TRV_lidar_function}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Tree Row Volume (TRV).
}
\description{
TRV measured in m^3*ha^-1.
}
\usage{
TRV_lidar_function(height_canopy, width_canopy, row_spacing)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{height_canopy}{
use Height_canopy_function, measured in meters.
}
  \item{width_canopy}{
use Width_canopy_function, measured in meters.
}
  \item{row_spacing}{
row spacing measured in meters.
}
}
\references{
Byers, R.E., 1987. Tree-row-volume Spraying Rate Calculator for Apples. HortScience 22, 506-507.

Gil, E., Escola, A., Rosell, J.R., Planas, S., Val, L., 2007. Variable rate application of plant protection products in vineyard using ultrasonic sensors. Crop Prot. 26, 1287-1297.

Gil, E., Escola, A., 2009. Design of a Decision Support Method to Determinate Volume Rate for Vineyard Spraying. ASABE. 25, 145-151.

}
\author{
Monica Fernanda Rinaldi
}
\examples{
## Should be DIRECTLY executable !! ----
## Here need use:  Height_canopy_function and Width_canopy_function or values measured manually.
 height_canopy <- 1.995 ## the value is the result of Height_canopy_function.
 width_canopy <- 0.426 ## the value is the result of Width_canopy_function.
 row_spacing = 2.9 ## measured in meters.

## The function is currently defined as
TRV_lidar_function <- function(height_canopy,width_canopy,row_spacing){
TRV <-height_canopy * width_canopy * 10000  / row_spacing
return(TRV)
  }
  TRV <- TRV_lidar_function(height_canopy,width_canopy,row_spacing)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{array}