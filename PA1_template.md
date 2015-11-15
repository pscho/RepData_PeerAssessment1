# Reproducible Research: Peer Assessment 1


## Loading and preprocessing the data

```r
df = read.csv("activity.csv", header=TRUE)
```


## What is mean total number of steps taken per day?

Calculate the total number of steps taken per day:


```r
dayTotal = aggregate(df$steps, list(df$date), sum, na.rm=TRUE)
head(dayTotal)
```

```
##      Group.1     x
## 1 2012-10-01     0
## 2 2012-10-02   126
## 3 2012-10-03 11352
## 4 2012-10-04 12116
## 5 2012-10-05 13294
## 6 2012-10-06 15420
```

Make a histogram of the total number of steps taken each day.
Here, I first calculate the number of bars needed to get a good representation of the data:

```r
width = round(sqrt(length(dayTotal$x)))
bars = seq(min(dayTotal$x), max(dayTotal$x), by=( (max(dayTotal$x) - min(dayTotal$x)) / width ))
hist(dayTotal$x, breaks = bars, main = "Histogram of Total Number of Steps Taken per Day",
     xlab = "Total number of steps per day", col = "lightblue")
```

![](PA1_template_files/figure-html/unnamed-chunk-3-1.png) 

Calculate and report the mean and median of the total number of steps taken per day
(missing values are ignored):


```r
dayMean = aggregate(df$steps, list(df$date), mean, na.rm=TRUE)
dayMedian = aggregate(df$steps, list(df$date), median, na.rm=TRUE)
```

Below is the output for the mean number of steps taken per day.


```r
data.frame(Date = dayMean$Group.1, Mean = dayMean$x)
```

```
##          Date       Mean
## 1  2012-10-01        NaN
## 2  2012-10-02  0.4375000
## 3  2012-10-03 39.4166667
## 4  2012-10-04 42.0694444
## 5  2012-10-05 46.1597222
## 6  2012-10-06 53.5416667
## 7  2012-10-07 38.2465278
## 8  2012-10-08        NaN
## 9  2012-10-09 44.4826389
## 10 2012-10-10 34.3750000
## 11 2012-10-11 35.7777778
## 12 2012-10-12 60.3541667
## 13 2012-10-13 43.1458333
## 14 2012-10-14 52.4236111
## 15 2012-10-15 35.2048611
## 16 2012-10-16 52.3750000
## 17 2012-10-17 46.7083333
## 18 2012-10-18 34.9166667
## 19 2012-10-19 41.0729167
## 20 2012-10-20 36.0937500
## 21 2012-10-21 30.6284722
## 22 2012-10-22 46.7361111
## 23 2012-10-23 30.9652778
## 24 2012-10-24 29.0104167
## 25 2012-10-25  8.6527778
## 26 2012-10-26 23.5347222
## 27 2012-10-27 35.1354167
## 28 2012-10-28 39.7847222
## 29 2012-10-29 17.4236111
## 30 2012-10-30 34.0937500
## 31 2012-10-31 53.5208333
## 32 2012-11-01        NaN
## 33 2012-11-02 36.8055556
## 34 2012-11-03 36.7048611
## 35 2012-11-04        NaN
## 36 2012-11-05 36.2465278
## 37 2012-11-06 28.9375000
## 38 2012-11-07 44.7326389
## 39 2012-11-08 11.1770833
## 40 2012-11-09        NaN
## 41 2012-11-10        NaN
## 42 2012-11-11 43.7777778
## 43 2012-11-12 37.3784722
## 44 2012-11-13 25.4722222
## 45 2012-11-14        NaN
## 46 2012-11-15  0.1423611
## 47 2012-11-16 18.8923611
## 48 2012-11-17 49.7881944
## 49 2012-11-18 52.4652778
## 50 2012-11-19 30.6979167
## 51 2012-11-20 15.5277778
## 52 2012-11-21 44.3993056
## 53 2012-11-22 70.9270833
## 54 2012-11-23 73.5902778
## 55 2012-11-24 50.2708333
## 56 2012-11-25 41.0902778
## 57 2012-11-26 38.7569444
## 58 2012-11-27 47.3819444
## 59 2012-11-28 35.3576389
## 60 2012-11-29 24.4687500
## 61 2012-11-30        NaN
```

And here is the output for the median number of steps:

```r
data.frame(Date = dayMedian$Group.1, Median = dayMedian$x)
```

```
##          Date Median
## 1  2012-10-01     NA
## 2  2012-10-02      0
## 3  2012-10-03      0
## 4  2012-10-04      0
## 5  2012-10-05      0
## 6  2012-10-06      0
## 7  2012-10-07      0
## 8  2012-10-08     NA
## 9  2012-10-09      0
## 10 2012-10-10      0
## 11 2012-10-11      0
## 12 2012-10-12      0
## 13 2012-10-13      0
## 14 2012-10-14      0
## 15 2012-10-15      0
## 16 2012-10-16      0
## 17 2012-10-17      0
## 18 2012-10-18      0
## 19 2012-10-19      0
## 20 2012-10-20      0
## 21 2012-10-21      0
## 22 2012-10-22      0
## 23 2012-10-23      0
## 24 2012-10-24      0
## 25 2012-10-25      0
## 26 2012-10-26      0
## 27 2012-10-27      0
## 28 2012-10-28      0
## 29 2012-10-29      0
## 30 2012-10-30      0
## 31 2012-10-31      0
## 32 2012-11-01     NA
## 33 2012-11-02      0
## 34 2012-11-03      0
## 35 2012-11-04     NA
## 36 2012-11-05      0
## 37 2012-11-06      0
## 38 2012-11-07      0
## 39 2012-11-08      0
## 40 2012-11-09     NA
## 41 2012-11-10     NA
## 42 2012-11-11      0
## 43 2012-11-12      0
## 44 2012-11-13      0
## 45 2012-11-14     NA
## 46 2012-11-15      0
## 47 2012-11-16      0
## 48 2012-11-17      0
## 49 2012-11-18      0
## 50 2012-11-19      0
## 51 2012-11-20      0
## 52 2012-11-21      0
## 53 2012-11-22      0
## 54 2012-11-23      0
## 55 2012-11-24      0
## 56 2012-11-25      0
## 57 2012-11-26      0
## 58 2012-11-27      0
## 59 2012-11-28      0
## 60 2012-11-29      0
## 61 2012-11-30     NA
```


## What is the average daily activity pattern?

First, I calculate the mean number of steps for each day interval:

```r
intervals = as.factor(df$interval)
intervalMean = aggregate(df$steps, list(intervals), mean, na.rm=TRUE)
colnames(intervalMean) = c("Interval", "Mean")
```

Then, I create the time series plot of the 5-minute interval (x-axis) and 
the average number of steps taken, averaged across all days (y-axis):

```r
plot(intervalMean$Mean ~ intervalMean$Interval,
     main = paste("Time Series Plot of Average Number of Steps Taken\n",
                  "At Each 5-Minute Daily Interval"),
     xlab = "Daily Interval (in 5-minute increments)",
     ylab = "Mean Number of Steps Taken")
lines(intervalMean$Mean)
```

![](PA1_template_files/figure-html/unnamed-chunk-8-1.png) 

#### Which 5-minute interval, on average across all the days in the dataset, contains the maximum number of steps?

```r
intervalMean[which(intervalMean$Mean == max(intervalMean$Mean)),]
```

```
##     Interval     Mean
## 104      835 206.1698
```
In other words, interval 835 with mean 206.1698 steps.

## Inputing missing values
Calculate and report the total number of missing values in the dataset:

```r
length(which(is.na(df$steps) == TRUE))
```

```
## [1] 2304
```

Devise a strategy for filling in all of the missing values in the dataset.
Here, I replace NAs with the mean value for the specific time interval:

```r
newSteps = df$steps
for (i in which(is.na(newSteps) == TRUE)) {
  newSteps[i] = intervalMean[which(intervalMean$Interval == df$interval[i]),2]
}
```

Create a new dataset that is equal to the original dataset but with the missing data filled in:

```r
newDf = data.frame(newSteps, df$date, df$interval)
colnames(newDf) = c("steps", "date", "interval")
```

Make a histogram of the total number of steps taken each day:

```r
newDayTotal = aggregate(newDf$steps, list(newDf$date), sum, na.rm=TRUE)
hist(newDayTotal$x, breaks = bars, main = "Histogram of Total Number of Steps Taken per Day",
     xlab = "Total number of steps per day", col = "lightpink")
```

![](PA1_template_files/figure-html/unnamed-chunk-13-1.png) 

Calculate and report the mean and median total number of steps taken per day:

```r
newDayMean = aggregate(newDf$steps, list(newDf$date), mean, na.rm=TRUE)
newDayMedian = aggregate(newDf$steps, list(newDf$date), median, na.rm=TRUE)
```
Below is the output for the means:

```r
data.frame(Date = newDayMean$Group.1, Mean = newDayMean$x)
```

```
##          Date       Mean
## 1  2012-10-01 37.3825996
## 2  2012-10-02  0.4375000
## 3  2012-10-03 39.4166667
## 4  2012-10-04 42.0694444
## 5  2012-10-05 46.1597222
## 6  2012-10-06 53.5416667
## 7  2012-10-07 38.2465278
## 8  2012-10-08 37.3825996
## 9  2012-10-09 44.4826389
## 10 2012-10-10 34.3750000
## 11 2012-10-11 35.7777778
## 12 2012-10-12 60.3541667
## 13 2012-10-13 43.1458333
## 14 2012-10-14 52.4236111
## 15 2012-10-15 35.2048611
## 16 2012-10-16 52.3750000
## 17 2012-10-17 46.7083333
## 18 2012-10-18 34.9166667
## 19 2012-10-19 41.0729167
## 20 2012-10-20 36.0937500
## 21 2012-10-21 30.6284722
## 22 2012-10-22 46.7361111
## 23 2012-10-23 30.9652778
## 24 2012-10-24 29.0104167
## 25 2012-10-25  8.6527778
## 26 2012-10-26 23.5347222
## 27 2012-10-27 35.1354167
## 28 2012-10-28 39.7847222
## 29 2012-10-29 17.4236111
## 30 2012-10-30 34.0937500
## 31 2012-10-31 53.5208333
## 32 2012-11-01 37.3825996
## 33 2012-11-02 36.8055556
## 34 2012-11-03 36.7048611
## 35 2012-11-04 37.3825996
## 36 2012-11-05 36.2465278
## 37 2012-11-06 28.9375000
## 38 2012-11-07 44.7326389
## 39 2012-11-08 11.1770833
## 40 2012-11-09 37.3825996
## 41 2012-11-10 37.3825996
## 42 2012-11-11 43.7777778
## 43 2012-11-12 37.3784722
## 44 2012-11-13 25.4722222
## 45 2012-11-14 37.3825996
## 46 2012-11-15  0.1423611
## 47 2012-11-16 18.8923611
## 48 2012-11-17 49.7881944
## 49 2012-11-18 52.4652778
## 50 2012-11-19 30.6979167
## 51 2012-11-20 15.5277778
## 52 2012-11-21 44.3993056
## 53 2012-11-22 70.9270833
## 54 2012-11-23 73.5902778
## 55 2012-11-24 50.2708333
## 56 2012-11-25 41.0902778
## 57 2012-11-26 38.7569444
## 58 2012-11-27 47.3819444
## 59 2012-11-28 35.3576389
## 60 2012-11-29 24.4687500
## 61 2012-11-30 37.3825996
```
And this is the output for the medians: 

```r
data.frame(Date = newDayMedian$Group.1, Median = newDayMedian$x)
```

```
##          Date   Median
## 1  2012-10-01 34.11321
## 2  2012-10-02  0.00000
## 3  2012-10-03  0.00000
## 4  2012-10-04  0.00000
## 5  2012-10-05  0.00000
## 6  2012-10-06  0.00000
## 7  2012-10-07  0.00000
## 8  2012-10-08 34.11321
## 9  2012-10-09  0.00000
## 10 2012-10-10  0.00000
## 11 2012-10-11  0.00000
## 12 2012-10-12  0.00000
## 13 2012-10-13  0.00000
## 14 2012-10-14  0.00000
## 15 2012-10-15  0.00000
## 16 2012-10-16  0.00000
## 17 2012-10-17  0.00000
## 18 2012-10-18  0.00000
## 19 2012-10-19  0.00000
## 20 2012-10-20  0.00000
## 21 2012-10-21  0.00000
## 22 2012-10-22  0.00000
## 23 2012-10-23  0.00000
## 24 2012-10-24  0.00000
## 25 2012-10-25  0.00000
## 26 2012-10-26  0.00000
## 27 2012-10-27  0.00000
## 28 2012-10-28  0.00000
## 29 2012-10-29  0.00000
## 30 2012-10-30  0.00000
## 31 2012-10-31  0.00000
## 32 2012-11-01 34.11321
## 33 2012-11-02  0.00000
## 34 2012-11-03  0.00000
## 35 2012-11-04 34.11321
## 36 2012-11-05  0.00000
## 37 2012-11-06  0.00000
## 38 2012-11-07  0.00000
## 39 2012-11-08  0.00000
## 40 2012-11-09 34.11321
## 41 2012-11-10 34.11321
## 42 2012-11-11  0.00000
## 43 2012-11-12  0.00000
## 44 2012-11-13  0.00000
## 45 2012-11-14 34.11321
## 46 2012-11-15  0.00000
## 47 2012-11-16  0.00000
## 48 2012-11-17  0.00000
## 49 2012-11-18  0.00000
## 50 2012-11-19  0.00000
## 51 2012-11-20  0.00000
## 52 2012-11-21  0.00000
## 53 2012-11-22  0.00000
## 54 2012-11-23  0.00000
## 55 2012-11-24  0.00000
## 56 2012-11-25  0.00000
## 57 2012-11-26  0.00000
## 58 2012-11-27  0.00000
## 59 2012-11-28  0.00000
## 60 2012-11-29  0.00000
## 61 2012-11-30 34.11321
```

#### Do these values differ from the estimates from the first part of the assignment? 
Both the mean and the median differ from the estimates where there were previously NA values. 

#### What is the impact of imputing missing data on the estimates of the total daily number of steps?
Since the NAs have been filled with the mean values, there is a greater frequency of totals at
the center, resulting in a more bell-shaped distribution for the total step count. 

## Are there differences in activity patterns between weekdays and weekends?
Create a new factor variable in the dataset with two levels - "weekday" and "weekend":

```r
weekDay = weekdays(as.POSIXct(df$date))
newDf$dayType = as.factor(ifelse( (weekDay == "Saturday" | weekDay == "Sunday"),
                                 "weekend", "weekday"))
```

Calculating the interval means for weekdays and weekends:

```r
newIntervalMean = aggregate(newDf$steps, list(intervals,
                                              newDf$dayType == "weekend"), mean, na.rm=TRUE)
colnames(newIntervalMean) = c("Interval", "isWeekend", "Mean")
intMeanDay = newIntervalMean[newIntervalMean$isWeekend == FALSE, c(1,3)]
intMeanWeek = newIntervalMean[newIntervalMean$isWeekend == TRUE, c(1,3)]
```

Finally, here is the panel plot containing a time series plot of the 5-minute interval (x-axis) 
and the average number of steps taken, averaged across all weekday days or weekend days (y-axis):

```r
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
```

![](PA1_template_files/figure-html/unnamed-chunk-19-1.png) 


