## Reading dataset
data_read <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
                      
## Converting dates                      
data_read$Date <- as.Date(data_read$Date, format="%d/%m/%Y")

## Subsetting the data
data_sub <- subset(data_read, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_read)

## Converting dates
datetime <- paste(as.Date(data_sub$Date), data_sub$Time)
data_sub$Datetime <- as.POSIXct(datetime)

## Plotting Plot 3
with(data_sub, {
    plot(Sub_metering_1~Datetime, type="l",
         ylab="Energy sub metering", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving Plot3 to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()