##read data file. computer has sufficient memory to store entire file.
##clarify header and delimiter
data <- read.table("household_power_consumption.txt", 
header = TRUE, 
sep = ";")
 
##pull out the desired rows using a subset
sub_data <- subset(data, 
data$Date == "1/2/2007" | data$Date == "2/2/2007", 
select = c(1:9)
)

##upload datasets packagage
library(datasets)

##format date/time data
date <- sub_data$Date ##extract Date column
time <- sub_data$Time ##extract Time column
date_time_char <- paste(date, time) ##paste Date and Time together
date_time <- strptime(date_time_char, "%d/%m/%Y %H:%M:%S") ##convert to date/time format

##format data for plotting
plot_data <- as.numeric(as.character(sub_data$Global_active_power))
plot_data2 <- as.numeric(as.character(sub_data$Voltage))
plot_data4 <- as.numeric(as.character(sub_data$Global_reactive_power))

##format sub_metering data
sub_met1 <- as.numeric(as.character(sub_data$Sub_metering_1))
sub_met2 <- as.numeric(as.character(sub_data$Sub_metering_2))
sub_met3 <- as.numeric(as.character(sub_data$Sub_metering_3))

##set parameter to for plots in single device
par(mfrow = c(2, 2))

##create plot 1
plot(date_time, ##select date_time for x axis
plot_data, ##select plot_data for y axis
type = "l", ##format as line graph plot
ylab = "Global Active Power", ##create y axis label
cex.axis = 0.75, ##format axis size
cex.lab = 0.75, ##format axis label size
xlab = "" ##eliminate x axis label
)

##create plot 2
plot(date_time, ##select date_time for x axis
plot_data2, ##select plot_data for y axis
type = "l", ##format as line graph plot
ylab = "Voltage", ##create y axis label
cex.axis = 0.75, ##format axis size
cex.lab = 0.75, ##format axis label size
xlab = "datetime" ##eliminate x axis label
)

##create base plot 3
plot(date_time, 
sub_met1, 
type = "n",
ylab = "Energy sub metering", ##create y axis label
cex.axis = 0.75, ##format axis size
cex.lab = 0.75, ##format axis label size
xlab = "" ##eliminate x axis label
)

##add lines for plot 3
lines(date_time, sub_met1, col = "black")
lines(date_time, sub_met2, col = "red")
lines(date_time, sub_met3, col = "blue")

##add legend for plot 3
legend("topright", ##sets position
lty = 1, ##sets line type
col = c("black", "red", "blue"), ##sets colors
legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), ##sets labels
cex = 0.60, ##sets size
bty = "n") ##eliminates column border

##create plot 4
plot(date_time, ##select date_time for x axis
plot_data4, ##select plot_data for y axis
type = "l", ##format as line graph plot
ylab = "Global_reactive_power", ##create y axis label
cex.axis = 0.75, ##format axis size
cex.lab = 0.75, ##format axis label size
xlab = "datetime" ##eliminate x axis label
)

##save to png file
dev.copy(png, ##png device
"plot4.png", ##name file
height = 480, ##set height and width
width = 480, 
bg = "transparent" ##set background color
)

##close device
dev.off()
