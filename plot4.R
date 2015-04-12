# load data
power <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
# subset to the two dates
powerss <- power[power$Date %in% c("1/2/2007","2/2/2007") ,]

# 
dtTime <- strptime(paste(powerss$Date, powerss$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(powerss$Global_active_power)
globalReactivePower <- as.numeric(powerss$Global_reactive_power)
voltage <- as.numeric(powerss$Voltage)
subMet1 <- as.numeric(powerss$Sub_metering_1)
subMet2 <- as.numeric(powerss$Sub_metering_2)
subMet3 <- as.numeric(powerss$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(dtTime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(dtTime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(dtTime, subMet1, type="l", ylab="Energy Submetering", xlab="")
lines(dtTime, subMet2, type="l", col="red")
lines(dtTime, subMet3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(dtTime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()