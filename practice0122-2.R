data <- read.csv("P220502.csv",header = T,fileEncoding = "EUC-KR")
str(data)
summary(data)
head(data)

data$bmi <- data$Weight / ((data$Height/100)**2)

result1 <- subset(data, bmi >= 18.5 & bmi < 23)
result2 <- subset(data, bmi >= 23 & bmi <25)

nrow(result1) - nrow(result2) 
print(nrow(result1) - nrow(result2))
