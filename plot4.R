## Plot 4 - create a panel of 4 graphs:
##   1. Global Active Power over time
##   2. Voltages over time
##   3. Energy sub metering over time (3 meters)
##   4. Global Reactive Power over time
## resulting image must be 480 x 480 pixels

## read power consumption data
source("selectPower.R")

powerData <- selectPowerData()
png("plot4.png", width=480, height=480) # set image dimensions and open graphics device
## png("plot4-large.png", width=960, height=960) # set image dimensions and open graphics device
par(mfrow=c(2,2))

## First graph: Global Active Power
plot(powerData$timestamp, powerData$Global_active_power,
     type="l",  ## lines, not points
     ylab="Global Active Power (kilowatts)",
     xlab="")

## Second graph: Voltages over time
plot(powerData$timestamp, powerData$Voltage,
     type="l",
     ylab="Voltage",
     xlab="datetime")

## Third graph: energy sub metering
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

## Fourth graph: global reactive power
plot(powerData$timestamp, powerData$Global_reactive_power,
     type="l",
     ylab="Global_reactive_power",
     xlab="datetime")


graphics.off()  ## close graphics device
