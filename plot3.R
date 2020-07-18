library(lubridate)

#url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip0"
#download.file(url,destfile = "Data.zip")
#unzip(zipfile = "Data.zip")
list.files()
data<-subset(read.table("household_power_consumption.txt",sep = ";",header = TRUE),Date=="1/2/2007"|Date=="2/2/2007")
#data$Date<-as.Date(data$Date,format="%d/%m/%Y")
data$Date_Time<-strptime(paste(data$Date,data$Time),format = "%d/%m/%Y %H:%M:%S")
data$Sub_metering_1<-as.numeric(data$Sub_metering_1)
data$Sub_metering_2<-as.numeric(data$Sub_metering_2)
data$Sub_metering_3<-as.numeric(data$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(data$Date_Time,data$Sub_metering_1,type = "n",ylab = "Energy sub metering", xlab="")
lines(data$Date_Time,data$Sub_metering_1)
lines(data$Date_Time,data$Sub_metering_2,col="Red")
lines(data$Date_Time,data$Sub_metering_3,col="Blue")
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
title(main="Energy sub-metering")

dev.off()




