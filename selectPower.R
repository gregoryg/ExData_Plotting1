## Read in power consumption data, converting date to internal R Date type
## filter the result to return only date for dates 2007-02-01 and 2007-02-02
## TODO: improve read memory performance by using sqldf or similar library
## This file is sourced in the plot creation code for all plots based on this data

library(utils)

## create a custom type for dates and times, thanks to http://goo.gl/dVxS4s
mmddyyStringToDate <- function(dateString="") {
    strptime(x=dateString, format="%d/%m/%Y")
}

setClass("mmddyyStringToDate") ## tell R that this is a class
setAs("character", "mmddyyStringToDate", function(from) as.Date(from, format="%d/%m/%Y"))

dsname <- "household_power_consumption"
cvsname <- paste0(dsname,".txt")
rdsname <- paste0(dsname,".rds")

selectPowerData <- function() {
    if (file.exists(rdsname)) {
        powerData <- readRDS(rdsname)
    } else {
        download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", method="curl", destfile="household_power_consumption.zip")
        unzip("household_power_consumption.zip")
        if (!file.exists(cvsname)) {
            stop("Error downloading or extracting the data set")
        } else {
            powerData <- read.csv(file=cvsname,
                                  header=TRUE,
                                  sep=";",
                                  quote='"',
                                  na.strings=c("NA","<NA>","?"),
                                  colClasses=c("mmddyyStringToDate", "character", rep("numeric", 7)),
                                  ## colClasses = c(rep("character", 2), rep("numeric", 7)),
                                  stringsAsFactors=TRUE)

            powerData <- powerData[powerData$Date=="2007-02-01" | powerData$Date=="2007-02-02",]
            ## powerData$Time <- strptime(x=powerData$Time, format="%H:%M:%S")
            ## now that we have the data filtered, let's add a timestamp (date/time) field
            powerData$timestamp <- strptime(paste(as.character(powerData$Date), powerData$Time), format="%Y-%m-%d %H:%M:%S")

            ## And now, save this as an R dataset so we don't have to read the big file over and over
            saveRDS(powerData, file="household_power_consumption.rds")

            powerData
        }
    }
}
