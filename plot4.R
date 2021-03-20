############## Read and adjust data set for plot4 ##############

# Read in data.
# Assumption: Data has been unzipped and is in user's working directory:
a <- read.csv("household_power_consumption.txt", header = TRUE, sep=";")

# Get rid on unnecessary rows:
a <- a[a$Date == ("1/2/2007") | a$Date == ("2/2/2007") , ]


# Make new column that is combination of Date and Time: POSIXlt POSIXt:
a$datetime <- strptime(paste(a$Date, a$Time, sep = ":"), format= '%d/%m/%Y:%H:%M:%S')



############## Code to make plot4.png ##############

# Open up graphics device:
png(filename = "plot4.png", width = 480, height = 480 )


# Make adjustments to par() to print 4 graphs in 2 by 2 grid.
# And fill by columns:

par(mfcol=c(2,2))

# Draw 1st graph:
my_y = "Global Active Power"
plot(a$datetime, a$Global_active_power, type = "l", xlab="", ylab = my_y)

#Draw 2nd graph:
my_y = "Energy sub metering"
plot(a$datetime, a$Sub_metering_1, xlab = "", ylab = my_y, type = "l")#, type = "n")
# Legend:
l1 <- "Sub_metering_1"
l2 <- "Sub_metering_2"
l3 <- "Sub_metering_3"
legend("topright", lwd=c(1,1,1), col=c("black","red","blue"), legend = c(l1,l2,l3), bty = "n")
points(a$datetime,a$Sub_metering_2, type = "l", col="red")
points(a$datetime,a$Sub_metering_3, type = "l", col="blue")

#Draw 3rd graph:
plot(a$datetime, a$Voltage, xlab="datetime", ylab = "Voltage", type = "l")

#Draw 4th graph:
my_y = "Global_reactive_power"
plot(a$datetime, a$Global_reactive_power, xlab="datetime", ylab = my_y, type = "l")

# Close graphics device:
dev.off()

#return mfcol to default:
par(mfcol=c(1,1))

############## END ############## 


############## Draw plot4 to screen--Commented out ############## 


# par(mfcol=c(2,2))
# 
# # Draw 1st graph:
# my_y = "Global Active Power"
# plot(a$datetime, a$Global_active_power, type = "l", xlab="", ylab = my_y)
# 
# #Draw 2nd graph:
# my_y = "Energy sub metering"
# plot(a$datetime, a$Sub_metering_1, xlab = "", ylab = my_y, type = "l")#, type = "n")
# # Legend:
# l1 <- "Sub_metering_1"
# l2 <- "Sub_metering_2"
# l3 <- "Sub_metering_3"
# legend("topright", lwd=c(1,1,1), col=c("black","red","blue"), legend = c(l1,l2,l3), bty = "n")
# points(a$datetime,a$Sub_metering_2, type = "l", col="red")
# points(a$datetime,a$Sub_metering_3, type = "l", col="blue")
# 
# #Draw 3rd graph:
# plot(a$datetime, a$Voltage, xlab="datetime", ylab = "Voltage", type = "l")
# 
# #Draw 4th graph:
# my_y = "Global_reactive_power"
# plot(a$datetime, a$Global_reactive_power, xlab="datetime", ylab = my_y, type = "l")
# 
# #return mfcol to default:
# par(mfcol=c(1,1))





