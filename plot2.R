## Read the data file, account for na, set decimal point and header
household_power_consumption <- read.table('data/household_power_consumption.txt',
                                header=TRUE, dec=".", sep=";", na.strings = "?")
## Convert the Date column to date format
household_power_consumption$Date <-  as.Date(household_power_consumption$Date, 
                                             format="%d/%m/%Y")

## subset the dataset to two days of interest
data <- subset(household_power_consumption,  
               Date == as.Date('2007-02-01') | Date == as.Date('2007-02-02'))

## draw the plot with captions on screen
plot2 <- plot(data$Global_active_power,  
              ylab="Global Active Power (kilowatts)",
              xlab="", type="l", xaxt="n")
## add custom x axis labels
axis(1, at=c(0,1440,2880), labels=c("Thu", "Fri", "Sat"))

## copy my plot to a PNG file
dev.copy(png, file="plot2.png", width=480, height=480)

## close PNG device
dev.off()
