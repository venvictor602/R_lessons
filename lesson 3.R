#functions and flow control in R

x<- 30L

if(is.integer(x)){
  print("X is an integer ")
}

if(is.character(x)){
  print("X is an integer ")
}else{
  print("X is not a character")
}

#While loops
v<- c("Hello world")
count <- 2

while (count<5) {
  print(v)
  count=count + 1
}

#using for loops 
fruits <- c("Apple", "orange", "passion fruit", "banana")

for (fruit in fruits) {
  print(fruit)
}


#logical operations in R

x <- 25
x<10
x>10
x<20 & x<10
(x<20) & (x>5) & (x==25)

x>10 | x<5
x>20 | x==30
(12==3)
!(12==3)


df <- mtcars
df

df[df['mpg']>30,]

#-----------flow control-----------

#single condition check
hot <- FALSE
temp <- 70

if (temp >60 ){
  hot <- TRUE
}

hot


# Else statement 
 score <- 63
 
 if(score>80){
   print('this is a good score')
 }else{
   print('not a good score')
 }

 # Else IF
 if(score>80){
   print('this is a good score')
 }else if(score>60 & score<80){
   print('decent  score')
 }else{
   print('poor score')
 }
 
 
 # while loops
 
 x <- 0
 
 while(x<10){
   cat('x is curently: ', X)
   print('x is sstill less thn 10,  adding 1 to x')
   x<- x+1
   
   if(x==10){
     print('x is equl to 10 terminating the loop')
   }
 }
 
 # using the break statements
 x <- 0
 
 while(x<5){
   cat('x is curently: ', x)
   print('x is sstill less thn 10,  adding 1 to x')
   x<- x+1
   
   if(x==5){
     print('x is equl to 5')
     break
     print('i will also print,  wahooo')
   }
 }
 

 
 #for loops
 
 vec <- c(1,2,3,4,5)
for (temp_var in vec){
  print (temp_var)
} 
 
 for (i in 1:length(vec)){
   print (vec[i])
 } 
 
 # for loop over a list 
 li <- list(1,2,4,4,5)
 for (temp_var in li){
   print (temp_var)
 } 
 
 
 #looping through a matrix
 
 mat <- matrix(1:25, nrow = 5)
mat

for (num in mat){
  print(num *2 )
}
 

# printing the square and squre rots of numbers b/w 1-25

for (i in 1:25){
  sq <- i*i
  square_root <- sqrt(i)
  message("i=", i, "square=", sq, "squre root= ", square_root)
}

