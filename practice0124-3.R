data <- read.csv("P210304-01.csv",header = T)
data2 <- read.csv("P210304-02.csv",header = T)


library(caret)
library(randomForest)
library(psych)

str(data)
describe(data)
summary(data)
data$TravelInsurance <- as.factor(data$TravelInsurance)

str(data2)
describe(data2)
summary(data2)

idx <- sample(1:nrow(data),nrow(data)*0.75)
train <- data[idx,]
test <- data[-idx,]

md <- randomForest(TravelInsurance~., data= train[,-1],ntree=300,probability=T)
pred <- predict(md,newdata=test[,-1],probability=T,type = "response")
confusionMatrix(data = pred, reference = test[,-1]$TravelInsurance)

md2 <- randomForest(TravelInsurance~.,data=data[,-1],probability=T,type="prob")
pred2 <- predict(md2,newdata=data2[,-1],probability=T,type="prob")
print(pred2)
result <- data.frame(data2$X,pred2[,2])
colnames(result) <- c("index","y_pred")
print(result)
write.csv()