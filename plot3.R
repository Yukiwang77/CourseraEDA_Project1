library(lubridate)
#load in the dataset
file <- read.table(file = "household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, na.strings = "?")

#subset the dataset to desired period
data <- subset(file, Date == "1/2/2007" | Date == "2/2/2007")

#transform data type 
data$Date_Time <- dmy_hms(paste(data$Date, data$Time))
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#plot 3
data$Sub_metering_1 <- as.numeric((data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric((data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric((data$Sub_metering_3))
with(data,{
  plot(Sub_metering_1 ~ Date_Time, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
  lines(Sub_metering_2 ~ Date_Time, col = "red")
  lines(Sub_metering_3 ~ Date_Time, col = "blue")
  legend("topright", col=c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, cex = 0.75)
})
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()