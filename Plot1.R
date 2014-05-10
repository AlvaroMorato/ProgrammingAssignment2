## Plot a graphic for Exploratory data course

## Fist at all, open de data from the working directory, an then extract the data
## that is required for the graph.
## The subsetting is made using a logical vector from date
## Un huevo de problemas
## The date and time is converted to POSIX formats, and used directly


## Open and extract data

powerconsum <- read.csv2("~/household_power_consumption.txt", 
                         header = TRUE, sep = ";", na.strings = "?",
                         colClasses = "character")

date1 <- powerconsum[ , 1] ## only for subsetting

GAP <- powerconsum[[3]]

remove(powerconsum)  ## for memory save

## logical vector
datef <- (date1 == "1/2/2007" | date1 == "2/2/2007")


dias <- date1[datef]



GAP <- as.numeric(GAP[datef])               

remove(date1, datef) ## for memory save

## PLOT HISTOGRAM

hist(GAP, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency",
     cex.axis = 0.7, cex.lab = 0.7)

remove(GAP, dias)

dev.copy(png, filename = "Plot1.png", width = 480, height = 480)
dev.off()
