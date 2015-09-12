raw_data <- read.delim("household_power_consumption.txt", sep=";", na.strings="?",
        colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
#Convert Date column to date format
raw_data$Date <- as.Date(raw_data$Date, "%d/%m/%Y")
#Subset of data with dates 2007-02-01 and 2007-02-02
data_sub <- raw_data[ which(raw_data$Date >= as.Date("2007-02-01") & raw_data$Date <= as.Date("2007-02-02")),]

#open PNG device
png("plot1.png",
    width = 480, height = 480, units = "px")

#draw Plot 1 histogram
hist(data_sub$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#Close PNG device
dev.off()
