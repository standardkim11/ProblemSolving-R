data <- read.csv("P230602.csv",header = T)
str(data)
head(data)
summary(data)
library(psych)
describe(data)

data$teacher_std <- (data$student_1 + data$student_2 + data$student_3 + data$student_4 + data$student_5 + data$student_6 ) / 6
data <- data[order(-data$teacher_std),]
result <- head(data$teacher,1)
print(result)
