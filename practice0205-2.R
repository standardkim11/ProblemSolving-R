data <- mtcars

str(data)
summary(data)

idx <- sample(1:nrow(data),nrow(data)*0.75)
train <- data[idx,]
test <- data[-idx,]

md <- lm(mpg~drat+wt+gear+carb,data = data)
md
summary(md)

library(caret)
library(MatrixModels)
pred <- predict(md,newdata = test)

result <- data.frame(pred)
print(RMSE(test$mpg,pred))
