data <- read.csv("P220504-01.csv",header = T)
library(caret)
library(randomForest)
library(ModelMetrics)

data2 <- read.csv("P220504-02.csv",header = T)

idx <- sample(1:nrow(data),nrow(data)*0.75)
train <- data[idx,]
valid <- data[-idx,]

md <-  randomForest(price~.,data = train, ntree = 300)
pred <- predict(md,newdata = valid)
print(rmse(actual= valid$price,predict= pred))

md2 <- randomForest(price~.,data = data,ntree=300)
pred2 <- predict(md,newdata = data2)
result <- data.frame(pred2)

colnames(result) <- c("pred")
print(result)
