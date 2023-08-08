#functions in R

hello_world <- function(){
  print('hello world')
}

hello_world()


#function with a single argument 

hello_name <- function(name){
  print(paste('wellcome ',name))
}
hello_name("john")

#unction with 2 arguments 

add_num <- function(num1, num2){
  print (num1 + num2)
}

add_num(30,40)

#adding a vetor to the function

add_num(c(10,20,30),5)

#function with defualt parameters

hello_name <- function(name = "Rick"){
  print(paste("helle", name))
}
hello_name()


# functions with return value

full_name <- function(name='ven', title='Chief'){
  return (paste(name, ' ', title))
}

full_name()


#built in functions 
#generte 1000 random values ffrom a normal distribution of mean 0 and 1
normal_distro <- rnorm(1000,0,1)
normal_distro
mean(normal_distro)
hist(normal_distro)

# to get the documentation of the function
?hist

#to get hsoogram with larg number of interval breaks
hist(normal_distro, breaks = 30)

#function with optional value 

epovalue <- function(x, power=2){
  hist(x^power)
}

epovalue(normal_distro)


#using named argumnts (and passing any other arguments)
expo_value <- function(x, power=2, ...){
  hist(x ^ power, ...)
}

expo_value(normal_distro, power =2, breaks=50 )

#passing logical arguments

expoVal <- function(x, exp = 2, hist=FALSE, ...){
  if(hist==TRUE){
    hist(x ^ exp)
    x ^ exp
  }else{
    x ^ exp
    
  }
}

expoVal(normal_distro)
expoVal(normal_distro, hist = TRUE)


#scope of a variable in a function
v <- "I am a global variable"
stuff <- "I am a global stuff"

fun <- function(stuff){
  print(v)
  stuff <- "reassigned stuff inside the function"
  print(stuff)
}

fun()
print(v)
print(stuff)
fun(stuff)
print(stuff)


#creating a function to check the final amount to be paid by a customer after
#adding 20% tax to the final purchased amount 

amount <- function(x=100){
  t = x+x*(20/100)
  return(t)
}

amount()


amount <- function(amt){
  if(amt>0) famt = amt+amt*(20/100)
  if (amt<=0) famt=amt
  return(famt)
}

amount(200)

#checking the argument and bosy of the function
args(amount)
body(amount)

#understanding the scope
f1 <- function(x){
  y=10
  g1=function(x){
    y+(x*x)
  }
  g1(x)
}

f1(10)

#exmples

status <- function(marks){
  result = "not Defined"
  if (marks >50) result="pass"
  message("Your result is ", result)
}

status(70)
 


status <- function(age){
  ageGrp = "not Defined"
  vote = "not Defined"
  if (age >18) {
    ageGrp="ADULT"
    vote = "YEs"
    }
  message("Your age group is ", ageGrp)
  message("Your   status is ", vote)
  
}

status(19)

#create a unction that conerts a name to upper case 
#reate a function that calcuate bonues base o years of expereince 
#try using a nested if statement to categorise based on adut kids or teens 
#wite an R function that finds the total number of years rrequired t raise $8000 if the user deposit is $750 per month

req_years <- function(amount=550){
  final_amount = 0
  month = 0
  while(final_amount <= 8000){
    month=month+1
    final_amount= final_amount + amount
      message("month =", month, "final amount = ", final_amount)
  }
  year = month/12
  return(year)
  
}


req_years()
req_years(100)


#built in functions in R

nums <- seq(0, 50, by=2)
nums

#sort

vec <- c(nums)

sort(vec, decreasing = TRUE)

#reverse

vec2 <- c(99,45,66,34,2,3,5,4)
rev(vec2)

#append

vec4 <- append(vec2, vec)
vec4

# there are many other fuctions like 
# asb(), sqrt(), sum(), floor(), exp(), mean()


#Regular expressions

text <- "R is a programming langauge for data sience"
grep('langauge', text)

grepl("langauge", text)


#factors in R
#factors we talk about categorical viriable which takes limited number 
#of different values

bloodg <- c("B", "AB", "O", "A", "O", "O", "A", "B")

#converting this to  factor

bloodgrp_factor <- factor(bloodg)

bloodgrp_factor

#what R does  is it goes hrough the vector to see the 
#differen ategories in there then R 
#sorts levels alphabetically and then converts convets the character vector into vector of integer 

#inspeeting the structure

str(bloodgrp_factor)

#creating your own levels

blood_factor2<- factor(bloodg, levels = c("O", "A", "B", "AB"))
blood_factor2

str(blood_factor2)

#specifying levels name 

levels(bloodgrp_factor) <- c("BT_A", "BT_AB", "BT_B", "BT_O")
bloodgrp_factor

#giving name to level whicg takes care of orderig

factor(bloodg, labels = c("BT_A", "BT_AB", "BT_B", "BT_O"))
#note you need to follow the same rder as it was when u gave the level in lne 232

#you can also give a name to be called in the labels to avid errors


#there are two tyes of cateegoricals 
#norminal and ordinal
#in norma there is no ordering example blood group A is not neccessarily greater than bllod group O


factor(bloodg, 
       levels = c("O", "A", "B", "AB"),
       labels = c("BT_O", "BT_A", "BT_B", "BT_AB"))



#there are two tyes of cateegoricals 
#norminal and ordinal
#in norminal there is no ordering example blood group A is not neccessarily greater than bllod group O
#try comparision will give warning `

#example

bloodgrp_factor[1]>bloodgrp_factor[2]
#this will raise an error cuz it cant compare the categorical value
#to heck if one varible is greater or has more worth


#but we can set an ordering to it below 
dress_size <- c("M", "L", "S", "S", "L", "M", "L", "M" )
dress_size_factor <- factor(dress_size, ordered = TRUE, levels = c("S", "M", "L"))

dress_size_factor

dress_size_factor[1] < dress_size_factor[2]


Type <- c("Small", "Tall", "Tallest", "Medium", "Small",
          "Medium", "Tallest", "Tall", "Small", "Small")
Type

#compare height type of first value with foruth value

type_factor <- factor(Type, ordered = T, levels = c("Small", "Medium", "Tall", "Tallest"))

type_factor

type_factor[1]>type_factor[4]

#converting it to integer

as.integer(type_factor)


#create a sequence 

v <- seq(0,20, by=2)
v

sort(v)


sample(x = 10:20, 3)


#working wth time stamps
Sys.Date() #rreturns the curent date

today <- Sys.Date()
today


#YYY-MM--DD
as.Date('1990-11-03')

#usin format
# %b is for month abbriviated
# %d is for day of the month
# %y is for the year in 2 digits

as.Date("nov-03-90", format= "%b-%d-%y")


#usin format
# %B is for month in full
# %Y is for the year in 4 digits

as.Date("november-03-1990", format="%B-%d-%Y")
