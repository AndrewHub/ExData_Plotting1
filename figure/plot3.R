## a NOTE for peer reviewers:
## Please make sure the household_power_consumption.txt
## is currently located in the working directory

## Read in the data of July 1st - 2nd
## by pipe and egrep function (General Expression)
ge <- 'egrep \'^Date|^[1-2]/2/2007\' household_power_consumption.txt'
consumption <- read.table(pipe(ge), header=T, sep=";")

## Paste date and time together and coerce them into POSIXlt
date_list <- as.character(consumption$Date)
time_list <- as.character(consumption$Time)
Time_list <- paste(date_list, time_list)
Time_as_date <- strptime(Time_list, "%d/%m/%Y %H:%M:%S")

## create a df contains time and metering data only
df <- data.frame(Time_as_date, consumption[,c(7, 8, 9)])

## Create a plot of Energy sub metering to date
## on screen device
plot(df$Time_as_date, df$Sub_metering_1, 
     type = "l", 
     col = "black", 
     xlab = "", 
     ylab = "Energy sub metering")
lines(df$Time_as_date, df$Sub_metering_2, 
       type = "l", 
       col = "red")
lines(df$Time_as_date, df$Sub_metering_3, 
       type = "l", 
       col = "blue")
## Create legend on the topright
legend("topright", lty = 1, col=c("black", "red", "blue"),
       legend = c("Sub_metering_1",
                  "Sub_metering_2",
                  "Sub_metering_3"))

## Copy the plot to a PNG file with a width of 
## 480 pixels and a height of 480 pixels
dev.copy(png, file = "plot3.png", width = 480, height = 480)

## Close the PNG device
dev.off()