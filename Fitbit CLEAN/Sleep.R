install.packages("tidyverse")
library(dplyr)
library(ggplot2)

sleep_data= read.csv("SLEEP.csv",header = TRUE, sep=",")
datanew = sleep_data
datanew$SleepDay <- as.Date(sleep_data$SleepDay, sep = "/", format = "%m/%d/%y")
datanew$Id <-factor(datanew$Id,
                    levels=c("Participant 1", "Participant 2","Participant 3","Participant 4","Participant 5",
                             "Participant 6","Participant 7","Participant 8","Participant 9","Participant 10","Participant 11",
                             "Participant 12"))

ggplot(datanew, aes(x=SleepDay,y=TotalMinutesAsleep))+
  geom_line()+
  geom_line(aes(x=SleepDay, y=420, colour='#FF6633'))+
  facet_wrap(~Id)+
  scale_color_manual(values=c('#FF6633'),name='Values', labels=c('420 mins / 7 hrs'))+
  theme_classic()+
  labs(title='Minutes of sleep per day', x='Day', y='Total Minutes of Sleep')
