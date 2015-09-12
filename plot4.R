raw_data <- read.delim("household_power_consumption.txt", sep=";", na.strings="?",
        colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
#Convert Date column to date format
raw_data$Date <- as.Date(raw_data$Date, "%d/%m/%Y")
#Subset of data with dates 2007-02-01 and 2007-02-02
data_sub <- raw_data[ which(raw_data$Date >= as.Date("2007-02-01") & raw_data$Date <= as.Date("2007-02-02")),]

#Create a new date+time variable from col1 and col2
datetime <- strptime(paste(data_sub$Date, data_sub$Time), format="%Y-%m-%d %H:%M:%S")

#open PNG device
png("plot4.png",
    width = 480, height = 480, units = "px")

#Create parent frame 2x2
par(mfrow=c(2,2))

#draw top left line graph
plot(datetime, data_sub$Global_active_power, type="l", ylab="Global Active Power", xlab=NA)

#draw top right
plot(datetime, data_sub$Voltage, type="l", ylab="Voltage")

#draw bottom left line graph
plot(datetime, data_sub$Sub_metering_1, type="l", col="black", xlab=NA, ylab="Energy sub metering")
lines(datetime, data_sub$Sub_metering_2, col="red")
lines(datetime, data_sub$Sub_metering_3, col="blue")
legend("topright", lty=1, bty = "n", col=c("black", "red", "blue"),  legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


#draw bottom right
plot(datetime, data_sub$Global_reactive_power, type="l", ylab="Global_reactive_power")

#close PNG device
dev.off()