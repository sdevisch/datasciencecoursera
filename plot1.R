# load data
power <- read.table("household_power_consumption.txt", sep=";", header=TRUE, 
                    stringsAsFactors=FALSE, dec=".")
# subset to the two dates
powerss <- power[power$Date %in% c("1/2/2007","2/2/2007") ,]

# define device as png of specific size
png("plot1.png", width = 480, height = 480)
GlobalActivePower <- as.numeric(powerss$Global_active_power)
hist(GlobalActivePower, col="red", 
     xlab = "Global Active Power (kilowatts)", 
     ylab= "Frequency",
     main = "Global Active Power")
dev.off()
