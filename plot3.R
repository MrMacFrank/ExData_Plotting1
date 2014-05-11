######## Plot 3
getwd() ### get workspace

data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?") ### read table
head(data) ### head of data

### generate Dates through combining Date & Time
dates<-paste(data$Date, data$Time) ### paste Date & Time
dt<-strptime(as.character(dates), "%d/%m/%Y %H:%M:%S") ### generate POSIXlt container

data_ext<-cbind(data, dt) ### cbind POSIXlt elements to existing data

data_ext$Date<-as.Date(data_ext$Date, format="%d/%m/%Y") ### convert $Date from class 'factor' to 'Date'
data_ext.sub<-subset(data_ext, data_ext$Date>='2007-02-01' & data_ext$Date<'2007-02-03') ### generate subset based on Dates

png(file="plot3.png") ### open file device
plot(x=data_ext.sub$dt, y=data_ext.sub$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering") # generate line plot1
lines(x=data_ext.sub$dt, y=data_ext.sub$Sub_metering_2, col="red") # generate line plot2 (stacked over plot1)
lines(x=data_ext.sub$dt, y=data_ext.sub$Sub_metering_3, col="blue") # generate line plot3 (stacked over plot1 & plot2)
legend("topright", 0.5, lty=1, col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) # create legend box
dev.off() ### shut down file device

