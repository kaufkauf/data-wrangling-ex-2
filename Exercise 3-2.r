install.packages("data.table")
install.packages("dplyr")
install.packages("tidyr")
library(data.table)
library(dplyr)
library(tidyr)

df1 <- fread("C:/Users/Kim/Dropbox/Data science/titanic_original.csv")
meanage <- mean(df1$age, na.rm = TRUE)

##missing values of NA can be replaced with replace_na, 
##missing values of "" are using an ifelse

df1 %>%
  mutate(embarked = ifelse(embarked == "","S",embarked)) %>%
  replace_na(list(age = meanage)) %>%
  mutate(boat = ifelse(boat == "","None",boat)) %>%
  mutate(has_cabin_number = ifelse(cabin == "",0,1)) %>%
  glimpse() %>%
  fwrite("C:/Users/Kim/Dropbox/Data science/titanic_clean.csv")
