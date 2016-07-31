library(lubridate)
#load in the dataset
file <- read.table(file = "household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, na.strings = "?")

#subset the dataset to desired period
data <- subset(file, Date == "1/2/2007" | Date == "2/2/2007")

#transform data type 
data$Date_Time <- dmy_hms(paste(data$Date, data$Time))
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#plot 2
data$Global_active_power <- as.numeric(data$Global_active_power)
with(data, plot(Global_active_power ~ Date_Time, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()