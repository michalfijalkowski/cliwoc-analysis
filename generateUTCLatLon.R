#read data from csv
data <- read.csv("raw_data.csv", sep=",")
df <- data.frame(data)

#remove unused columns
keepColumns <- c("LogbookIdent", "UTC", "Lon3", "Lat3")
tidyData <- df[keepColumns]

#check utility of data in each row
tidyData <- tidyData[!apply(tidyData, 1, function(x) any(x=="")),] 
tidyData <- tidyData[!is.na(tidyData$Lon3), ]
tidyData <- tidyData[!is.na(tidyData$Lat3), ]
tidyData <- tidyData[!is.na(tidyData$UTC), ]

countData <- rapply(tidyData,function(x)length(unique(x)))


write.csv(tidyData,"D:\\Rprojects\\spdb\\UTCLatLon.csv", row.names = FALSE)