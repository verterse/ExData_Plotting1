library(readr)
library(lubridate)

#Reading data from file and subsetting required data
masterdata <- read_delim("household_power_consumption.txt", delim = ";", na = "?")
subdata <- masterdata[masterdata$Date %in% c("1/2/2007", "2/2/2007"), ]

#Using lubridate functions to convert character object to date and time objects
subdata$Date <- dmy(subdata$Date)
subdata$Time <- hms(subdata$Time)

#Opening png graphic device
png(filename = "plot1.png")

hist(subdata$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

#Closing connection to graphic device
dev.off()

#Command to open file in Windows
shell.exec("plot1.png")