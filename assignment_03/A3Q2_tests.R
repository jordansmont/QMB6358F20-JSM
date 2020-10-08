
################################################################################
#
# QMB 6358: Software Tools for Business Analytics
# Assignment 3: Data Handling
#
# Name: Jordan Montgomery
# College of Business
# University of Central Florida
#
# Date: 10/8/2020
#
################################################################################
#
# This program reads two datasets and tests that the contents
# match the other dataset.
# It is a sample of the script for Assignment 3, Question 2.
#
#
#
################################################################################

# Clear workspace.
# The remove function removes everything in the workspace when the list is all.
rm(list=ls(all=TRUE))

# Load library of functions.
# source('my_R_code.R')

# Load packages.
# library(name_of_R_package_goes_here)


# Set working directory to the path containing the csv files.
# wd_path <- "/path/to/your/folder
wd_path <- "C:/Users/jorda/OneDrive/Documents/UCF/QMB6358/QMB6358-iris"
setwd(wd_path)


# Set paths to other folders.
# data_path <- sprintf('%s/data', wd_path)
# Optional: Organize data in a separate folder for larger projects.


################################################################################
# Testing datasets from Question 2
################################################################################


A3Q2a_data <- read.table(file = "A3Q2a.full.csv")

print(A3Q2a_data)

summary(A3Q2a_data)


A3Q2b_data <- read.table(file = "A3Q2b.full.csv")

print(A3Q2b_data)

summary(A3Q2b_data)

################################################################################
# End
################################################################################

