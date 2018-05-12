
## Read the table

data <- read.table("household_power_consumption.txt", header = TRUE, sep=";")

## Convering the "Date" column into date format

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

## Subset the data for the requested dates

sb <- subset(data, Date == "2007-02-01" | Date =="2007-02-02")


## Converting the "Time" column into time format

sb$Time <- paste(sb$Date, sb$Time)

sb$Time <- strptime(sb$Time, "%Y-%m-%d %H:%M:%S")

## Plot the histogram and save it in png file

png("plot3.png", width=480, height=480)

plot(sb$Time,sb$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(sb,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(sb,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(sb,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()