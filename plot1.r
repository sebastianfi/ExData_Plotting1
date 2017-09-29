## Load the needed library data.table
## PLEAE NOTE: the files "household_power_consumption.txt" needs to be saved in the working directory
## (Use function getwd() to display the current working directory on your computer)

library(data.table)
alldata <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
alldata$Date <- as.Date(alldata$Date, format="%d/%m/%Y")

## Subset the data
data <- subset(alldata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(alldata)

## Convert dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 1
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Save to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
