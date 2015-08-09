mydata <- read.table("household_power_consumption.txt", header = TRUE , na.strings = "?" , sep = ";")
dim(mydata) # 2075259       9
mynewdata <- subset(mydata,  Date == "1/2/2007" | Date == "2/2/2007")
dim(mynewdata) # 2880	9
x <- paste(mynewdata$Date, mynewdata$Time)
mynewdata$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")
par(mfcol=c(2,2))
plot(mynewdata$DateTime, 
     mynewdata$Global_active_power, 
     type="l",
     col="black", 
     xlab="", 
     ylab="Global Active Power (kilowatts)", 
     main="")
plot(mynewdata$DateTime, 
     mynewdata$Sub_metering_1, 
     type="l",
     col="black", 
     xlab="", 
     ylab="Energy sub metering", 
     main="")
lines(mynewdata$DateTime, mynewdata$Sub_metering_2, col="red")
lines(mynewdata$DateTime, mynewdata$Sub_metering_3, col="blue")
legend("topright", 
       lwd=1, 
       lty=1, 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(mynewdata$DateTime, 
     mynewdata$Voltage, 
     type="l",
     col="black", 
     xlab="datetime", 
     ylab="Voltage", 
     main="")
plot(mynewdata$DateTime, 
     mynewdata$Global_reactive_power, 
     type="l",
     col="black", 
     xlab="datetime", 
     ylab="Global_reactive_power", 
     main="")
dev.copy(png, file = "plot4.png" , width = 480 , height = 480)
dev.off()