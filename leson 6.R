#data visualization 
# R supports a variety of function and data 
#visualization packages to build interactive 
#visuals for exploratory data analysis


#there are two type of data visualization
#exploratory which helps you understand the data 
#explanatory visualization which helps us share our understanding with others 

#the key o exploratory data visualization is to keep all the potential relevant details together

#the objective of exploratory data analysis is to help u see what is in your data
#the main question is how much detail can we interpret

#functions available to it are 
#plot() it is more of a generic function for plotting R objects
#bar plot () it is use to plot data using rectangular bars
#hist() it is used to create histograms..lok at the frquency
#boxplots() it is used to represent data in the form of quartiles
#ggplot this package enabes the user to create sophisticated visualization with little coding using the grammar of graphics
#plotly it creates interactive web ased graphs via the open source javascript graphing library plotly.js

plot(ChickWeight)

#types of graphics in visualization
#base graphics
library(MASS)
plot(UScereal$sugars, UScereal$calories)
title("plot(UScereal$sugars, UScereal$calories)
")

x<- UScereal$sugars
y<- UScereal$calories
library(grid)


#grid graphics 
pushViewport(plotViewport())
pushViewport(dataViewport(x,y))
grid.rect()
grid.xaxis()
grid.yaxis()
grid.points()
grid.text("UScereal$calories", x=unit(-3, 'lines'), rot = 90)


#before we move to plotting 

#lets talk about charts

#Bar charts is  graph that is used to show comparisons across
#discrete categories. the x-axis represent the catgories to compare,
# and the y-axis represents a measured value. the heights of the bars aree proportional to the measured values.


#introduction to ggplot in R---------

# the ggplot is a data visualization package for creating graphs in R. its 
# also a method for decomposing complex graphs into logical subunits 

#it takes each components of graph axes, scales and colors object and allows you to buld graphs 
#you can modify each of the components in a way thats th flexible an user friendly
#when components are unspecified,  ggplot uses sensible defualts 

# ggplot uses geoms or geometric objects to form the basis of different types of graphs

#geom_bar for bar plots
#geom_line for line graphs 
#geom_points for scatter plots
#geom_boxplot for box plots
#geom_quantile for continuoes x
#geom_violin for richer display of distriution
#geom_jitter for small data


#working.....

#pie charts for different products and unit sold

#create data for the graph
x<- c(33,45,70,110)
label<- c("soap", "detergent", "oil", "shampoo")

#plot the charts
pie(x,label)

pie(x, label, main = "City pie Chart", col = rainbow(length(x)))
piepercent <- round(100*x/sum(x), 1)

pie(x, labels = piepercent, main ="City pie Chart", col = rainbow(length(x)))
legend("topright", c("soap", "shampoo",  "oil", "Grcery"), cex = 0.8, fill = rainbow(length(x)))

#3d piecharts 

#get the library
install.packages("plotrix")
library(plotrix)
x <- c(33,45,70,110)
lbl<- label

pie3D(x, labels = lbl, explode = 0.1, main="Pie charts of countries")


#creating data for graphs

v <- c(9,13,21,8,36,2,12,41,31,33,19)

#creating the histogram
hist(v, xlab = "weight", col = "green", border = "red")

hist(v, xlab = "weight", col = "green", border = "red", xlim = c(0,40), ylim = c(0,5), breaks = 5)



#taking another data set 

data("airquality")
View(airquality)

#using the plot function to draw a scater plot

#plot a graph between ozone and wind values 

plot(airquality$Ozone, airquality$Wind)
plot(airquality$Ozone, airquality$Wind, col='red')
plot(airquality$Ozone, airquality$Wind, col='red', type = 'h') #histogram

#assigning labels to the plots

plot(airquality$Ozone, xlab="ozone concentration", ylab="no of instances", main = "Ozone levels in NY city", col='green', type='h' )

#histogram

hist(airquality$Solar.R)

hist(airquality$Solar.R, main = "solar Radiation in air", xlab = "solar rad" )

temperature <- airquality$Temp    
hist(temperature)

#histogram with limits 
h <- hist(temperature, ylim = c(0,40))


#histogram with non uniform values 

hist( temperature,
  main =  "Maximum daily temperature at La guardia Airport",
  xlab = "temperature in degrees Farenhiet",
  xlim= c(50,100),
  col = "chocolate",
  border = "brown",
  breaks = c(55, 60, 70, 75, 80, 100)
 )


#boxplot

boxplot(airquality$Solar.R)

#creating multiple box plots
boxplot(airquality[0:4], main = "multiple Box Plot ")


#using ggplot library to analye mtcars dataset 
install.packages("ggplot2")
library(ggplot2)
attach(mtcars)

factor(mtcars$cyl)

pl <- ggplot(mtcars, aes(factor(cyl), mpg))

pl + geom_boxplot() 

#changing the coordinates 
pl + geom_boxplot() + coord_flip()

pl + geom_boxplot(aes(fill = factor(cyl)))


#create factors with values label

mtcars$gear <- factor(mtcars$gear, levels = c(3,4,5), labels = c("3gear", "4gears", "5gears "))

mtcars$am <- factor(mtcars$am, levels = c(0, 1), labels = c("Automatic", "Manual "))

mtcars$cyl <- factor(mtcars$cyl, levels = c(4,6,8), labels = c("4cyl", "6cyl", "8cyl"))


#scatter plot
ggplot(data = mtcars, mapping = aes(x=wt, y = mpg))+ geom_point()

ggplot(data = mtcars, mapping = aes(x=wt, y = mpg, color = "red", size = qsec))+ geom_point()


#scatter plot by facors 
ggplot(data = mtcars, mapping = aes(x=wt, y = cars, color = as.factor(cyl)))+ geom_point()


#---------visualization using mpg dataset 

ggplot2::mpg
View(ggplot2::mpg
)

# creating a bar plot

ggplot(data = ggplot2::mpg, aes(class)) + geom_bar()


#stacked bar charts 
ggplot(data = ggplot2::mpg, aes(class)) + geom_bar(aes(fill = drv))

#using the dodge
ggplot(data = ggplot2::mpg, aes(class)) + geom_bar(aes(fill = drv), position = "dodge")


ggplot(data = ggplot2::mpg) + geom_point(mapping = aes(x = displ, y = class))

ggplot(data = ggplot2::mpg) + geom_point(mapping = aes(x = displ, y = hwy, color = class))


#using a plotly library

install.packages("plotly")
library(plotly)

b <-plot_ly(data = mtcars, x = ~hp, y = ~wt, marker = list(size = 10, color = 'rgba(255,182, 192, 9)', line = list(color = "rgba(152, 0 ,0 ,8)", width = 2)))
#the function of ~ is so the column can be atken as label
b

plot <- plot_ly(data = mtcars, x = ~hp, y = ~wt, color = ~hp, size = ~hp)
plot
