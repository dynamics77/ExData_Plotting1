library(lubridate)
library(dplyr)
library(tidyr)

#read data file
#it assumed that the csv file is located in the current working directory

if (!file.exists("household_power_consumption.txt")){
  stop("Error, file household_power_consumption.txt not found in current directory")
}

df.all<- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)

#tidy data for plotting using dplyr chaining
#only need data for two days on feb

df.subset<-mutate(df.all,date=dmy(Date))%>%
  filter(date<=as.POSIXlt("2007-02-02") & date>=as.POSIXlt("2007-01-31"))

#copy df.subet to newdf. Use this (newdf) final dataframe to make plots in base R.
newdf<-df.subset

#make the plot and save png file
png("plot1.png",width = 480, height = 480,bg="transparent")
hist(as.numeric(newdf$Global_active_power),col="red",main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()
