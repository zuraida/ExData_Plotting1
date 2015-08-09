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

#plot2

plot(data_bydate$Global_active_power~data_bydate$Datetime, type="l", ylab="Global active power", xlab="")
dev.copy(png, file = "plot2.png", height=480, width=480) ## Copy my plot to a PNG file
dev.off()
