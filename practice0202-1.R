#1-1 
data <- read.csv("M1-1.csv",header=T)

train <- data[c(1:as.integer(nrow(data)*0.7)),]

train <- train[order(-train$price),]

train5 <- train[c(1:5),]

train5_median <- median(train5$depth)

print(as.integer(train5_median))

# 1-2
data <- read.csv("M1-2.csv",header = T)

mean <- mean(data$TotalCharges,na.rm=T)
sd <- sd(data$TotalCharges,na.rm = T)

upper <- mean + 1.5*sd
lower <- mean - 1.5*sd

result <- subset(data,data$TotalCharges >= lower & data$TotalCharges <= upper )
print(as.integer(mean(result$TotalCharges)))

# 1-3

data <- read.csv("M1-3.csv",header = T)
data_am1 <- subset(data,am == 1)
data_am0 <- subset(data,am == 0)

data_am1 <- data_am1[order(data_am1$hp),]
data_am1_hp <- data_am1[c(1:5),]

result1 <- mean(data_am1_hp$mpg,na.rm = T)

data_am0 <- data_am0[order(data_am0$hp),]
data_am0_hp <- data_am0[c(1:5),]

result2 <- mean(data_am0_hp$mpg,na.rm = T)
result <- result1 - result2

print(round(result,1))
