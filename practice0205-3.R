#1

a <- c(1,2,3,4,6)
b <- c(4,5,6,7,8)

print(var(a))

print(var(b))

result <- var.test(a,b)
print(result)

n1 <- round(result$statistic,2)
names(n1) <- NULL
print(n1)

n2 <- round(result$p.value,4)
names(n2) <- NULL
print(n2)

n3 <- ifelse(result$p.value < 0.05 , "reject","accept")
print(n3)

#2

data <- c(340,540)
result <- chisq.test(data,p = c(0.35,0.65))
print(result)

n <- round(result$statistic,5)
names(n) <- NULL
print(n)

n2 <- round(result$p.value,5)
names(n2) <- NULL
print(n2)

n3 <- ifelse(n2 <0.05,"reject","accept")
print(n3)
