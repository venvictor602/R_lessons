order_detail <- c(10,20,30,NA, 50,60)
names(order_detail) <- c("mon", "tues", "wed", "thur", "fri", "sat")
sum(order_detail, na.rm =T )
mean(order_detail, na.rm =T)
#using matrix 
v<- 20:30
v
matrix(v)

mat<- matrix(0,3,3)
mat
# creating a matrix by giving values and dimension 
mat2 <- matrix(1:9, 3,3)
mat2

mat3 <- matrix(1:9, nrow=3, byrow = T)
mat3

#creating matrix using vectors 
stock1<- c(450,451,452,445,468)
stock2<- c(210,231,232,236,228)
stocks<- c(stock1, stock2)
stocks
stock_matrix<- matrix(stocks, byrow = T, nrow = 2)
stock_matrix
#giving specific names to the columns 
days<- c("Mon", "Tues", "Wed", "thur", "Fri")
st_name <- c("Stock1", "Stock2")
#the days is for the columns while the st_names is for the rows

colnames(stock_matrix)<- days
rownames(stock_matrix)<- st_name
stock_matrix

#functions associated with matrix 
nrow(stock_matrix)
ncol(stock_matrix)
dim(stock_matrix)
colnames(stock_matrix)
rownames(stock_matrix)
dimnames(stock_matrix)

#arithmetic operations in matrix 
mat1<- matrix(1:50, byrow = T, nrow = 5)
mat
#adding 5 across all matrix
mat1 + 5

mat1-5

#this returns the quotient 
mat1/5

#this returns the reciprocal
5/mat1

#getting the exponential
mat1 ^ 2

#arithmetic operations on all matrix
mat1+mat1

mat1-mat1

#matrix operations 

#sum up all the columns 
colSums(stock_matrix)

#sum up all the row 
rowSums(stock_matrix)

#adding rows and columns to matrix using Rbind and cbing 
#but before use that u must first create a vector

stock3 <- c(150, 149, 120, 114, 151)
total_stock <- rbind(stock_matrix, stock3)
total_stock

#getting the average of rows
avg<- rowMeans(total_stock)
avg

#using the cbind to add avg to column
total_stock<- cbind(total_stock, avg)
total_stock

#matrix selection and indexing 
student <- matrix(c(20,30,NA,70,22,28,36,80,24,26,32,75,26,24,NA,50), nrow=4, ncol=4, byrow = T)
dimnames(student)<- list(c("john", "mathew", "sam", "ALice"), c("Phy", "Chem", "Bio", "Maths"))
student 

#extracting particular columns 
student[,1]
student [,1:2]
student[,c(1,3)] #this is saying 1 and 3

#extracting of rows
student[1,]
student[1:2,]
student[c(1,3),]
student[2,2] #getting an intrsection of rows and columns 

#finding John's score in Chem nd Bio
student["john", 2:3]

#finding John and sam  score in math
student[c("john", "sam"), 4]

#finding math and bio  score in sam and alice
student[c("ALice", "sam"), 3:4]

#finding avearge score of john 
mean(student[c("john"), ], na.rm=T) # na.rm removes the NA in it to aviod erros 

#finding the avarage ad total score for all student

#in this we use the aply function type help(apply) to learn more

help(apply)

apply(student, 1, mean, na.rm=T)

#1 stands for the rows we are selecting from
#mean is the mathematical operations

apply(student, 1, sum, na.rm=T)

#comparing the passing score of students 
passing_score<- c(25,25,25,70)
passing_score

PASS<- (student[c("ALice"), ]>passing_score)
PASS

sum(PASS, na.rm = T)

PASS<- (student[c("sam"), ]>passing_score)
PASS

student

sum(PASS, na.rm = T)


#-------------Data frames in R-------------
data() #these gives you sample data sets avialable 

data("AirPassengers")
head(AirPassengers)

data("iris")
head(iris)
view(iris)
View(iris)

View(state.x77)
View(USPersonalExpenditure)
 
#get a ststistical sumarry of the data
summary(iris)

#check the structure of a dataset
str(iris)

#creating a data frame uing the data.frame() function

days<- c("mon", "tues", "wed", "thur", "fri")
temp<- c(25.6,30.1,45,37.3,41.2)
rain <- c(TRUE, TRUE, FALSE, FALSE, TRUE)

df <- data.frame(days, temp, rain)
df

summary(df)

#data frame indexing 
df[1,]
df[,2]

#selecting using column names 
df['temp']
df[2:4, c('days', 'temp')]

#using dollar sign to get all values in a column
df$days

df

#filtering data frames using a subset function
subset(df, subset=rain==TRUE)
subset(df, subset=temp>25)

#soritng the data frame using the order() fucntion
sorted_temp <- order(df['temp'])
df[sorted_temp,]
sorted_temp # this return the ranking 

desc_temp<- order(-df['temp'])
df[desc_temp,]


#another way of sorting is using the $ 
sort_temp2 <- order(df$temp)
df[sort_temp2,]


#merging Data Frames
authors <- data.frame(
  surname = I(c("Tukey", "venables", "Tieney", "Ripley", "McNeil")),
  nationality = c("US", "Austrialia", "US", "UK", "Austrialia"),
  deseased = c("yes", rep("no", 4))
  )
authors

book <- data.frame(
  name = I(c("Tukey", "venable", "Tienery", "Ripley", "Ripley", "McNeil", "R core")),
  title = c("Explanatory Data Analysis", 
            "Modern Applied Stataistics",
            "LISP-STAT",
            "Spatial Statistics", "Stockastic Simulation",
            "Interactive Data Analysis",
            "An Introduction to R"),
  other_author = c(NA, "Ripley", rep(NA, 4), "Venable & smith"))

book

(ml<- merge(authors, book, by.x="surname", by.y = "name"))


#maipulating a dataframe 

sales_report<- data.frame(
  ID=101:110,
  product = c("A", "B"),
  unitprice = as.integer(runif(10,100,200)), # this will get 10 random numbers between 100 to 200
  Qty =  as.integer(runif(10,10,20))

)

sales_report

#transpose data

transpose_data<- t(sales_report)
View(transpose_data)
head(sales_report)

#sorting 
sales_report[order(sales_report$unitprice),]
sales_report[order(sales_report$unitprice, decreasing = T),]

#Subsetting data frame 
product_A<- subset(sales_report, product=="A")
product_A

#extract the rows for which product is A and unit price = 150
subset_sales <- subset(sales_report, product=="A" & unitprice==120)
subset_sale
#selecting based on the columns 
subset_columns <- subset(sales_report, product=="A" & unitprice>120, c(1,4))
subset_columns


#merging data frames 
setA <- subset(sales_report, product=="A")
setB <- subset(sales_report, product=="B")
setA
setB
cbind(setA, setB)
rbind(setA, setB)

#Aggrgate function
#trying to group the product and summing it 
aggregate(sales_report$Qty, list(sales_report$product), sum, na.rm=T)

#--------------List in R------------
list1<- list(x=c(10,20,30),
            y=c("a", "b", "c"),
            z=c(TRUE, FALSE))
list1


list2<- list(vec=seq(1:10),
             mat=matrix(1:9, 3,3),
             lis=list(a=10, b=20))
list2


#recursive vaariable => variables that can store values of its own type
is.recursive(list2)

#indexing oof list 
list2[2] #by index
list2$mat #bby dollar notation
list2['vec'] #by name 
list2$lis[2] # 3rd element 2 value
list2[[3]][2] # 3rd element 2 value

length(list2)

#converting vectors into list

price <- c(10,20,30)
price_list <- as.list(price)
price_list


#coveerting list into vector
new_price <- unlist(price_list)
new_price


#converting a vectoor into a matrix
price1 <- c(10,20,30,40)
price1
dim(price1) <- c(2,2)
price1

#-----------Basic data types functions----------
n1 <- 10
class(n1)
n2 <- 10.4
class(n2)
typeof(n1)

is.numeric(n1)

is.numeric(n2)

I1 <- as.integer(10)
I1
I2 <- as.integer(10.4)
I3 <- as.integer("10.4")
class(I1)
class(I2)
class(I3)

# all integer are numeric but not ll numeric are integers

c1 <- "john"
c2 <- "Bob"

is.character(c1)
is.character(c2)

toupper(c1)
substr(c1, 1,2)

name <- paste(c1,c2)
name
name1 <- paste0(c1,c2)
name1

name <- paste(c1,c2, sep = "_")
name

rename <- sub("Bob", "Cena", name) #replace set of chracters
name

length(c1)
