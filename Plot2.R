
## Plot a graphic for Exploratory data course

## Fist at all, open de data from the working directory, 
## and then extract the data that is required for the graph.
## The subsetting is made using a logical vector from date
## Un huevo de problemas
## The date and time is converted to POSIX formats, and used directly


## Open and extract data
powerconsum <- read.csv2("~/household_power_consumption.txt", 
                header = TRUE, sep = ";", na.strings = "?",
                colClasses = "character")

date1 <- powerconsum[ , 1]
time <- powerconsum[[2]]
GAP <- powerconsum[[3]]


remove(powerconsum) ## for memory cleaning

## logical vecto
datef <- (date1 == "1/2/2007" | date1 == "2/2/2007")


dias <- date1[datef]
tiempo <- time[datef]
## for date 
junto <- paste(dias, tiempo)
temporal <- as.POSIXlt(junto, format = "%d/%m/%Y %H:%M:%S")
remove(dias, tiempo)
## subsetting
GAP <- as.numeric(GAP[datef])               

remove(date1, datef)
## PLOTTING

plot(temporal, GAP, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)", 
     cex.axis = 0.7, cex.lab = 0.7) ## for size adjusting

## Labels remain in spanish (local settings)

remove(GAP, junto, temporal, time)
## copy to png in the wd

dev.copy(png, filename = "Plot2.png", width = 480, height = 480)
dev.off()
