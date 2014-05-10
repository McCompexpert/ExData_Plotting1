## Read the data file, account for na, set decimal point and header
household_power_consumption <- read.table('data/household_power_consumption.txt',
                                header=TRUE, dec=".", sep=";", na.strings = "?")
## Convert the Date column to date format
household_power_consumption$Date <-  as.Date(household_power_consumption$Date, 
                                             format="%d/%m/%Y")

## subset the dataset to two days of interest
data <- subset(household_power_consumption,  
               Date == as.Date('2007-02-01') | Date == as.Date('2007-02-02'))

# get the range for the x and y axis
xrange <- c(1,length(data$Date))
yrange <- range(data$Sub_metering_1) 

## define the plot frame and margins
par(mfrow=c(2,2), mar=c(4,4.5,2,1))
## plot1
plot(data$Global_active_power,  
     ylab="Global Active Power (kilowatts)",
     xlab="", type="l", xaxt="n", cex.lab=0.7)
axis(1, at=c(0,1440,2880), labels=c("Thu", "Fri", "Sat"))
## plot2
plot(data$Voltage,  
     ylab="Voltage",
     xlab="datetime", type="l", xaxt="n", cex.lab=0.7)
axis(1, at=c(0,1440,2880), labels=c("Thu", "Fri", "Sat"))
## plot3
plot(xrange, yrange, type="n", xlab="",
     ylab="Energy sub metering", xaxt="n", cex.lab=0.7, ylim=yrange) 
lines(data$Sub_metering_1) 
lines(data$Sub_metering_2, col="red") 
lines(data$Sub_metering_3, col="blue") 
axis(1, at=c(0,1440,2880), labels=c("Thu", "Fri", "Sat"))
legend(1700, 38, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.5, col=c("black", "red", "blue"),
       lty=c(1, 1, 1), bty="n")
## plot 4
plot(data$Global_reactive_power,  
     ylab="Global_reactive_power",
     xlab="datetime", type="l", xaxt="n", cex.lab=0.8)
axis(1, at=c(0,1440,2880), labels=c("Thu", "Fri", "Sat"))
## copy my plot to a PNG file
dev.copy(png, file="plot4.png", width=480, height=480)
## close PNG device
dev.off()
