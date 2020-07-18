library(lubridate)

#url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip0"
#download.file(url,destfile = "Data.zip")
#unzip(zipfile = "Data.zip")
list.files()
data<-subset(read.table("household_power_consumption.txt",sep = ";",header = TRUE),Date=="1/2/2007"|Date=="2/2/2007")
#data$Date<-as.Date(data$Date,format="%d/%m/%Y")
data$Date_Time<-strptime(paste(data$Date,data$Time),format = "%d/%m/%Y %H:%M:%S")
data$Global_active_power<-as.numeric(data$Global_active_power)
png("plot2.png", width=480, height=480)
plot(data$Date_Time,data$Global_active_power,type = "l",ylab = "Global Active Power (kilowatts)", xlab="")
title(main="Global Active Power Vs Time")

dev.off()




