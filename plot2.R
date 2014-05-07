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

##format Global_active_power data for plotting
plot_data <- as.numeric(as.character(sub_data$Global_active_power))

##format date/time data
date <- sub_data$Date ##extract Date column
time <- sub_data$Time ##extract Time column
date_time_char <- paste(date, time) ##paste Date and Time together
date_time <- strptime(date_time_char, "%d/%m/%Y %H:%M:%S") ##convert to date/time format

##create line graph
plot(date_time, ##select date_time for x axis
plot_data, ##select plot_data for y axis
type = "l", ##format as line graph plot
ylab = "Global Active Power (kilowatts)", ##create y axis label
cex.axis = 0.75, ##format axis size
cex.lab = 0.75, ##format axis label size
xlab = "" ##eliminate x axis label
)

##save to png file
dev.copy(png, ##png device
"plot2.png", ##name file
height = 480, ##set height and width
width = 480, 
bg = "transparent" ##set background color
)

##close device
dev.off()
