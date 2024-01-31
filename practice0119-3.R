data <- read.csv("P220402.csv",header = T,fileEncoding = "EUC-KR")
str(data)

data$pos <- (data$num_loves + data$num_wows) / data$num_reactions
result <- subset(data,pos > 0.4 & pos < 0.5)
print(nrow(result))
