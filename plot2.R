############## Read and adjust data set for plot2 ##############

# Read in data.
# Assumption: Data has been unzipped and is in user's working directory:
a <- read.csv("household_power_consumption.txt", header = TRUE, sep=";")

# Get rid of unnecessary columns:
a <- a[,c("Date", "Time", "Global_active_power") ]

# Get rid on unnecessary rows:
a <- a[a$Date == ("1/2/2007") | a$Date == ("2/2/2007") , ]

# Make new column that is combination of Date and Time:
a$Datetime <- strptime(paste(a$Date, a$Time, sep = ":"), format='%d/%m/%Y:%H:%M:%S')


############## Code to make plot2.png ##############

# Open up graphics device:
png(filename = "plot2.png", width = 480, height = 480 )

# Draw plot:
y_label <- "Global Active Power (kilowatts)"
plot(a$Datetime, a$Global_active_power, type = "l", xlab="", ylab = y_label)

# Close graphics device:
dev.off()

############## END ############## 


############## Draw plot2 to screen--Commented out ############## 

#y_label <- "Global Active Power (kilowatts)"
#plot(a$Datetime, a$Global_active_power, type = "l", xlab="", ylab = y_label)