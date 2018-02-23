power <- "household_power_consumption.txt"
consumption <- read.table(power, header = TRUE, sep = ";", stringsAsFactors=FALSE, dec = ".")
subset <- consumption[consumption$Date %in% c("1/2/2007","2/2/2007") ,]
globalactivepower <- as.numeric(subset$Global_active_power)
datetime <- strptime(paste(subset$Date, subset$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
png("plot2.png", width = 480, height = 480)
plot(datetime, globalactivepower, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
