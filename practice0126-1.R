data <- read.csv("P220404-01.csv",header = T)

library(caret)
library(randomForest)

str(data)
data$Segmentation <-  as.factor(data$Segmentation)

data2 <- read.csv("P220404-02.csv",header = T)

idx <- sample(1:nrow(data), nrow(data)*0.75)
train <- data[idx,]
test <- data[-idx,]

md <- randomForest(Segmentation~.,data = train[,-1],ntree=300)
print(md)

pred <- predict(md,newdata=test[,-1])
print(pred)

confusionMatrix(pred,test[,-1]$Segmentation)

md2 <- randomForest(Segmentation~.,data = data[,-1],ntree=300)
pred2 <- predict(md,newdata = data2[,-1])

print(pred2)

result <- data.frame(data2$ID,pred2)
colnames(result) <- c("ID","Pred")
print(result)
