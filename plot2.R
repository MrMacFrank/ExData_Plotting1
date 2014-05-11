######## Plot 2
getwd() ### get workspace

data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?") ### read table
head(data) ### head of data

### generate Dates through combining Date & Time
dates<-paste(data$Date, data$Time) ### paste Date & Time
dt<-strptime(as.character(dates), "%d/%m/%Y %H:%M:%S") ### generate POSIXlt container

data_ext<-cbind(data, dt) ### cbind POSIXlt elements to existing data

data_ext$Date<-as.Date(data_ext$Date, format="%d/%m/%Y") ### convert $Date from class 'factor' to 'Date'
data_ext.sub<-subset(data_ext, data_ext$Date>='2007-02-01' & data_ext$Date<'2007-02-03') ### generate subset based on Dates

png(file="plot2.png") ### open file device
plot(x=data_ext.sub$dt, y=data_ext.sub$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)") # generate line plot
dev.off() ### shut down file device
