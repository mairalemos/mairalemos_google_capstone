install.packages("tidyverse")
library(dplyr)
library(ggplot2)

steps_data = read.csv("StepsCLEAN.csv",header = TRUE, sep=",")
steps_data$ActivityDay <- as.Date(steps_data$ActivityDay, sep = "/", format = "%m/%d/%y")
mean(steps_data$StepTotal)

ggplot(steps_data)+
  geom_line(aes(x= ActivityDay, y=StepTotal, group=Id), colour='grey74')+
  scale_x_date(date_breaks = "5 days", date_labels = "%m/%d", expand = c(0,0))+
  geom_line(aes(x=ActivityDay, y=mean(StepTotal),colour='#FF6633'))+
  geom_line(aes(x=ActivityDay, y=10000, colour='black'))+
  scale_color_manual(values=c('#FF6633','black'),name='Values', labels=c('Mean (7,927 steps)','Target (10,000 steps)'))+
  theme_classic()+
  labs(title = 'Steps per day', x='Day',y='Steps')
