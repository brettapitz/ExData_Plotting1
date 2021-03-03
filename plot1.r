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
# Open a png, draw the histogram, and close the file.
png(filename = "plot1.png", width=480, height=480)
with(data, hist(Global_active_power, 
                col="red", 
                main="Global Active Power", 
                xlab="Global Active Power (kilowatts"
                ))
dev.off()