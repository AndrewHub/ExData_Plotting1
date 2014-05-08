For peer reviewers' convenience.
========================================================

### A NOTE for peer reviewers:
#### Please make sure the household_power_consumption.txt is currently located in the working directory

### __Fig1__

```r
## Read in the data of July 1st - 2nd by pipe and egrep function (General
## Expression)
ge <- "egrep '^Date|^[1-2]/2/2007' household_power_consumption.txt"
consumption <- read.table(pipe(ge), header = T, sep = ";")
```



```r
## Create a histogram of global active power on screen device
hist(consumption$Global_active_power, xlab = "Global Active Power (kilowatts)", 
    ylab = "Frequency", main = "Global Active Power", col = "red")
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 



```r
## Copy the plot to a PNG file with a width of 480 pixels and a height of 480
## pixels
dev.copy(png, file = "plot1.png", width = 480, height = 480)

## Close the PNG device
dev.off()
```


### __Fig2__

```r
## Paste date and time together and coerce them into POSIXlt
date_list <- as.character(consumption$Date)
time_list <- as.character(consumption$Time)
Time_list <- paste(date_list, time_list)
Time_as_date <- strptime(Time_list, "%d/%m/%Y %H:%M:%S")
```



```r
## Create a df contains the time and gap data only
Global_active_power <- consumption$Global_active_power
df <- data.frame(Time_as_date, Global_active_power)
```



```r
## Create a plot of global active power on screen device
plot(df$Time_as_date, df$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
```

![plot of chunk unnamed-chunk-6](figure/unnamed-chunk-6.png) 



```r
## Copy the plot to a PNG file with a width of 480 pixels and a height of 480
## pixels
dev.copy(png, file = "plot2.png", width = 480, height = 480)

## Close the PNG device
dev.off()
```


### __Fig3__


```r
## create a df contains time and metering data only
df <- data.frame(Time_as_date, consumption[, c(7, 8, 9)])
```



```r
## Create a plot of Energy sub metering to date on screen device
plot(df$Time_as_date, df$Sub_metering_1, type = "l", col = "black", xlab = "", 
    ylab = "Energy sub metering")
lines(df$Time_as_date, df$Sub_metering_2, type = "l", col = "red")
lines(df$Time_as_date, df$Sub_metering_3, type = "l", col = "blue")
## Create legend on the topright
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", 
    "Sub_metering_2", "Sub_metering_3"))
```

![plot of chunk unnamed-chunk-9](figure/unnamed-chunk-9.png) 



```r
## Copy the plot to a PNG file with a width of 480 pixels and a height of 480
## pixels
dev.copy(png, file = "plot3.png", width = 480, height = 480)

## Close the PNG device
dev.off()
```


### __Fig4___

```r
## create a df contains time and required data for plotting
df <- data.frame(Time_as_date, consumption[, c(3, 4, 5, 7, 8, 9)])
```



```r
## Create 4 seperate plots on the same screen device
par(mfrow = c(2, 2), mar = c(4, 4, 0.5, 1), ps = 12, cex = 1, cex.axis = 0.85, 
    cex.lab = 0.85)
## plot1
plot(df$Time_as_date, df$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
## plot2
plot(df$Time_as_date, df$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
## plot3
plot(df$Time_as_date, df$Sub_metering_1, type = "l", col = "black", xlab = "", 
    ylab = "Energy sub metering")
lines(df$Time_as_date, df$Sub_metering_2, type = "l", col = "red")
lines(df$Time_as_date, df$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", 
    "Sub_metering_2", "Sub_metering_3"), bty = "n", cex = 0.6)
## plot4
plot(df$Time_as_date, df$Global_reactive_power, type = "l", xlab = "datetime", 
    ylab = "Global_reactive_power")
```

![plot of chunk unnamed-chunk-12](figure/unnamed-chunk-12.png) 



```r
## Copy the plot to a PNG file with a width of 480 pixels and a height of 480
## pixels
dev.copy(png, file = "plot4.png", width = 480, height = 480)

## Close the PNG device
dev.off()
```

