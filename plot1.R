power <- "household_power_consumption.txt"
consumption <- read.table(power, header = TRUE, sep = ";", stringsAsFactors=FALSE, dec = ".")
subset <- consumption[consumption$Date %in% c("1/2/2007","2/2/2007") ,]
globalactivepower <- as.numeric(subset$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(globalactivepower, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
