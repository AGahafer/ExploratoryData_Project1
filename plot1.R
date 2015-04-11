library(fastR)
#This loads in the data and puts the column names as titles for the columns instead of in the first row. This is 
#important because it allows more work to be done after
house_pwr_cons <- read.csv("C:/Users/C16Allison.Gahafer/Desktop/C2CYear/Spring2015/Math378/exdata-data-household_power_consumption/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                           nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

#This allows the dates from the original data set to be in the day, month, year format
house_pwr_cons$Date <- as.Date(house_pwr_cons$Date, format="%d/%m/%Y")

#This collects the data for only the dates specified in the assignment
projectdata <- subset(house_pwr_cons, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#This converts the date in times into dates and times that are similar to calander dates and times
datetime <- paste(as.Date(projectdata$Date), projectdata$Time)
projectdata$Datetime <- as.POSIXct(datetime)

#This creates a histogram with all the proper criteria
hist(projectdata$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#This saves the histogram as a png file with the specified settings and name
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()