# Read the 48 hours (2880 minutes) that make up February 1st and 2nd
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
# Open a png, draw the line graph, and close the file.
png(filename = "plot2.png", width=480, height=480)
plot(datetime, 
     data$Global_active_power, 
     type="l",
     xlab = "",
     ylab="Global Active Power (kilowatts)")
dev.off()