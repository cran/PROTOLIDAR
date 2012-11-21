\name{LIDAR_data}
\alias{LIDAR_data}
\docType{data}
\title{
LIDAR data.
}
\description{
LIDAR scan dataset in BBCH 65 (grapevine).Where x is width, y is height and z is front view or path of the tractor.
}
\usage{data(LIDAR_data)}
\format{
  A data frame with 10108 observations on the following 3 variables.
  \describe{
    \item{\code{V1}}{a numeric vector that represents x value or width}
    \item{\code{V2}}{a numeric vector that represents y value or height}
    \item{\code{V3}}{a numeric vector that represents z value or front view}
  }
}
\details{
The laser scanner used was a LMS-200 model (Sick,Dusseldorf,Germany), a fully-automatic divergent laser scanner based on the measurement of time-of-flight (TOF) with an accurancy of 15 mm in a single shoot measurement and 5 mm standard deviation in a range upto 8m. The time between the transmission and the reception of the pulsed near-infrared laser beam is used to measure the distance between the scanner and the reflecting object surface. The laser beam is deflected by a rotating mirror turning at 4500 rpm, which results in a fan shaped scan pattern where the maximum scanning angle is 180 degree.
}
\source{
LIDAR scan in BBCH 65 stage.
}
\references{
Llorens,J.,Gil,E.,Llop,J.,Escola,A.,2011. Ultrasonic and LIDAR Sensors for Electronic Canopy Characterization in Vineyards: Advances to Improve Pesticide Application Methods. Sensors 11, 2177-2194.
}
\examples{
## LIDAR_data is the input to Extract_plant_grapevine_function.

data(LIDAR_data, package ='PROTOLIDAR')

x = LIDAR_data[,1]
y = LIDAR_data[,2]
z = LIDAR_data[,3]
}
\keyword{datasets}