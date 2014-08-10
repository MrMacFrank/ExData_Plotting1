#### Assignment 1 - Plot 1

getwd() # get workspace

consumption <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?") # read data
  head(consumption) # check data
  class(consumption$Date) # check class of Date

consumption$Date <- as.Date(consumption$Date, format="%d/%m/%Y") # convert $Date from char to Date

sub.consumption <- subset(consumption, consumption$Date>="2007-02-01" & consumption$Date<"2007-02-03") # generate subset from timeframe

png(file="plot1.png") # open file device
hist(sub.consumption$Global_active_power, col="red", xlab="Global Active Power (kilowatts", ylab="Frequency", main="Global Active Power") # generate histogram of global active power
dev.off() # shut down file device
