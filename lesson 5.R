# Data manipulation in R

#the dplyr package is used to transform and summarize tabular data 
# wih rows and columns 

#you can perform the select(), filter(), arrange(), summary(), mutate()

install.packages("dplyr")
library(dplyr)

install.packages("nycflights13")
library('nycflights13')

View(flights)
head(flights)

#subset using filter()

f1<- filter(flights, month==07)
View(f1)

f2<- filter(flights, month==07, day==3)
View(f2)

View(filter(flights, day==2, month==07, origin=="JFK"))


#using OR

View(flights[flights$month==09 & flights$day==2 & flights$origin=="JFK",])

#slicing to select rows by specific position

slice(flights, 1:5)
sl <- slice(flights, 5:50)
View(sl)

#mutate () is used to ad new column 
over_delay <- mutate(flights, overall_delay=arr_delay-dep_delay)
View(over_delay)

#transmute() whih is used to show only new column
over_delay <- transmute(flights, overall_delay=arr_delay-dep_delay)
View(over_delay)

#summarise() is used to find descriptive statistics 
summarise(flights, average_air_time=mean(air_time, na.rm=T))
summarise(flights, average_air_time=sum(air_time, na.rm=T))
summarise(flights, average_air_time=sd(air_time, na.rm=T))
summarise(flights, average_air_time=mean(air_time, na.rm=T), tot_air_time=sum(air_time, na.rm = T))

#group by calculation using group_by(
View(mtcars)

by_gear <- mtcars %>% group_by(gear)
View(by_gear)

a<- summarise(by_gear, gear1=sum(gear), gear2=mean(gear))
a

b<- by_gear %>% summarise(gear1=sum(gear), gear2=mean(gear))
b

#group by cylinder

by_cylinder <- mtcars %>% group_by(cyl)
by_cylinder %>% summarise(
  gear = mean(gear),
  hp=mean(hp),
  mpg = mean(mpg)
)


# sample_n() and sample_frac for creating samples

sample_n(flights, 15) #gives you 15 random samples from flights


samp <- sample_frac(flights, 0.4) # this will retur 40% of the data
View(samp)


#arrange() is used to sort dataset

View(arrange(flights, year, dep_time))


#using the pipe operator %>% 

df <- mtcars


#nesting
result <- arrange(sample_n(filter(df, mpg>20), size = 5), desc(mpg))
View(result)

#multiple assigment 

a<- filter(df, mpg>20)
b<- sample_n(a, size = 5)
result<- arrange(b, desc(mpg))
result

#same using the pipe %>% 

result<- df %>% filter(mpg>20) %>% sample_n(size = 10) %>% arrange(desc(mpg))
result

df_seleect = df %>% select(mpg, hp, cyl)
View(df_seleect)


#data manipulation using tidyr
#this package is used t create tidy data. a tidy data is easy to 
#visualise and model

#gather () which makes wide data longer used to stack up multiple columns 
# spread() it make long data wider unstack the data with same attributes to multiple coulumns 
#seperate() it splits a single column into multiple columns
#unit() combines multiple columns to singe columns 


install.packages('tidyr')
library('tidyr')


n=10

wide<- data.frame(
  ID = c(1:n), 
  face.1 = c(411, 723, 325, 456, 579, 612, 709, 513, 527, 379),
  face.2 = c(123, 300, 400, 500, 600, 654, 789, 906, 413, 567),
  face.3 = c(1457, 1000, 569, 896, 956, 2345, 780, 599, 1023, 678)
)

View(wide)

#gather() reshaping the data from wide format to long format
#shortcut to do the pipe is ctrl shift m

long <- wide %>%  gather(Face, ResponseTime, face.1:face.3)
View(long)


#seperate() spliting a single column into multiple coulmns 
long_seperate <- long %>% separate(Face, c('Target', 'Number'))
View(long_seperate)


#unite() combines multiple columns into a single column

long_unite <- long_seperate %>%  unite(Face, Target, Number, sep = "_")
View(long_unite)


#spread takes two columns (key and values) and spreads into multiple columns
#it makes "long" data wider

back_to_wide <- long_unite %>% spread(Face, ResponseTime)
View(back_to_wide)

