#Exploratory Data Analysis
# Project 1

#  Read the data
filename= "household_power_consumption.txt"
# there are 1440 minutes per day (rows); dataset starts on Dec 16.  So 47 days 
# or 67680 rows to skip.
# Assignment to work with 2 days 2/1 and 2/2 2006, so we'll just read 2880 rows.

#energyraw=read.table(filename,header=TRUE,sep=";",stringsAsFactors=FALSE,skip=67680,nrows=2880)
energyraw=read.table(filename,header=TRUE,sep=";",stringsAsFactors=FALSE,
                     nrows=70000,na.strings="?")
summary(energyraw)
#library(lubridate)

temp=paste(energyraw$Date,energyraw$Time)
dateTimes=strptime(temp,"%d/%m/%Y %H:%M:%S")

y=as.Date(energyraw$Date,"%d/%m/%Y")
energytemp=cbind(energyraw,dateTimes)
energytemp$Date=y
energydat=subset(energytemp,(Date>="2007-02-01") & (Date<"2007-02-03"))
#

# Plot 4

png(file="plot4.png")
par(mfrow=c(2,2))
#plot 2
with(energydat,plot(dateTimes,Global_active_power, type="l",
                                        ylab="Global Active Power(kilowatts)",xlab=""))

with(energydat,plot(dateTimes,Voltage, type="l",ylab="Voltage",xlab="datetime"))                    
                
# plot 3
 with(energydat,{
      plot(dateTimes,Sub_metering_1, type="l",
        ylab="Energy sub metering",xlab="")
        
      lines(dateTimes,Sub_metering_2, type="l",col="red")
      lines(dateTimes,Sub_metering_3, type="l",col="blue")
      legend("topright",lty=c(1,1,1), 
      c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
      col=c("black","red","blue"),)
})                    
                    
with(energydat,plot(dateTimes,Global_reactive_power, type="l",xlab="datetime"))
                    
dev.off()                    

