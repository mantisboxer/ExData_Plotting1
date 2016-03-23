require(lubridate)
require(dplyr)

data <- read.table("household_power_consumption.txt",na.strings = "?", sep = ";", header = TRUE, colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

data$Date <- dmy(data$Date)
datasubset <- filter(data, Date > "2007-01-31" & Date <= "2007-02-02")
datasubset$datetime <- parse_date_time(paste(datasubset$Date, datasubset$Time),"%Y-%m-%d %H:%M:%S")

png(filename = "plot3.png", width = 480, height = 480)

with(datasubset,plot(datetime,Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"), col = 1)
with(datasubset,lines(datetime,Sub_metering_2, col = "red"))
with(datasubset,lines(datetime,Sub_metering_3, col = "blue"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),border="black", lty = 1, 
       col = c("black","red","blue"))
     
dev.off()