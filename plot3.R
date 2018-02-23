power <- "household_power_consumption.txt"
consumption <- read.table(power, header = TRUE, sep = ";", stringsAsFactors=FALSE, dec = ".")
subset <- consumption[consumption$Date %in% c("1/2/2007","2/2/2007") ,]
globalactivepower <- as.numeric(subset$Global_active_power)
datetime <- strptime(paste(subset$Date, subset$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
submeter1 <- as.numeric(subset$Sub_metering_1)
submeter2 <- as.numeric(subset$Sub_metering_2)
submeter3 <- as.numeric(subset$Sub_metering_3)
png("plot3.png", width = 480, height = 480)
plot(datetime, submeter1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(datetime, submeter2, type = "l", col = "red")
lines(datetime, submeter3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"))
dev.off()
