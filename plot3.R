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

##format Global_active_power data for plotting
plot_data <- as.numeric(as.character(sub_data$Global_active_power))


##format sub_metering data
sub_met1 <- as.numeric(as.character(sub_data$Sub_metering_1))
sub_met2 <- as.numeric(as.character(sub_data$Sub_metering_2))
sub_met3 <- as.numeric(as.character(sub_data$Sub_metering_3))



##create base plot 3
plot(date_time, 
sub_met1, 
type = "n",
ylab = "Energy sub metering", ##create y axis label
cex.axis = 0.75, ##format axis size
cex.lab = 0.75, ##format axis label size
xlab = "" ##eliminate x axis label
)

##add lines
lines(date_time, sub_met1, col = "black")
lines(date_time, sub_met2, col = "red")
lines(date_time, sub_met3, col = "blue")

##add legend
legend("topright", ##sets position
lty = 1, ##sets line type
col = c("black", "red", "blue"), ##sets colors
legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), ##sets labels
cex = 0.60 ##sets size
)

##save to png file
dev.copy(png, ##png device
"plot3.png", ##name file
height = 480, ##set height and width
width = 480, 
bg = "transparent" ##set background color
)

##close device
dev.off()

