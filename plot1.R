##### Plot 1
getwd() ### get workspace

data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?") ### read table
head(data) ### head of data

data_use<-data ### copy original data into new "working-data"
data_use$Date<-as.Date(data_use$Date, format="%d/%m/%Y") ### convert $Date from class 'factor' to 'Date'
sub.data<-subset(data, data_use$Date>='2007-02-01' & data_use$Date<'2007-02-03') ### generate subset based on Dates

png(file="plot1.png") ### open file device
hist(sub.data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power") # generate plot
dev.off() ### shut down file device
