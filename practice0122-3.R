data <- read.csv("P220503.csv",header = T,fileEncoding = "EUC-KR")
head(data)
str(data)

data$순전입학생수 <- data$전입학생수.계. - data$전출학생수.계.

data <- data[order(-data$순전입학생수),]
print(data$전체학생수.계.[1])
