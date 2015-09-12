raw_data <- read.delim("household_power_consumption.txt", sep=";", na.strings="?",
        colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
#Convert Date column to date format
raw_data$Date <- as.Date(raw_data$Date, "%d/%m/%Y")
#Subset of data with dates 2007-02-01 and 2007-02-02
data_sub <- raw_data[ which(raw_data$Date >= as.Date("2007-02-01") & raw_data$Date <= as.Date("2007-02-02")),]

#Create a new date+time variable from col1 and col2
datetime <- strptime(paste(data_sub$Date, data_sub$Time), format="%Y-%m-%d %H:%M:%S")

#open PNG device
png("plot3.png",
    width = 480, height = 480, units = "px")

#draw Plot 3 line graph
plot(datetime, data_sub$Sub_metering_1, type="l", col="black", xlab=NA, ylab="Energy sub metering")
lines(datetime, data_sub$Sub_metering_2, col="red")
lines(datetime, data_sub$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"),  legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Close PNG device
dev.off()
