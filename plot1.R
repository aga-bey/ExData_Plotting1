############## Read and adjust data set for plot1 ##############

# Read in data.
# Assumption: Data has been unzipped and is in user's working directory:
a <- read.csv("household_power_consumption.txt", header = TRUE, sep=";")

# "Date" is character vector with format: day, month, year w/century
# Convert it to class "Date":
a$Date <- as.Date(a$Date,"%d/%m/%Y")

# Subset data set to just rows for Feb 1-2, 2007:
a <- a[a$Date == "2007-02-01" | a$Date == "2007-02-02" , ]

# Prepare data for histogram by converting char values to numeric:
a$Global_active_power <- as.numeric(a$Global_active_power)



############## Code to make plot1.png ##############

# Open up graphics device:
png(filename = "plot1.png", width = 480, height = 480 )

# Draw plot:
hist(a$Global_active_power, col = "red", main = "Global Active Power", xlab="Global Active Power (kilowatts)")

# Close grahics device:
dev.off()

############## END ############## 



############## Draw plot1 to screen--Commented out ############## 

#hist(a$Global_active_power, col = "red", main = "Global Active Power", xlab="Global Active Power (kilowatts)")
