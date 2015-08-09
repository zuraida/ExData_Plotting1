setwd("C:/Users/Dr.Zuraida/Documents/data")
#reading the full data
data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

#subseting the data according to the range of the date
data_bydate <- subset(data_full, subset=(Date >= "2007-02-01" & Date<="2007-02-02"))

#combine date and time as one object
DateTime <- paste(as.Date(data_bydate$Date), data_bydate$Time)
#DateTime as a new column variable in the existing table.
data_bydate$Datetime <- as.POSIXct(DateTime)

#plot4
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))
plot(data_bydate$Global_active_power~data_bydate$Datetime, type="l", ylab="Global active power", xlab="")

plot(data_bydate$Voltage~data_bydate$Datetime, type="l", ylab="Voltage", xlab="datetime")

with(data_bydate, {
  plot(Sub_metering_1 ~ Datetime, type="l", ylab="Energy Sub Metering", xlab="")
  lines(Sub_metering_2 ~ Datetime, col="red")
  lines(Sub_metering_3 ~ Datetime, col="blue")
  ##plot(Temp, Ozone, main = "Ozone and Temperature")
  ##mtext("Ozone and Weather in New York City", outer = TRUE)
})
##legend("topright", pch = 0, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")))
legend("topright", col = c("black", "red", "blue"),lty=1,lwd=2, bty="n",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(data_bydate$Global_reactive_power~data_bydate$Datetime, type="l", ylab="Global reactive power", xlab="datetime")
dev.copy(png, file = "plot4.png", height=480, width=480) ## Copy my plot to a PNG file
dev.off()
