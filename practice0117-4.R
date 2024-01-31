data <- read.csv("P210301.csv",header=T,fileEncoding = "EUC-KR")

data_omit <- na.omit(data)
data_omit <- data_omit[1:(nrow(data_omit)*0.7),]

q1 <- quantile(data_omit$housing_median_age)
print(as.integer(q1[2]))
