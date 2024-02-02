data <- data.frame(before=c(200,210,190,180,175), after= c(180,175,160,150,160))

#1
result <- t.test(data$after,data$before,paired = T,alternative = "less")
str(result)

n <- round(result$statistic,4)

print(as.double(n))

#2
n2 <- round(result$p.value,5)
print(as.double(n2))      

#3
n3 <- ifelse(n2 <0.05,"reject","accept")
print(n3)
