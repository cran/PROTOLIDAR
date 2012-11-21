\name{LWA_lidar_function}
\alias{LWA_lidar_function}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Leaf Wall Area (LWA) measured in m^2*ha^-1.
}
\description{
LWA need as inputs the height of canopy (m) the ground area (generally one hectare, measured in m^2) and the row spacing (m).
}
\usage{
LWA_lidar_function(height_canopy, ground_area, row_spacing)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{height_canopy}{
height of canopy manually or measured with Height_canopy_function.
}
  \item{ground_area}{
is the orchard area measured in m^2, generally one hectare.
}
  \item{row_spacing}{
row spacing measured in meters.
}
}
\references{
Walklate, P.J., Cross, J.V., 2011. An examination of Leaf-Wall-Area dose expression. Crop Protection 35, 132-134.
}
\author{
Monica Fernanda Rinaldi
}
\examples{
## Should be DIRECTLY executable !! ----
  height_canopy = 2 ## this value is the maximum of Height_canopy_function.
  ground_area = 10000 ## generally is one hectare in m^2.
  row_spacing = 2.9 ## measured in meters.

## The function is currently defined as
function(height_canopy,ground_area,row_spacing){

 LWA <- 2* height_canopy * (ground_area/row_spacing)

return(LWA)

  }
  LWA_lidar_function(height_canopy,ground_area,row_spacing)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{math}