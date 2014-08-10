### Assignment 1 - plot 2

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

png(file="plot2.png") # open file device
plot(x=sub.consumption$datetime2, y=sub.consumption$Global_active_power, type="l", xlab="", ylab = "Global Active Power (kilowatts)") # generate lineplot with active power over datetime2
dev.off() # shut down file device
