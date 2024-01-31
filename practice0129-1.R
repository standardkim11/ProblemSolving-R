data <- read.csv("P230605.csv",header = T,fileEncoding = "EUC-KR")
str(data)
#Not dplyr ---------------------------------------------
data$코드 <- as.factor(data$코드)
data0 <- subset(data, 코드 ==  '4')

print(round(nrow(data0)/ nrow(data),3))

#dplyr---------------------------------------------

library(dplyr)
dt <-  data %>% group_by(코드) %>% summarise(건수=n(),비율 = n() / nrow(data))
print(round(dt$비율[4],3))

#------------------------------------------------------------------------------
rate <- data.frame(코드 = c(1,2,3,4), 비율 = c(0.05,0.1,0.05,0.8))

result <- chisq.test(dt$건수,p=rate$비율)
print(result)

print(round(result$p.value,3))
