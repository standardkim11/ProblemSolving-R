data <- read.csv("P210204-01.csv",header = T)

library(caret)
library(randomForest)

str(data)
data$Reached.on.Time_Y.N <- as.factor(data$Reached.on.Time_Y.N)

data2 <- read.csv("P210204-02.csv",header=T)

summary(data)
summary(data2)

idx <- sample(1:nrow(data), nrow(data)*0.75)
train <- data[idx,]
test <- data[-idx,]

md <- randomForest(Reached.on.Time_Y.N~., data=train[,-1],probability=T)
pred <- predict(md, newdata = test[,-1],type="response")
confusionMatrix(pred,test[,-1]$Reached.on.Time_Y.N)

library(pROC)


md2 <- randomForest(Reached.on.Time_Y.N~.,data=train[,-1],probability=T,ntree=300)
pred2 <- predict(md2,newdata = data2[,-1],type = "prob")
print(pred2)

result <- data.frame(data2$ID,pred2[,2])
colnames(result) <- c("ID","Pred")
print(result)
