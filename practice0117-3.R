data <- read.csv("P210203.csv",header=T,fileEncoding = "EUC-KR")
str(data)

mean <- mean(data$charges,na.rm = T)
sd <- sd(data$charges,na.rm = T)

upper <- mean + 1.5*sd
lower <- mean - 1.5*sd

result <- which(data$charges >= upper | data$charges <= lower)
print(sum(data$charges[result]))
