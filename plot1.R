
## Read the table

data <- read.table("household_power_consumption.txt", header = TRUE, sep=";")

## Convering the "Date" column into date format

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

## Subset the data for the requested dates

sb <- subset(data, Date == "2007-02-01" | Date =="2007-02-02")

## Plot the histogram and save in png file

png("plot1.png", width=480, height=480)

hist(as.numeric(as.character(sb$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")


dev.off()
