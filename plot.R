data<- read.csv("household_power_consumption.txt", sep=";",na.strings = "?", header = TRUE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data3<- data[complete.cases(data2),]
data4<- mutate(data3, DateTime = paste(Date, Time))
data4$DateTime<- as.POSIXct(data4$DateTime)

#First Plot
png(file = "plot1.png")
hist(as.numeric(data4$Global_active_power), xlab="Global Active Power(kilowatts)", ylab="Frequency", col = "red", main = "Global Active Power")
dev.off()

#Second Plot
png(file = "plot2.png")
plot(as.numeric(data4$Global_active_power)~ data4$DateTime,type="l",ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()

#Third Plot
png(file="plot3.png")
plot(as.numeric(data4$Sub_metering_1)~data4$DateTime, type="n",ylab = "Energy sub metering", xlab="")
lines(as.numeric(data4$Sub_metering_1)~data4$DateTime)
lines(as.numeric(data4$Sub_metering_2)~data4$DateTime, col = "red")
lines(as.numeric(data4$Sub_metering_3)~data4$DateTime, col = "blue")
legend("topright", col = c("black", "red", "blue"), lwd= c(1,1,1), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()

#Fourth plot
png(file="plot4.png")
par(mfrow=c(2,2))
plot(as.numeric(data4$Global_active_power)~ data4$DateTime,type="l",ylab = "Global Active Power (kilowatts)", xlab = "")
plot(as.numeric(data4$Voltage)~ data4$DateTime,type="l",ylab = "Voltage", xlab = "datetime")
plot(as.numeric(data4$Sub_metering_1)~data4$DateTime, type="n",ylab = "Energy sub metering", xlab="")
lines(as.numeric(data4$Sub_metering_1)~data4$DateTime)
lines(as.numeric(data4$Sub_metering_2)~data4$DateTime, col = "red")
lines(as.numeric(data4$Sub_metering_3)~data4$DateTime, col = "blue")
legend("topright", col = c("black", "red", "blue"), lwd= c(1,1,1), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
plot(as.numeric(data4$Global_reactive_power)~ data4$DateTime,type="l",ylab = "Global_reactive_power (kilowatts)", xlab = "datetime")
dev.off()