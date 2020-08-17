library(readr)

#Reading data from file and subsetting required data
masterdata <- read_delim("household_power_consumption.txt", delim = ";", na = "?")
subdata <- masterdata[masterdata$Date %in% c("1/2/2007", "2/2/2007"), ]

#Creating new datetime variable
subdata$DateTime <- strptime(paste(subdata$Date, subdata$Time), format = "%d/%m/%Y %H:%M:%S")

#Opening png graphic device
png(filename = "plot2.png")

#Plotting
plot(subdata$DateTime, subdata$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")

#Closing connection to graphic device
dev.off()

#Command to open file in Windows
shell.exec("plot2.png")