data <- read.csv("P210303.csv",header = T,fileEncoding = "EUC-KR")
str(data)

head(data)

cols <- data[,c("year","country","new_sp")]
data_omit <- na.omit(cols)

data_y2000 <- subset(data_omit,year==2000)
mean <- mean(data_y2000$new_sp,na.rm = T)
data_mean <- subset(data_y2000,data_y2000$new_sp > mean)
print(nrow(data_mean))
