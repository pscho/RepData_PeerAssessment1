## Complete R Script for Rep Research 1

## Loading and preprocessing the data
df = read.csv("activity.csv", header=TRUE)

## What is mean total number of steps taken per day?
# Calculate the total number of steps taken per day
dayTotal = aggregate(df$steps, list(df$date), sum, na.rm=TRUE)

# Make a histogram of the total number of steps taken each day
# Manaully make intervals for better viewing
width = round(sqrt(length(dayTotal$x)))
bars = seq(min(dayTotal$x), max(dayTotal$x), by=( (max(dayTotal$x) - min(dayTotal$x)) / width ))
hist(dayTotal$x, breaks = bars, main = "Histogram of Total Number of Steps Taken per Day",
     xlab = "Total number of steps per day", col = "lightblue")

# Calculate and report the mean and median of the total number of steps taken per day
dayMean = aggregate(df$steps, list(df$date), mean, na.rm=TRUE)
# dayMean
dayMedian = aggregate(df$steps, list(df$date), median, na.rm=TRUE)
# dayMedian - all zeroes

## What is the average daily activity pattern?
# Time series plot of the 5-minute interval (x-axis) and 
# the average number of steps taken, averaged across all days (y-axis)
intervals = as.factor(df$interval)
intervalMean = aggregate(df$steps, list(intervals), mean, na.rm=TRUE)
colnames(intervalMean) = c("Interval", "Mean")
plot(intervalMean$Mean ~ intervalMean$Interval,
     main = paste("Time Series Plot of Average Number of Steps Taken\n",
                  "At Each 5-Minute Daily Interval"),
     xlab = "Daily Interval (in 5-minute increments)",
     ylab = "Mean Number of Steps Taken")
lines(intervalMean$Mean)

# Which 5-minute interval, on average across all the days in the dataset,
# contains the maximum number of steps?
intervalMean[which(intervalMean$Mean == max(intervalMean$Mean)),]
# 835 with mean 206.1698

## Inputing missing values
# Calculate and report the total number of missing values in the dataset
length(which(is.na(df$steps) == TRUE))

# Devise a strategy for filling in all of the missing values in the dataset:
# Replace NAs with the mean value for the specific time interval
newSteps = df$steps
for (i in which(is.na(newSteps) == TRUE)) {
  newSteps[i] = intervalMean[which(intervalMean$Interval == df$interval[i]),2]
}

# Create a new dataset that is equal to the original dataset 
# but with the missing data filled in
newDf = data.frame(newSteps, df$date, df$interval)
colnames(newDf) = c("steps", "date", "interval")

# Make a histogram of the total number of steps taken each day and...
newDayTotal = aggregate(newDf$steps, list(newDf$date), sum, na.rm=TRUE)
hist(newDayTotal$x, breaks = bars, main = "Histogram of Total Number of Steps Taken per Day",
     xlab = "Total number of steps per day", col = "lightpink")

# ...Calculate and report the mean and median total number of steps taken per day
newDayMean = aggregate(newDf$steps, list(newDf$date), mean, na.rm=TRUE)
# newDayMean
newDayMedian = aggregate(newDf$steps, list(newDf$date), median, na.rm=TRUE)
# newDayMedian

# Do these values differ from the estimates from the first part of the assignment?
# Yes.

# What is the impact of imputing missing data on the estimates of the total daily number of steps?
# Since the NAs have been filled with the mean values, there is a greater frequency of totals at
# the center, resulting in a more bell-shaped distribution for the total step count. 

## Are there differences in activity patterns between weekdays and weekends?
# Create a new factor variable in the dataset with two levels - "weekday" and "weekend"
weekDay = weekdays(as.POSIXct(df$date))
newDf$dayType = as.factor(ifelse( (weekDay == "Saturday" | weekDay == "Sunday"),
                                 "weekend", "weekday"))
# Interval means for weekdays and weekends
newIntervalMean = aggregate(newDf$steps, list(intervals,
                                              newDf$dayType == "weekend"), mean, na.rm=TRUE)
colnames(newIntervalMean) = c("Interval", "isWeekend", "Mean")
intMeanDay = newIntervalMean[newIntervalMean$isWeekend == FALSE, c(1,3)]
intMeanWeek = newIntervalMean[newIntervalMean$isWeekend == TRUE, c(1,3)]

# Panel plot containing a time series plot of the 5-minute interval (x-axis) 
# and the average number of steps taken, averaged across all weekday days or weekend days (y-axis)
par(mfrow=c(2,1))
plot(intMeanDay$Mean ~ intMeanDay$Interval,
     xlab = "Daily Interval (in 5-minute increments)",
     ylab = "Mean Number of Steps Taken")
lines(intMeanDay$Mean)
title(paste("Average Number of Steps Taken\n",
            "At Each 5-Minute Daily Interval (Weekdays)"))
plot(intMeanWeek$Mean ~ intMeanWeek$Interval,
     xlab = "Daily Interval (in 5-minute increments)",
     ylab = "Mean Number of Steps Taken",
     ylim = c(0,200))
lines(intMeanWeek$Mean)
title(paste("Average Number of Steps Taken\n",
            "At Each 5-Minute Daily Interval (Weekends)"))


