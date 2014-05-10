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

date1 <- powerconsum[ , 1]  ## Date
time <- powerconsum[[2]]    ## Time
GAP <- powerconsum[[3]]
GRP <- powerconsum[[4]]
Volt <- powerconsum[[5]]
Sub1 <- powerconsum[[7]]
Sub2 <- powerconsum[[8]]
Sub3 <- powerconsum[[9]]

remove(powerconsum) ## for memory save

datef <- (date1 == "1/2/2007" | date1 == "2/2/2007")


dias <- date1[datef]
tiempo <- time[datef]

junto <- paste(dias, tiempo)
temporal <- as.POSIXlt(junto, format = "%d/%m/%Y %H:%M:%S")
remove(dias, tiempo)

GAP <- as.numeric(GAP[datef])               
GRP <- as.numeric(GRP[datef])                
Volt <- as.numeric(Volt[datef]) 
Sub1 <- as.numeric(Sub1[datef])
Sub2 <- as.numeric(Sub2[datef])        
Sub3 <- as.numeric(Sub3[datef])

remove(date1, datef, time, junto)

## Setting layout in canvas

par(mfrow = c(2,2))

## PLOTTING first graph

plot(temporal, GAP, type = "l", xlab = "", 
     ylab = "Global Active Power", 
     cex.axis = 0.7, cex.lab = 0.6) ## for size adjusting

## PLOTTIN second graph

plot(temporal, Volt, type = "l", xlab = "datetime", 
     ylab = "Voltage", 
     cex.axis = 0.7, cex.lab = 0.6)

## PLOTTING and adding third graph

plot(temporal, Sub1, type = "l", xlab = "",
     ylab = "Energy sub metering", 
     cex.axis = 0.7, cex.lab = 0.6)
points(temporal, Sub2, type = "l", col = "red")
points(temporal, Sub3, type = "l", col = "blue")

## labels remain in spanish (local settings)
## for the legend of third graph

legend("topright", c("Sub_metering_1", "Sub_metering_2",
        "Sub_metering_3"), lty = "solid", 
        col = c("black", "red", "blue"), bty = "n", box.lty = "blank", cex = 0.6, inset = c(0.06, 0.01) )

## PLOTTING graph 4

plot(temporal, GRP, type = "l", xlab = "datetime",
     ylab = "Global_reactive_power", 
     cex.axis = 0.7 , cex.lab = 0.5)




dev.copy(png, filename = "Plot4.png", width = 480, height = 480)
dev.off()

