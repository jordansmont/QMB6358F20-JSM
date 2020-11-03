# -*- coding: utf-8 -*-
"""
##################################################
#
# QMB 6358: Software Tools for Business Analytics
#
# Sample script for Assignment 6, Question 1
#
# Name: Jordan Montgomery
# College of Business Administration
# University of Central Florida
#
# Date:10/30/2020
#
#
##################################################
"""


##################################################
# Import Modules.
##################################################


import os # To set working directory
# import numpy as np # Not needed here but often useful
import pandas as pd # To read and inspect data
import glob
import statsmodels.formula.api as sm # Another way to estimate linear regression



##################################################
# Set Working Directory.
##################################################


# Find out the current directory.
os.getcwd()
# Change to a new directory.
os.chdir('C:\\Users\\jorda\\OneDrive\\Documents\\UCF\\QMB6358\\QMB6358F20\\assignment_06')
# Check that the change was successful.
os.getcwd()


##################################################
# Load Data.
##################################################


# 1a) 

# no loop
path = r'C:\\Users\\jorda\\OneDrive\\Documents\\UCF\\QMB6358\\QMB6358F20\\assignment_06\\housing_data'
os.listdir(path)

# with loop
files = os.listdir(path)
for filename in files:
    print(filename)


# 1b)




# 1c)

housing_full = pd.read_csv('housing_data/housing_data_1.csv')

# Use a for loop to bind additional datasets to housing_full.
# Code goes here.
files = glob.glob(os.path.join(path, "*.csv"))

housing_full = pd.concat(pd.read_csv(file) for file in files)



# Calculate summary statistics for your data.
housing_full.describe()
# Use this to check whether your data handling is working correctly.


##################################################
# 1d) Fit the Regression Model
##################################################

# After the full dataset is obtained:

# Fit the regression model.
reg_model_full_sm = sm.ols(formula = "house_price ~ income + in_cali + earthquake", 
                           data = housing_full).fit()



# Display a summary table of regression results.
print(reg_model_full_sm.summary())





##################################################
# End
##################################################


