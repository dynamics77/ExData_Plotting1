library(lubridate)
library(dplyr)
library(tidyr)

#read data file
df.all<- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)

#tidy data for plotting using dplyr chaining
#only need data for two days on feb
df.subset<-mutate(df.all,date=dmy(Date))%>%
  filter(date<=as.POSIXlt("2007-02-02") & date>=as.POSIXlt("2007-01-31"))%>%
  unite(time,c(Date,Time),sep=" ")

# Get datetime data in Date class format. 
#`mutate` in dplyr does not support `POSIXlt` results. 
df.subset$time<-strptime(df.subset$time, "%d/%m/%Y %H:%M:%S")

#copy df.subet to newdf. Use this (newdf) final dataframe to make plots in base R.
newdf<-df.subset

png("plot4.png",width=480, height=480, bg="transparent")
par(mfrow=c(2,2)) 

plot(newdf$time,newdf$Global_active_power,type='l',xlab="",ylab="Global Active Power")
plot(newdf$time,newdf$Voltage,type='l',xlab = "datetime",ylab="Voltage")

plot(newdf$time,newdf$Sub_metering_1,type='l',ylab="Energy sub metering",xlab="")
points(newdf$time,newdf$Sub_metering_2,type='l',col='red')
points(newdf$time,newdf$Sub_metering_3,type='l',col='blue')
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"), lwd=2,lty=1,bty="n")

plot(newdf$time,newdf$Global_reactive_power,type='l',ylim=c(0,.5),
     xlab = "datetime",ylab="Global_reactive_power")

dev.off()