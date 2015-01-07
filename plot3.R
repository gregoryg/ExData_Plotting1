## Plot 3 - plot of energy metering over time
## resulting image must be 480 x 480 pixels

## read power consumption data
source("selectPower.R")

powerData <- selectPowerData()
png("plot3.png", width=480, height=480) # set image dimensions and open graphics device


plot(powerData$timestamp, powerData$Sub_metering_1,
     type="l",  ## lines, not points
     ylab="Energy sub metering",
     xlab="",
     col="black")
lines(powerData$timestamp, powerData$Sub_metering_2,
     col="red")
lines(powerData$timestamp, powerData$Sub_metering_3,
     col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       col=c("black", "red", "blue"), lty="solid")

graphics.off()  ## close graphics device
