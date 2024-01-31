data <- read.csv("P210201.csv",header=T)

data <- data[order(-data$crim),]
data$crim[1:10]
data$crim[1:10] <- data$crim[10]


data_age80 <- data[data$age >=80,]
result <- mean(data_age80$crim)
print(round(result,2))
