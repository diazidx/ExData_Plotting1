#Load packages needed
library(dplyr)

#setting the main path
path <- "household_power_consumption.txt"

#creating dataframe by reading the file
from_txt <- read.csv(path, sep = ";", dec = ".", stringsAsFactors = FALSE)

#read the names of columns
names(from_txt)

#subsetting the data to dates between 01-02-2007 to 02-02-2007
data <- subset(from_txt, from_txt$Date == "1/2/2007" | from_txt$Date == "2/2/2007")

#converting dates, time to Dates, Trime format
as.Date(data$Date, "%Y/%m/%d")
strptime(data$Time, "%H:%M:%S")

# Chart 1
gap <- as.numeric(data$Global_active_power)
hist(gap,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")