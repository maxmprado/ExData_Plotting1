path <- "/Users/Beto/OneDrive/DataScience with R/household_power_consumption.txt"
data <- read.csv(path, header = T, sep = ";", stringsAsFactors = F)
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data$Time <- strptime(data$Time," %H:%M:%S")
data<-data[(data$Date >="2007-02-01" & data$Date <="2007-02-02"),]
data$TIME <- strptime(paste(data$Date,data$Time), "%Y-%m-%d %H:%M:%S")

#PLOT 1
png("plot1.png", width=480, height=480)
hist(as.numeric(data$Global_active_power), xlab = "Global Active Power (Kilowatts)", col = "red", main = "Global Active Power")
dev.off()


#PLOT 2
png("plot2.png",width=480, height=480)
plot(data$TIME,data$Global_active_power, "l", ylab = "Global Active Power (Kilowatts)", xlab = "")
dev.off()

#PLOT 3
png("plot3.png",width=480, height=480)
plot(data$TIME,data$Sub_metering_1,"l",xlab = "", ylab = "Energy sub metering")
lines(data$TIME, data$Sub_metering_2, type="l", col="red")
lines(data$TIME, data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"), bty="o")
dev.off()

###
###PLOT 4
###
png("plot4.png",width=480, height=480)

# MATRIX 2x2  PLOTS
par(mfrow= c(2,2))
#plot1
hist(as.numeric(data$Global_active_power), xlab = "Global Active Power (Kilowatts)", col = "red", main = "Global Active Power")
#plot2
plot(data$TIME,data$Voltage,"l",xlab = "datetime", ylab = "voltage")
#plot3
plot(data$TIME,data$Sub_metering_1,"l",xlab = "", ylab = "Energy sub metering")
lines(data$TIME, data$Sub_metering_2, type="l", col="red")
lines(data$TIME, data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"), cex = 0.5)
#plot4
plot(data$TIME,data$Global_reactive_power, "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
