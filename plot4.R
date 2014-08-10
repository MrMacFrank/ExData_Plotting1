### Assignment 1 - plot 4
setwd("C:/Users/ChristianWalter/Documents/Coursera/03 Exploratory Graphs/Assignment 1")
consumption <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?") # read data
head(consumption) # check data
class(consumption$Date) # check class of Date

consumption$Date <- as.Date(consumption$Date, format="%d/%m/%Y") # convert $Date from char to Date

datetime <- paste(consumption$Date, consumption$Time) # create datetime vector
head(datetime)

datetime2 <- strptime(as.character(datetime), "%Y-%m-%d %H:%M:%S") # create date POSIXlt container
head(datetime2)

consumption.ext <- cbind(consumption, datetime2) # bind POXISlt dates to consumption dataset
head(consumption.ext)

sub.consumption <- subset(consumption.ext, consumption$Date>="2007-02-01" & consumption$Date<"2007-02-03") # generate subset from timeframe
head(sub.consumption)

### start plotting:

png(file="plot4.png") # open file device
par(mfcol=c(2,2)) # declare format

# plot1
plot(x=sub.consumption$datetime2, y=sub.consumption$Global_active_power, type="l", xlab="", ylab = "Global Active Power (kilowatts)") # generate lineplot with active power over datetime2

# plot2
plot(x=sub.consumption$datetime2, y=sub.consumption$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering") # generate line plot for sub metering 1
lines(x=sub.consumption$datetime2, y=sub.consumption$Sub_metering_2, col="red") # generate line for sub metering 2
lines(x=sub.consumption$datetime2, y=sub.consumption$Sub_metering_3, col="blue") # generate line for sub metering 3
legend("topright", 0.7, col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.6) # create legend box

# plot3
plot(x=sub.consumption$datetime2, y=sub.consumption$Voltage, type="l", xlab="", ylab = "Voltage") # generate lineplot with voltage over datetime2

# plot4
plot(x=sub.consumption$datetime2, y=sub.consumption$Global_reactive_power, type="b", xlab="datetime", ylab="Global_reactive_power", cex.axis=1, cex.lab=1) # generate barplot with active power over datetime2

dev.off() ### shut down file device
