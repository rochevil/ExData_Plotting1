## Downloads the file online if it does not exist in the working directory

datafilespath <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
datafile <- "household_power_consumption.txt"

if (!file.exists(datafile))
{
        download.file(datafilespath, datafileszip)
}

## Subsets the file to only get entries between 1/2/2007 and 2/2/2007

data <- read.csv(datafile,header=T, sep=";", na.strings="?")
data_needed <- subset(data,Date %in% c("1/2/2007","2/2/2007"))

## Creates a new column called Std_Date_Time to combine the given Date and Time

data_needed$Date <- as.Date(data_needed$Date,"%d/%m/%Y")
data_needed <- cbind(data_needed, "Std_Date_Time" = as.POSIXct(paste(data_needed$Date, data_needed$Time)))

## Plots energy sub metering (1, 2, and 3) versus Date and Time and saves it to a PNG file

png("plot3.png", width=480, height=480, bg = "transparent")
plot(data_needed$Std_Date_Time, data_needed$Sub_metering_1, type = "l", xlab =" ", ylab = "Energy sub metering")
lines(data_needed$Std_Date_Time, data_needed$Sub_metering_2, type = "l", col = "red")
lines(data_needed$Std_Date_Time, data_needed$Sub_metering_3, type = "l", col = "blue")
legend("topright", cex = 0.75, lwd = 1, col = c("black", "red", "blue"), legend = c( "sub_meter_1", "sub_meter_2", "sub_meter_3"))
dev.off()
