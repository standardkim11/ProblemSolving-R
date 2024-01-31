data <- read.csv("P220401.csv",header = T,fileEncoding = "EUC-KR")
head(data)
q1 <- quantile(data$y,0.25)
q3 <- quantile(data$y,0.75)
d1 <- q3-q1
print(d1)
print(as.integer(d1))
