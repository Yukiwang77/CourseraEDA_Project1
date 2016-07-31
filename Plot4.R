library(lubridate)
#load in the dataset
file <- read.table(file = "household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, na.strings = "?")

#subset the dataset to desired period
data <- subset(file, Date == "1/2/2007" | Date == "2/2/2007")

#transform data type 
data$Date_Time <- dmy_hms(paste(data$Date, data$Time))
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#plot 4
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(data$Voltage)
data$Sub_metering_1 <- as.numeric((data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric((data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric((data$Sub_metering_3))

par(mfcol = c(2,2))
with(data, plot(Global_active_power ~ Date_Time, type = "l", xlab = "", ylab = "Global Active Power"))
with(data,{
  plot(Sub_metering_1 ~ Date_Time, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
  lines(Sub_metering_2 ~ Date_Time, col = "red")
  lines(Sub_metering_3 ~ Date_Time, col = "blue")
  legend("topright", col=c("black","red","blue"), legend = c("Sub_metering_1\n", "Sub_metering_2\n", "Sub_metering_3\n"), lty = 1, lwd = 1, bty = "n", cex = 0.5)
})
with(data, plot(Voltage ~ Date_Time, type = "l", xlab = "datetime", ylab = "Voltage"))
with(data, plot(Global_reactive_power ~ Date_Time, type = "l", xlab = "datetime", ylab = "Global_reactive_power"))
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()
