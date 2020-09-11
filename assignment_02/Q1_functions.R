
################################################################################
#
# QMB 6358: Software Tools for Business Analytics
# Library of R Functions for Assignment 2
#
# Name: Jordan Montgomery
# College of Business Administration
# University of Central Florida
#
# Date: 9/10/2020
#
################################################################################
#
# This program is a library of R functions for Assignment 2.
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


################################################################################
# Functions
################################################################################

#--------------------------------------------------------------------------------
# First function: Sum of squared deviations
#--------------------------------------------------------------------------------

### NOT USING A FOR LOOP

### x is a vector of numbers provided by user

### mu is a mean provided by user

sum_sq_dev <- function(x,mu) {return  
  sum((x - mu)^2)}

### sum_sq_dev(x,mu)

#--------------------------------------------------------------------------------
# Second function: Covariance between two variables
#--------------------------------------------------------------------------------

### NOT USING A FOR LOOP


covar_y_x <- function(x,y) {
  x_hat <- sum(x) / length(x)
  y_hat <- sum(y) / length(y)
  sum((y-y_hat)*(x-x_hat))*(1/length(x))}

### TEST

### covar_y_x(x,y)

### cov()

################################################################################
# End
################################################################################
