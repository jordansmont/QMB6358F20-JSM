################################################################################
#
# QMB 6358: Software Tools for Business Analytics
# Assignment 1, Question 2:
# Drafting Code for Functions
#
# Name: JORDAN MONTGOMERY
# Executive Development Center
# College of Business Administration
# University of Central Florida
#
# Date: 8/31/2020
#
################################################################################
#
# This program defines the commands for a library of functions.
#
################################################################################

# Load packages, if you need any.
# library(name_of_R_package_goes_here)

################################################################################
# Functions
################################################################################


#--------------------------------------------------------------------------------
# Example 1 - Multiply two numbers
#--------------------------------------------------------------------------------

num_1 <- 3
num_2 <- 6

# Code goes here:
product_out <- num_1 * num_2
print(product_out)

# Test1 
num_1 <- 1
num_2 <- 7
product_out <- num_1 * num_2
print(product_out)

# Code for creating a function to multiply two numbers:
product_out <- function(num_1,num_2) {return(num_1 * num_2)}
product_out(3,6)

# Test2 
product_out(1,7)

# This exercise helped me realize that without creating a function for the calculation,
# the product_out is saved as a value which will have to be redefined each time you
# want to change the numbers. In other words, you have to rerun line 39 to update the product_out
# value every time lines 35 and 36 change in value. If product_out is saved as a function
# you only need to run line 44 with updated input values to get an updated calculation.
# This was a very confusing concept for me last year but it makes sense now that I see this
# process without the use of functions.


#--------------------------------------------------------------------------------
# Example 2 - If statement to interpret numerical value
#--------------------------------------------------------------------------------

num_in <- 7

# Code goes here:
message_5_or_6 <- if (num_in == 5) {
  print("You entered 5.")
} else if (num_in == 6) {
  print("You entered 6.")
} else {
  print("You did not enter 5 or 6.")
}

print(message_5_or_6)

# Test1 
num_in <- 5
print(message_5_or_6)

# Code for creating a function to interpret the number input:
message_5_or_6 <- function(num_in) {if (num_in == 5) {
  print("You entered 5.")
} else if (num_in == 6) {
  print("You entered 6.")
} else {
  print("You did not enter 5 or 6.")
}}

message_5_or_6(7)

# Test2
message_5_or_6(5)
message_5_or_6(6)
message_5_or_6(294)


#--------------------------------------------------------------------------------
# Example 3 - If statement to read numerical value and return info based on numerical ranges
#--------------------------------------------------------------------------------

number_for_color <- 27

# Code goes here:
color_number <- if (number_for_color > 0 & number_for_color < 10) {
  print("blue")
} else if (number_for_color > 10 & number_for_color < 20) {
  print("red")
} else if (number_for_color > 20 & number_for_color < 30) {
  print("green")
} else {
  print("That is not a correct color option.")
}

print(color_number)

# Test1 
num_in <- 7
print(color_number)

# Code for creating a function:
color_number <- function(number_for_color) {if (number_for_color > 0 & number_for_color < 10) {print("blue")}
  else if (number_for_color > 10 & number_for_color < 20) {print("red")} 
  else if (number_for_color > 20 & number_for_color < 30) {print("green")} 
  else {print("That is not a correct color option.")}}

# I'm used to writing formulas using DAX for Power BI and MS Excel (VBA language or Power Query?)
# so it is easier for me to keep track of brackets keeping each argument on one line as I did above.

color_number(27)

# Test2 
color_number(7)
color_number(0)
color_number(10)
color_number(13)
color_number(34)


#--------------------------------------------------------------------------------
# Example 4 - Using for loop in counting multiples
#--------------------------------------------------------------------------------

num_5_limit <- 23


# Code goes here:
for (i in 0:(num_5_limit/5)) {print(i*5)}

# Test1
num_5_limit <- 76
for (i in 0:(num_5_limit/5)) {print(i*5)}

# Code for creating this as a function:
multiples <- function(num_5_limit) {for (i in 0:(num_5_limit/5)) {print(i*5)}}

# Test2
multiples(4)
multiples(25)


#--------------------------------------------------------------------------------
# Example 5 - Using for loop for counting even numbers
#--------------------------------------------------------------------------------

end_num <- 13


# Initialize count.
count_even_numbers <- 0

# Code goes here:
for (i in 0:end_num) {if(end_num %% 2 == 0) count_even_numbers = (end_num / 2)
  else {count_even_numbers <- (end_num - 1)/2}}

print(count_even_numbers)

# Test1
end_num <- 26
count_even_numbers <- 0
for (i in 0:end_num) {if(end_num %% 2 == 0) count_even_numbers = (end_num / 2)
else {count_even_numbers <- (end_num - 1)/2}}
print(count_even_numbers)

# Code for using a function:
even_numbers <- function(end_num, count_even_numbers) {
  for (i in 0:end_num) {if(end_num %% 2 == 0) count_even_numbers = (end_num / 2)
  else {count_even_numbers <- (end_num - 1)/2}}
  print(count_even_numbers)
}
even_numbers(13,0)

# Test2
even_numbers(1)
even_numbers(0)
even_numbers(24)

# I feel like there should be a simpler way to do the for loop above.
# I'm confident with my answers above but could you please recommend any suggestions
# for simplification if you notice anywhere I can include them?


#--------------------------------------------------------------------------------
# Example 6 - Calculate min, max, and average of a list of numbers
#--------------------------------------------------------------------------------

num_1 <- 1
num_2 <- 7
num_3 <- 20
num_4 <- 3
num_5 <- 4


num_list <- c(num_1, num_2, num_3, num_4, num_5)


# Code goes here:
my_min <- min(num_list)
my_min
my_avg <- sum(num_list)/length(num_list)
my_avg
my_max <- max(num_list)
my_max
num_out <- c(min = my_min, avg = my_avg, max = my_max)
num_out

# Code with fuctions:
my_min <- function(num_list) {min(num_list)}
my_min(num_list)

my_max <- function(num_list) {max(num_list)}
my_max(num_list)

my_avg <- function(num_list) {sum(num_list)/length(num_list)}
my_min(num_list)

num_out <- function(num_list) {c(min = my_min(num_list), avg = my_avg(num_list), max = my_max(num_list))}
num_out(num_list)
