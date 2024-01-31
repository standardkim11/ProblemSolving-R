data <- read.csv("housing.csv",header = T,fileEncoding = "EUC-KR")
train <- data[c(1:(nrow(data)*0.8)),]
before <- sd(train$total_bedrooms,na.rm=T)
train$total_bedrooms <- ifelse(is.na(train$total_bedrooms),median(train$total_bedrooms,na.rm=T),train$total_bedrooms)
after <- sd(train$total_bedrooms,na.rm=T)

abs(before-after)
print(round(abs(before-after),2))
