library(GISTools)
library(ggplot2)
library(ggmap)


#read data from csv
data <- read.csv("raw_data.csv", sep=",")
df <- data.frame(data)
#remove unused columns
keepColumns <- c("Lon3", "Lat3")
tidyData <- df[keepColumns]

#check utility of data in each row
tidyData <- tidyData[!is.na(tidyData$Lon3), ]
tidyData <- tidyData[!is.na(tidyData$Lat3), ]

pts <- tidyData
sp = SpatialPoints(pts)
library(rworldmap)
map <- getMap(resolution = "low")


breach.dens = kde.points(sp,lims=map)
# Plot the result
level.plot(breach.dens)
# Plot census tract boundaries
plot(map,add=TRUE)

#plot points not in map
#plot(pts)











