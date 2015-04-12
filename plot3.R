# load data
power <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
# subset to the two dates
powerss <- power[power$Date %in% c("1/2/2007","2/2/2007") ,]

# 
dtTime <- strptime(paste(powerss$Date, powerss$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subMet1 <- as.numeric(powerss$Sub_metering_1)
subMet2 <- as.numeric(powerss$Sub_metering_2)
subMet3 <- as.numeric(powerss$Sub_metering_3)

# preop for output towards png instead of screen
png("plot3.png", width=480, height=480) #set size of png to 480*480
# prep plot first, label vertical axis; unlabel horizontal axis
plot(dtTime, subMet1, type="l", ylab="Energy Submetering", xlab="")
lines(dtTime, subMet2, type="l", col="red")
lines(dtTime, subMet3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
##legend("topright", box.lty=0, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=0, lwd=0, text.col=c("black", "red", "blue"))
dev.off()
