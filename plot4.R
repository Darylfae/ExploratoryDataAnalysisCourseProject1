power <- "household_power_consumption.txt"
consumption <- read.table(power, header = TRUE, sep = ";", stringsAsFactors=FALSE, dec = ".")
subset <- consumption[consumption$Date %in% c("1/2/2007","2/2/2007") ,]
globalactivepower <- as.numeric(subset$Global_active_power)
datetime <- strptime(paste(subset$Date, subset$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
submeter1 <- as.numeric(subset$Sub_metering_1)
submeter2 <- as.numeric(subset$Sub_metering_2)
submeter3 <- as.numeric(subset$Sub_metering_3)
globalreactivepower <- as.numeric(subset$Global_reactive_power)
voltage <- as.numeric(subset$Voltage)

png("plot4.png", width = 480, height = 480)
par(mfcol = c(2, 2))

plot(datetime, globalactivepower, type = "l", xlab = "", ylab = "Global Active Power")

plot(datetime, submeter1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(datetime, submeter2, type = "l", col = "red")
lines(datetime, submeter3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 2, col = c("black", "red", "blue"), bty = "n")

plot(datetime, voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(datetime, globalreactivepower, type = "l", xlab = "datetime", ylab = "Global_reactive_power", lwd = 1)

dev.off()
