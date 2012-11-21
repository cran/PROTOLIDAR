\name{LAI_function}
\alias{LAI_function}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Leaf Area Index (LAI) calculate from LIDAR scan.
}
\description{
The LAI need in inputs the number of leaves, the leaf area (m^2),row distance (m) and in row spacing (m).
}
\usage{
LAI_function(Number_of_leaves_by_plant, Leaf_Area, row_distance, in_row_distance)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Number_of_leaves_by_plant}{
here need count the number of leaves of the plant.
}
  \item{Leaf_Area}{
here need calculate the leaf area, measured in m^2.
}
  \item{row_distance}{
the row distance of the orchard measured in meters.
}
  \item{in_row_distance}{
the in row distance or distance between plants of the orchard measured in meters.
}
}
\author{
Monica Fernanda Rinaldi
}
\examples{
## Should be DIRECTLY executable !! ----
## Here needed some inputs measured manually like leaf area (m^2) and number of leaves.
  number_of_leaves <- 420
  leaf_area <- 0.010 ## measured in m^2.
  row_distance <- 2.9 ## measured in meters.
  in_row_distance <- 1.4 ## measured in meters.

## The function is currently defined as
LAI_function <- function(Number_of_leaves_by_plant,Leaf_Area,in_row_distance){

 LAI <- Number_of_leaves_by_plant * Leaf_Area / in_row_distance

return(LAI)

  }
  LAI_function(number_of_leaves,leaf_area,in_row_distance)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{array}