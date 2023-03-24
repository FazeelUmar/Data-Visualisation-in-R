library(tidyverse)
data(mpg)
# Store in Excel -----
install.packages("writexl", dependencies = TRUE)
library(ggplot2)
library(writexl)
df <- data("mpg")
write_xlsx(df,"mpg.xlsx")

#import excel file ----
library(readxl)
mpg <- read_excel("mpg.xlsx")



#plotting ggplot ----
df<-mpg
ggplot(data = df, mapping = aes(x=df$cty, y=df$hwy, col = df$manufacturer))+
  geom_point()+
  facet_wrap(~class,nrow = 2,labeller = labeller(class = c("2seater"="TwoSeater",
                                                           "compact"="Compact")))+
  #labeller changes the strip labels in facet wrap
  theme_bw()+
  labs(title = "Wow",
       x="City")+
  theme(strip.background = element_rect(fill = "blue")) +# to change strip col
   theme(strip.text = element_text(colour = "white")) # text col
# to change compact strip to Compact we can use labeller in facet wrap


  

#data transformation ----
install.packages("nycflights13", dependencies = TRUE)
library(nycflights13)
library(tidyverse)
df2<- nycflights13::flights
summary(df2)
feb <- filter(df2, df2$month == 2, df2$carrier == "UA")
Mar_apr <- filter(df2, df2$month == c(2,3)) #does not work
Mar_apr <- filter(df2, df2$month %in% c(2,3)) 
