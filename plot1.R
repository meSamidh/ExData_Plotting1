## Read the source file

power_data <- read.csv("household_power_consumption.txt")

## Filter out required data for 2 dates

power_data_sel <- subset(power_data, as.Date(Date, "%d/%m/%Y" ) == '2007-02-01'| as.Date(Date, "%d/%m/%Y" ) =='2007-02-02')

## Set numeric data for histogram

global_power<- as.numeric(power_data_sel$Global_active_power)

## Set png as Graphics device

windows()

hist(global_power, col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)")

## Copy to png file

dev.copy(png,file= "plot1.png",height=480, width= 480 )

## Close the device

dev.off()
