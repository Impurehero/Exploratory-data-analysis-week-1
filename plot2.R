
## Read the table

data <- read.table("household_power_consumption.txt", header = TRUE, sep=";")

## Convering the "Date" column into date format

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

## Subset the data for the requested dates

sb <- subset(data, Date == "2007-02-01" | Date =="2007-02-02")

## Converting the "Time" column into time format

sb$Time <- paste(sb$Date, sb$Time)

sb$Time <- strptime(sb$Time, "%Y-%m-%d %H:%M:%S")

## Construct the plot and save it in png file

png("plot2.png", width=480, height=480)

plot(sb$Time,as.numeric(as.character(sb$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)")

dev.off()