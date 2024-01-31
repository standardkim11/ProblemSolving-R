data <- read.csv("P220403.csv",header = T)

head(data)
str(data)
summary(data)

library(lubridate)

data$date_added <- mdy(data$date_added)
data1 <- subset(data,(year(date_added) == 2018 & month(date_added) == 01) & country == "United Kingdom")


