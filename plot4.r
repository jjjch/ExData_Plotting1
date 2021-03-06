# 05/10/2014
# Course Project 1 related to the course "Exploratory Data Analysis" of Coursera.
# plot4

rm(list=ls())
#reading data into R (you need to put the data in a sub-directory named on "Explor"):
data<- read.table("./household_power_consumption.txt", sep=";",nrows= 2075259, header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")

# Subsetting the full data to obtain the data related to two days: 
subdata<- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007")) 

# Changing the class of Date variable from character to Date: 
subdata$Date <- as.Date(subdata$Date, format = "%d/%m/%Y")
# Combining the Date and Time variable and creating a new column in dataset named "DateTime":
subdata$DateTime <- as.POSIXct(paste(subdata$Date, subdata$Time))

# Creating the plot4:
png("plot4.png", width = 480, height = 480)
par(mfcol=c(2,2)) # adding plots in col-wised manner.
plot(subdata$DateTime, subdata$Global_active_power, type= "l", lwd=1, ylab= "Global Active Power (kilowatts)", xlab="") # Adding the first plot.
plot(subdata$DateTime, subdata$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(subdata$DateTime, subdata$Sub_metering_2, type="l", col="red")
lines(subdata$DateTime, subdata$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty="n", col=c("black", "red", "blue")) # The end of adding the second plot.
plot(subdata$DateTime, subdata$Voltage, type="l", xlab="datetime", ylab="Voltage")   # Adding the third plot.
plot(subdata$DateTime, subdata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")  # Adding the forth plot.
dev.off()