################################################################################
#
# QMB 6358: Software Tools for Business Analytics
# Testing a Library of R Functions
#
# Name: Jordan Montgomery
# College of Business Administration
# University of Central Florida
#
# Date: 9/10/2020
#
################################################################################
#
# This program tests a library of R functions.
#
#
#
################################################################################



################################################################################
# Load Packages
################################################################################

# Load any packages that are needed for these functions.
# library(package_name_goes_here)

# You would typically install the package first,
# instead of within the library.
# install.packages("package_name_goes_here")

# Set working directory, if calling from another location.
wd_path <- "~/UCF/QMB6358/HW/Assignment 2"
setwd(wd_path)


# Load your source code for the library of functions.
source("Q1_functions.R")
# Be sure that this library is located in the working directory.
# Otherwise, you can include the path.


################################################################################
# Testing Functions
################################################################################


print("Testing function sum_sq_dev:")

# Check values that are output.
print(sum_sq_dev(x = c(0, 0, 0), mu = 0))
# Test output against expected answer.
print(sum_sq_dev(x = c(0, 0, 0), mu = 0) == 0)

# Add more examples.

print(sum_sq_dev(x = c(4, 6, 13), mu = 5))

print(sum_sq_dev(x = c(4, 6, 13), mu = 5) == 9)

print(sum_sq_dev(x = c(8, 5, 3), mu = 8))

print(sum_sq_dev(x = c(8, 5, 3), mu = 8) == 34)

print(sum_sq_dev(x = c(1, 75, 9), mu = 18))

print(sum_sq_dev(x = c(1, 75, 9), mu = 18) == 6)



print("Testing function covar_y_x:")

# Check values that are output.
print(covar_y_x(y = c(0, 0, 0), x = c(0, 0, 0)))
# Test output against expected answer.
print(covar_y_x(y = c(0, 0, 0), x = c(0, 0, 0)) == 0)

# Add more examples.

print(covar_y_x(y = c(2, 7, 9), x = c(15, 27, 3)))

print(covar_y_x(y = c(2, 7, 9), x = c(15, 27, 3)) == -8)

print(covar_y_x(y = c(0, 5, 110), x = c(7, 370, 44)))

print(covar_y_x(y = c(0, 5, 110), x = c(7, 370, 44)) == 0)

print(covar_y_x(y = c(11, 0, 6), x = c(8, 3, 93)))

print(covar_y_x(y = c(11, 0, 6), x = c(8, 3, 93)) == 36)
  

print("Q1 library testing complete.")



################################################################################
# End
################################################################################
