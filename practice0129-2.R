data <- read.csv("P230606.csv",header = T,fileEncoding = "EUC-KR")
str(data)

#-----------------------------------------------------------
md <- lm(Temperature~O3+Solar+Wind,data)
summary(md)

md_coef <- summary(md)$coefficients
md_coef

result <- round(md_coef["O3","Estimate"],3)
print(result)
#-------------------------------------------------

result_ttest <- t.test(data["Wind"],data["Temperature"])
print(round(result_ttest$p.value,3))

#--------------------------------------------------
day <- data.frame(10,90,20)
colnames(day) <- c("O3","Solar","Wind")
result <- predict(md,newdata = day)
print(result)
print(round(result,3))
