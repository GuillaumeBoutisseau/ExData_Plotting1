mydata <- read.table("household_power_consumption.txt", header = TRUE , na.strings = "?" , sep = ";")
dim(mydata) # 2075259       9
mynewdata <- subset(mydata,  Date == "1/2/2007" | Date == "2/2/2007")
dim(mynewdata) # 2880	9
x <- paste(mynewdata$Date, mynewdata$Time)
mynewdata$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")
plot(mynewdata$DateTime, mynewdata$Sub_metering_1, 
     type = "l",
     col = "black",
     xlab = "", ylab = "Energy sub metering")
lines(mynewdata$DateTime, mynewdata$Sub_metering_2, col = "red")
lines(mynewdata$DateTime, mynewdata$Sub_metering_3, col = "blue")
legend("topright", 
       col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1)
dev.copy(png, file = "plot3.png" , width = 480 , height = 480)
dev.off()