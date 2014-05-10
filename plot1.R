## Read the data file, account for na, set decimal point and header
household_power_consumption <- read.table('data/household_power_consumption.txt',
                                header=TRUE, dec=".", sep=";", na.strings = "?")
## Convert the Date column to date format
household_power_consumption$Date <-  as.Date(household_power_consumption$Date, 
                                             format="%d/%m/%Y")

## subset the dataset to two days of interest
data <- subset(household_power_consumption,  
               Date == as.Date('2007-02-01') | Date == as.Date('2007-02-02'))
## draw the histogram plot with captions on screen
plot1 <- hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", col = "red")
## copy my plot to a PNG file
dev.copy(png, file="plot1.png", width=480, height=480)

## close PNG device
dev.off()
