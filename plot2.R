## Plot 2 - plot of global active power over time
## resulting image must be 480 x 480 pixels

## read power consumption data
source("selectPower.R")

powerData <- selectPowerData()
png("plot2.png", width=480, height=480) # set image dimensions and open graphics device


plot(powerData$timestamp, powerData$Global_active_power,
     type="l",  ## lines, not points
     ylab="Global Active Power (kilowatts)",
     xlab="")

graphics.off()  ## close graphics device
