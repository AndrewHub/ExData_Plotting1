For the convenience of peer reviews
========================================================

### A NOTE for peer reviewers:
#### Please make sure the household_power_consumption.txt is currently located in the working directory

### __Fig1__
__Read in the data of July 1st - 2nd by pipe and egrep function (General Expression)__

```r
ge <- "egrep '^Date|^[1-2]/2/2007' household_power_consumption.txt"
consumption <- read.table(pipe(ge), header = T, sep = ";")
```


__Create a histogram of global active power on screen device__

```r
hist(consumption$Global_active_power, xlab = "Global Active Power (kilowatts)", 
    ylab = "Frequency", main = "Global Active Power", col = "red")
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 


__Copy the plot to a PNG file with a width of 480 pixels and a height of 480 pixels__

```r
dev.copy(png, file = "plot1.png", width = 480, height = 480)
```


__Close the PNG device__

```r
dev.off()
```


### __Fig2__
__Paste date and time together and coerce them into POSIXlt__

```r
date_list <- as.character(consumption$Date)
time_list <- as.character(consumption$Time)
Time_list <- paste(date_list, time_list)
Time_as_date <- strptime(Time_list, "%d/%m/%Y %H:%M:%S")
```


__Create a df contains the time and gap data only__

```r
Global_active_power <- consumption$Global_active_power
df <- data.frame(Time_as_date, Global_active_power)
```


__Create a plot of global active power on screen device__

```r
plot(df$Time_as_date, df$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
```

![plot of chunk unnamed-chunk-7](figure/unnamed-chunk-7.png) 


__Copy the plot to a PNG file with a width of 480 pixels and a height of 480 pixels__

```r
dev.copy(png, file = "plot2.png", width = 480, height = 480)
```


__Close the PNG device__

```r
dev.off()
```


### __Fig3__

__create a df contains time and metering data only__

```r
df <- data.frame(Time_as_date, consumption[, c(7, 8, 9)])
```


__Create a plot of Energy sub metering to date on screen device__

```r

plot(df$Time_as_date, df$Sub_metering_1, type = "l", col = "black", xlab = "", 
    ylab = "Energy sub metering")
lines(df$Time_as_date, df$Sub_metering_2, type = "l", col = "red")
lines(df$Time_as_date, df$Sub_metering_3, type = "l", col = "blue")
```

![plot of chunk unnamed-chunk-11](figure/unnamed-chunk-11.png) 


__Create legend on the topright__

```r
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", 
    "Sub_metering_2", "Sub_metering_3"))
```

```
## Error: plot.new has not been called yet
```


__Copy the plot to a PNG file with a width of 480 pixels and a height of 480 pixels__

```r
dev.copy(png, file = "plot3.png", width = 480, height = 480)
```


__Close the PNG device__

```r
dev.off()
```


### __Fig4__

__Create a df contains time and required data for plotting__

```r
df <- data.frame(Time_as_date, consumption[, c(3, 4, 5, 7, 8, 9)])
```


__Create 4 seperate plots on the same screen device__

```r
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

![plot of chunk unnamed-chunk-16](figure/unnamed-chunk-16.png) 


__Copy the plot to a PNG file with a width of 480 pixels and a height of 480 pixels__

```r
dev.copy(png, file = "plot4.png", width = 480, height = 480)
```


__Close the PNG device__

```r
dev.off()
```

