data <- read.csv("P210302.csv",header = T,fileEncoding = "EUC-KR")
data
str(data)

na <- colSums(is.na(data))
na <- data.frame(na)
na

which(na$na>0)
rownames(na)[6]

#############################
library(dplyr)

ds <- na %>% arrange(desc(na))
print(rownames(ds)[1])

