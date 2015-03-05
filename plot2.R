library(lubridate)
library(dplyr)
library(tidyr)

#download and unzip data file in the current working directory from this location:
#<b>Dataset</b>: 
#  <a href="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip">Electric power consumption</a> [20Mb]

#now read data file
#check if file is located in the current working directory

if (!file.exists("household_power_consumption.txt")){
  stop("Error, file household_power_consumption.txt not found in current directory")
}

df.all<- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)

#tidy data for plotting using dplyr chaining
#only need data for two days on feb
#create new column 'datetime' combining Date and Time

df.subset<-mutate(df.all,date=dmy(Date))%>%
  filter(date<=as.POSIXlt("2007-02-02") & date>=as.POSIXlt("2007-01-31"))%>%
  unite(datetime,c(Date,Time),sep=" ")

# Get "datetime" column in Date class format. 
#`mutate` in dplyr does not support `POSIXlt` results. 
df.subset$datetime<-strptime(df.subset$datetime, "%d/%m/%Y %H:%M:%S")

#copy df.subet to newdf. Use this (newdf) final dataframe to make plots in base R.
newdf<-df.subset

if (!file.exists("figure")){
  dir.create("figure")
}

#make the plot and save png file
png("figure/plot2.png",width = 480, height = 480,bg="transparent")
plot(newdf$datetime,newdf$Global_active_power,type='l',xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
