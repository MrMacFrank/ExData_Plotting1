### Assignment 1 - plot 3

consumption <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?") # read data
head(consumption) # check data
class(consumption$Date) # check class of Date

consumption$Date <- as.Date(consumption$Date, format="%d/%m/%Y") # convert $Date from char to Date

datetime <- paste(consumption$Date, consumption$Time) # create datetime vector
head(datetime)

?strptime
datetime2 <- strptime(as.character(datetime), "%Y-%m-%d %H:%M:%S") # create date POSIXlt container
head(datetime2)

consumption.ext <- cbind(consumption, datetime2) # bind POXISlt dates to consumption dataset
head(consumption.ext)

sub.consumption <- subset(consumption.ext, consumption$Date>="2007-02-01" & consumption$Date<"2007-02-03") # generate subset from timeframe
head(sub.consumption)

png(file="plot3.png")
plot(x=sub.consumption$datetime2, y=sub.consumption$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering") # generate line plot for sub metering 1
lines(x=sub.consumption$datetime2, y=sub.consumption$Sub_metering_2, col="red") # generate line for sub metering 2
lines(x=sub.consumption$datetime2, y=sub.consumption$Sub_metering_3, col="blue") # generate line for sub metering 3
legend("topright", 0.7, lty=1, col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.8) # create legend box
dev.off()
