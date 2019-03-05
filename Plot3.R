#setting the main path
path <- "household_power_consumption.txt"

#creating dataframe by reading the file
from_txt <- read.csv(path, sep = ";", dec = ".", stringsAsFactors = FALSE)

#read the names of columns
names(from_txt)

#subsetting the data to dates between 01-02-2007 to 02-02-2007
data <- subset(from_txt, from_txt$Date == "1/2/2007" | from_txt$Date == "2/2/2007")

#converting dates, time to Dates, Trime format, I know this step is unecessary but I prefer order to disorder.
as.Date(data$Date, "%Y/%m/%d")
strptime(data$Time, "%H:%M:%S")

# Chart 3
#gap <- as.numeric(data$Global_active_power)
submet1 <- as.numeric(data$Sub_metering_1)
submet2 <- as.numeric(data$Sub_metering_2)
submet3 <- as.numeric(data$Sub_metering_3)
dt <- paste(data$Date, data$Time, sep = " ")
dt_asdate <- strptime(dt, "%d/%m/%Y %H:%M:%S")
png("plot3.png")
plot(dt_asdate, submet1, type = "l", col="black", xlab="", ylab="Energy sub metering")
lines(dt_asdate, submet2, type = "l", col="red")
lines(dt_asdate, submet3, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, legend = c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"))
dev.off()