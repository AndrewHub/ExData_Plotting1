## a NOTE for peer reviewers:
## Please make sure the household_power_consumption.txt
## is currently located in the working directory

## Read in the data of July 1st - 2nd
## by pipe and egrep function (General Expression)
ge <- 'egrep \'^Date|^[1-2]/2/2007\' household_power_consumption.txt'
consumption <- read.table(pipe(ge), header=T, sep=";")

## Create a histogram of global active power on
## screen device
hist(consumption$Global_active_power, 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", 
     main = "Global Active Power", col = "red")

## Copy the plot to a PNG file with a width of 
## 480 pixels and a height of 480 pixels
dev.copy(png, file = "plot1.png", width = 480, height = 480)

## Close the PNG device
dev.off()