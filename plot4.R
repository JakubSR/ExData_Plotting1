Sys.setlocale("LC_TIME", "C")

# packages
library("lubridate")

# read data
power_orig <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
power <- power_orig[power_orig[, "Date"] == "1/2/2007" | power_orig[, "Date"] == "2/2/2007", ]

# convert to numbers
for (i in 3:9){
  power[, i] <- as.numeric(power[, i])
}

# dates and times
power[, "DateTime"] <- as.POSIXct(paste(power[, "Date"], power[, "Time"]), format = "%d/%m/%Y %H:%M:%S")

# plot 4
png(file = "plot4.png")
par(mfrow = c(2,2))
plot(power$DateTime, power$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(power$DateTime, power$Voltage, type = "l", xlab = "datetime", ylab = "Global Active Power")
plot(power$DateTime, power$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub-metering")
lines(power$DateTime, power$Sub_metering_2,  type = "l", col = "red")
lines(power$DateTime, power$Sub_metering_3,  type = "l", col = "blue")
legend("topright", paste("Sub_metering_", 1:3, sep = ""), lty = 1, col = c("black", "red", "blue"), bty = "n")
plot(power$DateTime, power$Global_reactive_power, type = "l", xlab = "datetime", 
     ylab = "Global_reactive_power")
par(mfrow = c(1,1))
dev.off()
