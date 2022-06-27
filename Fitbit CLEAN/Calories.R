#Developed by Maira Lemos Emerenciano
#Last modified 06/21/22

install.packages("tidyverse")
install.packages("hrbrthemes")
library(dplyr)
library(ggplot2)
library(hrbrthemes)

calories_data = read.csv('dailyCalories_clean.csv',header = TRUE, sep=",")
calories_data$ActivityDay <- as.Date(paste("2016", calories_data$ActivityDay, sep = "/"), format = "%Y/%m/%d")

ggplot(calories_data)+
  geom_line(aes(x= ActivityDay, y=Calories, group=Id), colour='grey74')+
  scale_x_date(date_breaks = "1 day", date_labels = "%m/%d", expand = c(0,0))+
  annotate("rect", xmin = as.Date("2016-04-12"), xmax = as.Date("2016-05-12") , ymin= 1600, ymax=2400, fill='#FF9966', alpha=0.5)+
  annotate("text", x=as.Date("2016-04-13"), y=1680,label="1600 cals",size=3.5)+
  annotate("text", x=as.Date("2016-04-13"), y=2300,label="2400 cals",size=3.5)+
  theme_classic()+
  labs(title = 'Calories spent per day', x='Day')

