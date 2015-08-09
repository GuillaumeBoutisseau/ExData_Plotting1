mydata <- read.table("household_power_consumption.txt", header = TRUE , na.strings = "?" , sep = ";")
dim(mydata) # 2075259       9
mynewdata <- subset(mydata,  Date == "1/2/2007" | Date == "2/2/2007")
dim(mynewdata) # 2880	9
x <- paste(mynewdata$Date, mynewdata$Time)
mynewdata$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")
hist(mynewdata$Global_active_power, main = "Global Active Power" , xlab = "Global Active Power (kilowatts)" , col = "red")
dev.copy(png, file = "plot1.png" , width = 480 , height = 480)
dev.off()