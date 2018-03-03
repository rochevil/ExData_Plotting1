## Downloads the file online if it does not exist in the working directory

datafilespath <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
datafile <- "household_power_consumption.txt"

if (!file.exists(datafile))
{
        download.file(datafilespath, datafileszip)
}

## Subsets the file to only get entries between 1/2/2007 and 2/2/2007

data <- read.table(datafile,header=TRUE, sep=";", na.strings="?")
data_needed <- subset(data,Date %in% c("1/2/2007","2/2/2007"))

## Creates a histogram named Global Active Power and saves the plot to a PNG file

png("plot1.png", width=480, height=480, bg = "transparent")
hist(data_needed[,3],col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
