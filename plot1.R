library(lubridate)
library(dplyr)
library(tidyr)

#make sure requried packagees are installed and loaded
if(!require(dplyr) | !require(lubridate) | !require(tidyr)) {
  stop('The required packages not installed')
}

#If not done already, please download and unzip data file in the current working directory from this location:
#Dataset: 
#  https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

#check if file is located in the current working directory
if (!file.exists("household_power_consumption.txt")){
  stop("Error, file household_power_consumption.txt not found in current directory")}

#now read data file
df.all<- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)

#tidy data for plotting using dplyr chaining
#only need data for two days on feb
df.subset<-mutate(df.all,date=dmy(Date))%>%
  filter(date<=as.POSIXlt("2007-02-02") & date>=as.POSIXlt("2007-01-31"))

#copy df.subet to newdf. Use this (newdf) final dataframe to make plots in base R.
newdf<-df.subset

#create a figure folder if it does not exist 

if (!file.exists("figure")){
  dir.create("figure")
}

#make the figure and save a png format file in the figure folder
png("figure/plot1.png",width = 480, height = 480, bg="transparent")
hist(as.numeric(newdf$Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
