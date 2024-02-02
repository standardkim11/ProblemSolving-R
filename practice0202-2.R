data <- read.csv("M1-4-2.csv",header=T)

library(caret)
library(party)
library(randomForest)
str(data)
data$Churn <- as.factor(data$Churn)

idx <- sample(1:nrow(data),nrow(data)*0.75)
train <- data[idx,]
valid <- data[-idx,]

md <- randomForest(Churn~.,data = train,ntree=300)
pred <- predict(md,newdata = valid,type="response")
confusionMatrix(data=pred,reference = valid$Churn)

data2 <- read.csv("M1-4-2.csv")
data2$Churn <- as.factor(data2$Churn)

md2 <- randomForest(Churn~.,data=data, ntree=300) 
pred2 <- predict(md,newdata = data2 )
confusionMatrix(data =pred2,reference = data2$Churn)

result <- data.frame(pred2)
colnames(result) <- c("pred")
print(head(result))
