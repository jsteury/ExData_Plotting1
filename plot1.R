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
# Plot 1
# Histogram of global active power
png(file="plot1.png")
with(energydat,hist(Global_active_power,col="red",
     xlab="Global Active Power(kilowatts)",
     main="Global Active Power"))
dev.off()
     
