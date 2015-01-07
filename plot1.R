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

# plot 1
png(file = "plot1.png")
hist(power$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")
dev.off()
