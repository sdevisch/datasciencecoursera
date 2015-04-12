# load data
power <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
# subset to the two dates
powerss <- power[power$Date %in% c("1/2/2007","2/2/2007") ,]

# prepare the features to be plotted
dtTime <- strptime(paste(powerss$Date, powerss$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalPower <- as.numeric(powerss$Global_active_power)

# define device as png of specific size
png("plot2.png", width=480, height=480)
plot(dtTime, globalPower, 
     type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
