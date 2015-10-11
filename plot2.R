## Read the source file

power_data <- read.csv("household_power_consumption.txt")

## Filter out required data for 2 dates

power_data_sel <- subset(power_data, as.Date(Date, "%d/%m/%Y" ) == '2007-02-01'| as.Date(Date, "%d/%m/%Y" ) =='2007-02-02')

## SeLect  data for Global Active Power

global_power<- power_data_sel$Global_active_power

## Concat Date and Time

dt <- strptime(paste(power_data_sel$Date, power_data_sel$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## Set png as Graphics device

windows()

plot(dt,global_power, type="l", xlab="", ylab="Global Active Power (kilowatts)" )

## Copy to png file

dev.copy(png,file= "plot2.png",height=480, width= 480 )

## Close the device

dev.off()
