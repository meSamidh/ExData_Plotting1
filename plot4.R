## Read the source file

power_data <- read.csv("household_power_consumption.txt")

## Filter out required data for 2 dates

power_data_sel <- subset(power_data, as.Date(Date, "%d/%m/%Y" ) == '2007-02-01'| as.Date(Date, "%d/%m/%Y" ) =='2007-02-02')

## SeLect  numeric data for Voltage, Global Active and Reactive Power

global_power<- as.numeric(power_data_sel$Global_active_power)
global_reactive_power <- as.numeric(power_data_sel$Global_reactive_power)
voltage <- as.numeric(power_data_sel$Voltage)

## Concat Date and Time

dt <- strptime(paste(power_data_sel$Date, power_data_sel$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## SeLect  numeric data for Sub metering

subMetering1 <- as.numeric(power_data_sel$Sub_metering_1)
subMetering2 <- as.numeric(power_data_sel$Sub_metering_2)
subMetering3 <- as.numeric(power_data_sel$Sub_metering_3)


## Set png as Graphics device

windows()
par(mfrow = c(2, 2)) 

plot(dt, global_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(dt, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(dt, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(dt, subMetering2, type="l", col="red")
lines(dt, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(dt, global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

## Copy to png file

dev.copy(png,file= "plot4.png",height=480, width= 480 )

## Close the device

dev.off()
