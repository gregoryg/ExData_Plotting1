## Plot 1 - histogram of global active power by frequency
## resulting image must be 480 x 480 pixels

## read power consumption data
source("selectPower.R")

powerData <- selectPowerData()
png("plot1.png", width=480, height=480) # set image dimensions and open graphics device

hist(powerData$Global_active_power,
     main="Global Active Power",             ## chart title
     xlab="Global Active Power (kilowatts)", ## x-axis label
     ylab="Frequency",                       ## y-axis label
     col="red")

graphics.off()  ## close graphics device
