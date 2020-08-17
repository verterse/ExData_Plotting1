library(readr)

#Reading data from file and subsetting required data
masterdata <- read_delim("household_power_consumption.txt", delim = ";", na = "?")
subdata <- masterdata[masterdata$Date %in% c("1/2/2007", "2/2/2007"), ]

#Creating new datetime variable
subdata$DateTime <- strptime(paste(subdata$Date, subdata$Time), format = "%d/%m/%Y %H:%M:%S")

#Opening png graphic device
png(filename = "plot3.png")

#Plotting
plot(subdata$DateTime, subdata$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type ="l")
lines(subdata$DateTime, subdata$Sub_metering_2, col = "red")
lines(subdata$DateTime, subdata$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("Black", "Red", "Blue"), legend = names(subdata)[7:9])

#Closing connection to graphic device
dev.off()

#Command to open file in Windows
shell.exec("plot3.png")