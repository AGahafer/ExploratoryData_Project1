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

#UNTIL THIS POINT WAS THE SAME AS PLOT1
#This 4 plot area is made using concepts mainly from plots 2 and 3. The sub-metering plot is on here, as well as 3 line
#plots similar to the plot in #2. This was not any more difficult to make one I realized what I needed to do. But  was 
#difficult to see where everything went because I did not originally have everything inside the with statement. 

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(projectdata, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_m_1", "Sub_m_2", "Sub_m_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})

#This saves the plot as plot4
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
