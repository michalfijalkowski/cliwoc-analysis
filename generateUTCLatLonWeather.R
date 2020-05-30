#read data from csv
data <- read.csv("raw_data.csv", sep=",")
df <- data.frame(data)

#remove unused columns
keepColumns <- c("LogbookIdent", "UTC", "Lon3", "Lat3", "Gusts", "Rain", "Fog", "Snow", "Thunder", "Hail")
tidyData <- df[keepColumns]

#check utility of data in each row
tidyData <- tidyData[!apply(tidyData, 1, function(x) any(x=="")),] 
tidyData <- tidyData[!is.na(tidyData$Lon3), ]
tidyData <- tidyData[!is.na(tidyData$Lat3), ]
tidyData <- tidyData[!is.na(tidyData$UTC), ]
tidyData <- tidyData[!is.na(tidyData$Gusts), ]
tidyData <- tidyData[!is.na(tidyData$Rain), ]
tidyData <- tidyData[!is.na(tidyData$Fog), ]
tidyData <- tidyData[!is.na(tidyData$Snow), ]
tidyData <- tidyData[!is.na(tidyData$Thunder), ]
tidyData <- tidyData[!is.na(tidyData$Hail), ]




write.csv(tidyData,"D:\\Rprojects\\spdb\\UTCLatLonWeather.csv", row.names = FALSE)