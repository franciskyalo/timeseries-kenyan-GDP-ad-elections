
# ---------about project--------------

# using the powerful ggplot2, i will use data on gdp growth
# to show how elections affect gdp growth in Kenya

head(data)

library(tidyverse)


head(data)

data <- select(data, Year, growth)

data <- transmute(data, year=make_date(Year), growth=as.numeric(growth))

head(data)

data

plot <- ggplot(data, aes(year,growth))+
  geom_area(fill="red", alpha= 0.05)+
  geom_line(lwd=1)
plot

plot + annotate("rect", xmin=make_date(2001), xmax=make_date(2002), ymin=0, ymax=8, alpha=.1,
                fill="blue") +
  annotate("rect", xmin=make_date(2007), xmax=make_date(2008), ymin=0, ymax=8, alpha=.1,
           fill="blue") +
  annotate("rect", xmin=make_date(2012), xmax=make_date(2013), ymin=0, ymax=8, alpha=.1,
           fill="blue") +
  annotate("rect", xmin=make_date(2016), xmax=make_date(2017), ymin=0, ymax=8, alpha=.1,
           fill="blue") +
  annotate("text", x = make_date(2015), y = 7, label = " political temperatures
           adversely affect economic growth in Kenya")+
  ggtitle(" Effect of elections on GDP growth in Kenya") 

