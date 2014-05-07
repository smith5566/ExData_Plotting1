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

##format data for plotting
plot_data <- as.numeric(as.character(sub_data$Global_active_power))

##create histogram
hist(plot_data, 
main = "Global Active Power", ##title
xlab = "Global Active Power (kilowatts)", #x-axis label
col = "red", #color
cex.main = 0.85, #title size
cex.axis = 0.75, #axis size
cex.lab = 0.75 #axis label size
)

##save to png file
dev.copy(png, ##png device
"plot1.png", ##name file
height = 480, ##set height and width
width = 480, 
bg = "transparent" ##set background color
)

##close device
dev.off()