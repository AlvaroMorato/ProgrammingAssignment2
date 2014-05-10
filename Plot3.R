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

date1 <- powerconsum[ , 1]
time <- powerconsum[[2]]
Sub1 <- powerconsum[[7]]
Sub2 <- powerconsum[[8]]
Sub3 <- powerconsum[[9]]

remove(powerconsum) ## for memory save

## logical vector

datef <- (date1 == "1/2/2007" | date1 == "2/2/2007")


dias <- date1[datef]
tiempo <- time[datef]

junto <- paste(dias, tiempo)
temporal <- as.POSIXlt(junto, format = "%d/%m/%Y %H:%M:%S")
remove(dias, tiempo)
        
Sub1 <- as.numeric(Sub1[datef])
Sub2 <- as.numeric(Sub2[datef])        
Sub3 <- as.numeric(Sub3[datef])

remove(date1, datef, time, junto)

## PLOTTING and adding (colud be more compact)

plot(temporal, Sub1, type = "l", xlab = "",
     ylab = "Energy sub metering", 
     cex.axis = 0.7, cex.lab = 0.8)
points(temporal, Sub2, type = "l", col = "red")
points(temporal, Sub3, type = "l", col = "blue")


## labels remain in spanish (local settings)
## for the legend

legend("topright", c("Sub_metering_1", "Sub_metering_2",
         "Sub_metering_3"), lty = "solid", 
       col = c("black", "red", "blue"), cex = 0.7)


dev.copy(png, filename = "Plot3.png", width = 480, height = 480)
dev.off()
