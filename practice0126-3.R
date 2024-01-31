data <- read.csv("P230604-01.csv",header = T)
str(data)

library(caret)
library(randomForest)

data$price_range <-  as.factor(data$price_range)
data$blue <- as.factor(data$blue)
data$dual_sim <-  as.factor(data$dual_sim)
data$four_g <-  as.factor(data$four_g)
data$n_cores <-  as.factor(data$n_cores)
data$three_g <-  as.factor(data$three_g)
data$touch_screen <-  as.factor(data$touch_screen)
data$wifi <-  as.factor(data$wifi)
 
summary(data)

data2 <- read.csv("P230604-02.csv",header = T)

data2$blue <- as.factor(data2$blue)
data2$dual_sim <-  as.factor(data2$dual_sim)
data2$four_g <-  as.factor(data2$four_g)
data2$n_cores <-  as.factor(data2$n_cores)
data2$three_g <-  as.factor(data2$three_g)
data2$touch_screen <-  as.factor(data2$touch_screen)
data2$wifi <-  as.factor(data2$wifi)

idx <- sample(1:nrow(data),nrow(data)*0.75)
train <- data[idx,]
valid <- data[-idx,]

md <- randomForest(price_range~.,data = train, ntree=300)
pred <- predict(md,newdata = valid)
confusionMatrix(data = pred, valid$price_range)

md2 <- randomForest(price_range~.,data = data, ntree=300)
pred <- predict(md,newdata = data2)
result <- data.frame(pred)
colnames(result) <- "pred"
