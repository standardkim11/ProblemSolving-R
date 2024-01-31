library(lubridate)
data <- read.csv("P230601.csv",header = T)
str(data)
head(data)
colnames(data) <- c("call_time","arrive_time","fire_station")
data$call_time <- ymd_hm(data$call_time)
data$arrive_time <- ymd_hm(data$arrive_time)
data$diff_time <- difftime(data$arrive_time,data$call_time,units="secs")
head(data)

library(dplyr)
data <- data %>% group_by(fire_station,year(call_time), 
                      month(call_time)) %>% 
            summarise(mean_time = mean(diff_time)) %>% 
            arrange(-mean_time)
head(data$mean_time)
result1 <- head(data$mean_time,1)
result2 <- as.numeric(result1)/60
print(round(result2))
