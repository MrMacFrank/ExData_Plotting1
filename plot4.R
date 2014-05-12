
###example from stackoverflow
lmts <- range(d0,d1)

par(mfrow = c(1, 2))
boxplot(d0,ylim=lmts)
boxplot(d1,ylim=lmts)


?mfrow
?par

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

png(file="plot4.png") ### open file device
par(mfcol=c(2,2))
 
##plot2
plot(x=data_ext.sub$dt, y=data_ext.sub$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)", cex.axis=1, cex.lab=1) # generate line plot
##plot3
plot(x=data_ext.sub$dt, y=data_ext.sub$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", cex.axis=1, cex.lab=1) # generate line plot1
lines(x=data_ext.sub$dt, y=data_ext.sub$Sub_metering_2, col="red") # generate line plot2 (stacked over plot1)
lines(x=data_ext.sub$dt, y=data_ext.sub$Sub_metering_3, col="blue") # generate line plot3 (stacked over plot1 & plot2)
legend("topright", 0.5, lty=1, col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n", cex=0.8) # create legend box
##plot4
plot(x=data_ext.sub$dt, y=data_ext.sub$Voltage, type="l", xlab="datetime", ylab="Voltage", cex.axis=1, cex.lab=1)
##plot4
plot(x=data_ext.sub$dt, y=data_ext.sub$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power", cex.axis=1, cex.lab=1)

dev.off() ### shut down file device
