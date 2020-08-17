library(readr)

#Reading data from file and subsetting required data
masterdata <- read_delim("household_power_consumption.txt", delim = ";", na = "?")
subdata <- masterdata[masterdata$Date %in% c("1/2/2007", "2/2/2007"), ]

#Creating new datetime variable
subdata$DateTime <- strptime(paste(subdata$Date, subdata$Time), format = "%d/%m/%Y %H:%M:%S")

#Opening png graphic device
png(filename = "plot4.png")

#Setting graphic device parameters
par(mfrow = c(2,2), mar = c(4,4,2,1.4), oma=c(1,1,1,1))

#Plot 1
plot(subdata$DateTime, subdata$Global_active_power, type="l", xlab = "", ylab = "Global Active Power")

#Plot 2
plot(subdata$DateTime, subdata$Voltage, type="l", xlab = "datetime", ylab = "Voltage")

#Plot 3
plot(subdata$DateTime, subdata$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type ="l")
lines(subdata$DateTime, subdata$Sub_metering_2, col = "red")
lines(subdata$DateTime, subdata$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("Black", "Red", "Blue"), legend = names(subdata)[7:9])

#Plot 4
plot(subdata$DateTime, subdata$Global_reactive_power, type="l", xlab = "datetime", ylab = "Global Reactive Power")

#Closing connection to graphic device
dev.off()

#Command to open file in Windows
shell.exec("plot4.png")