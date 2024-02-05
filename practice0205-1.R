#1

data <- read.csv("M2-1.csv",header=T)

str(data)
data70 <- data[c(1:(nrow(data)*0.7)),]
median_before <- median(data70$Ozone,na.rm=T)


data70[is.na(data70$Ozone),]<- mean(data70$Ozone,na.rm = T)
median_after <- mean(data70$Ozone,na.rm = T)
median_after <- round(median_after,1)

print(median_after - median_before)

#2
data <- read.csv("M2-2.csv",header = T)
str(data)
summary(data)

train <- subset(data,HAIR == "White Hair" & EYE == "Blue Eyes")
summary(train)
mean <- mean(train$APPEARANCES,na.rm = T)
sd <- sd(train$APPEARANCES, na.rm = T)

upper <- mean + 1.5*sd
lower <- mean - 1.5*sd

result <- train[train$APPEARANCES >= lower & train$APPEARANCES <= upper,]
print(round(mean(result$APPEARANCES,na.rm=T),2))

#3
data <- read.csv("M2-3.csv",header = T)
mean <- mean(data$Sales,na.rm=T)
sd <- sd(data$Sales,na.rm = T)

upper <- mean + 1.5*sd
lower <- mean - 1.5*sd

train <- data[data$Sales <= upper & data$Sales >= lower,]
print(round(sd(train$Age),2))
