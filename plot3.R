############## Read and adjust data set for plot3 ##############

# Read in data.
# Assumption: Data has been unzipped and is in user's working directory:
a <- read.csv("household_power_consumption.txt", header = TRUE, sep=";")

# Get rid of unnecessary columns:
a <- a[,c("Date", "Time", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3") ]

# Get rid on unnecessary rows:
a <- a[a$Date == ("1/2/2007") | a$Date == ("2/2/2007") , ]


# Make new column that is combination of Date and Time: POSIXlt POSIXt:
a$Datetime <- strptime(paste(a$Date, a$Time, sep = ":"), format='%d/%m/%Y:%H:%M:%S')


############## Code to make plot3.png ##############


# Open up graphics device:
png(filename = "plot3.png", width = 480, height = 480 )

# Draw plot:
my_y = "Energy sub metering"
plot(a$Datetime, a$Sub_metering_1, xlab = "", ylab = my_y, type = "l")

# Legend:
l1 <- "Sub_metering_1"
l2 <- "Sub_metering_2"
l3 <- "Sub_metering_3"
legend("topright", lwd=c(1,1,1), col=c("black","red","blue"), legend = c(l1,l2,l3))

# Next two plots
points(a$Datetime,a$Sub_metering_2, type = "l", col="red")
points(a$Datetime,a$Sub_metering_3, type = "l", col="blue")

# Close graphics device:
dev.off()


############## END ############## 


############## Draw plot3 to screen--Commented out ############## 

# my_y = "Energy sub metering"
# plot(a$Datetime, a$Sub_metering_1, xlab = "", ylab = my_y, type = "l")
# 
# # Legend:
# l1 <- "Sub_metering_1"
# l2 <- "Sub_metering_2"
# l3 <- "Sub_metering_3"
# legend("topright", lwd=c(1,1,1), col=c("black","red","blue"), legend = c(l1,l2,l3))
# 
# # Next two plots
# points(a$Datetime,a$Sub_metering_2, type = "l", col="red")
# points(a$Datetime,a$Sub_metering_3, type = "l", col="blue")


