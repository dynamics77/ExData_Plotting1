## Overall goal

Our overall goal of the project is simply to examine how household energy usage
varies over a 2-day period in February, 2007. We will use R base plotting 
system to accomplish this task.

## Introduction to dataset

This assignment uses data from
the <a href="http://archive.ics.uci.edu/ml/">UC Irvine Machine
Learning Repository</a>, a popular repository for machine learning
datasets. As a part of the assignment, I have used the "Individual household
electric power consumption Data Set" which was made available on
the course web site by Dr Peng and co-workers:

* <b>Dataset</b>: <a href="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip">Electric power consumption</a> [20Mb]

* <b>Description</b>: Measurements of electric power consumption in
one household with a one-minute sampling rate over a period of almost
4 years. Different electrical quantities and some sub-metering values
are available.


The following descriptions of the 9 variables in the dataset are taken
from
the <a href="https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption">UCI
web site</a>:

<ol>
<li><b>Date</b>: Date in format dd/mm/yyyy </li>
<li><b>Time</b>: time in format hh:mm:ss </li>
<li><b>Global_active_power</b>: household global minute-averaged active power (in kilowatt) </li>
<li><b>Global_reactive_power</b>: household global minute-averaged reactive power (in kilowatt) </li>
<li><b>Voltage</b>: minute-averaged voltage (in volt) </li>
<li><b>Global_intensity</b>: household global minute-averaged current intensity (in ampere) </li>
<li><b>Sub_metering_1</b>: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered). </li>
<li><b>Sub_metering_2</b>: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light. </li>
<li><b>Sub_metering_3</b>: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.</li>
</ol>


## Making Plots

For each plot you should:

* Source individual R code files to recreate plots (e.g, source("plot1.R")).

* There are four separate R code file (`plot1.R`, `plot2.R`, etc.) that
constructs the corresponding plots, i.e. code in `plot1.R` constructs
the `plot1.png` plot. 

* After successful completion of the script, plots in PNG format are saved in the `figure` folder. Each plot has a width of 480 pixels and a height of 480 pixels.

## Note

* Make sure required R packages (i.e., lubridate,dplyr and tidyr) are installed.

* Data file is unziped and located in the current working directory.

##Acknowledgements:
I thank Dr. Peng for providing clean dataset as well as original README 
file with the detailed description of the variables in the dataset.
