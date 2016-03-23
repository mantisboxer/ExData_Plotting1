require(lubridate)
require(dplyr)

data <- read.table("household_power_consumption.txt",na.strings = "?", sep = ";", header = TRUE, colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

data$Date <- dmy(data$Date)
datasubset <- filter(data, Date > "2007-01-31" & Date <= "2007-02-02")
datasubset$datetime <- parse_date_time(paste(datasubset$Date, datasubset$Time),"%Y-%m-%d %H:%M:%S")

png(filename = "plot2.png", width = 480, height = 480)

with(datasubset,plot(datetime,Global_active_power, type = "l", xlab = "", ylab = "Global_active_power (kilowatts)"))

dev.off()