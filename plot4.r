# Read the 48 hours (2880 minutes) th
data <- read.table("household_power_consumption.txt", 
                   header=TRUE, 
                   sep=";", 
                   na.strings="?", 
                   skip=66636, 
                   nrows=2880)
# 'skip' in the previous function lost our colnames, so we copy them from a
# second read.
colnames(data) <- colnames(read.table("household_power_consumption.txt",
                                 header=TRUE,
                                 sep=";",
                                 nrows=1))
# Combine date and time columns into POSIXlt format
datetime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

# Open a png, draw a blank graph, add the lines and legend, and close the file.
png(filename = "plot4.png", width=480, height=480)
par(mfrow=c(2, 2))

# Top left
plot(datetime, 
     data$Global_active_power, 
     xlab="", 
     ylab="Global Active Power",
     type="l")

# Top right
with(data, plot(datetime,
                 Voltage,
                 type="l",))

# Bottom left
plot(datetime, 
     data$Sub_metering_1, 
     type="n",
     xlab = "",
     ylab="Energy sub metering")
with(data,
     {
         lines(datetime, Sub_metering_1)
         lines(datetime, Sub_metering_2, col="red")
         lines(datetime, Sub_metering_3, col="blue")
     })
legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"),
       lwd = 1,
       bty="n")

# Bottom right
with(data, plot(datetime,
                Global_reactive_power,
                type="l",))
dev.off()