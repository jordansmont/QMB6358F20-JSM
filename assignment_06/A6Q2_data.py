# -*- coding: utf-8 -*-
"""
##################################################
#
# QMB 6358: Software Tools for Business Analytics
#
# Sample script for Assignment 6, Question 2
#
# Name: Jordan Montgomery
# College of Business Administration
# University of Central Florida
#
# Date: 10/30/2020
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
import statsmodels.formula.api as sm # Another way to estimate linear regression
import string
import glob


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
# Question 2 a) 
# Get observations from a line.
##################################################


# Use this code block to obtain an example of a line.
# input_file = open('html_files/week_1.html', 'r')
with open('html_files/week_1.html', 'r') as input_file:
    
    # Pull the header (not useful information).
    # The header is in the first 23 rows:
    # Loop on the lines in the dataset.
    for line_num in range(23):
        line = input_file.readline()
        print(line)
        
    # Now take the very next line as a sample for your function.
    line = input_file.readline()


# See what it looks like.
print(line)


# Now make your function with this example.
def get_obs(line):
    
    # Code goes here.
    start = line.find('>')+1
    end = line.rfind('<')
    
    """
    ORIGINAL ANSWER WHICH ALSO WORKS:
        HOWEVER, 'STRING' CAN BE REPLACED WITH THE OBJECT NAME
        
    start = string.find(line,">")+1
    end = string.rfind(line,"<")
    
    """   
    num_out = line[start:end]
    
    return num_out

"""
##################################################
# TEST FOR get_obs()
##################################################

get_obs(line)

"""

##################################################
# Question 2 b) 
# Get a row of observations from several lines.
##################################################


# Use this code block to obtain an example of a 
# set of lines for a row in the file.
# input_file = open('html_files/week_1.html', 'r')
with open('html_files/week_1.html', 'r') as input_file:
    
    # Pull the header (not useful information).
    # The header is in the first 23 rows:
    # Loop on the lines in the dataset.
    for line_num in range(22):
        line = input_file.readline()
        # print(line)
    # Note that we only skip the first 22 
    # because of the pattern in the data. 
        
    # Now take the very next line as a sample for your function.
    line_1 = input_file.readline()
    line_2 = input_file.readline()
    line_3 = input_file.readline()
    line_4 = input_file.readline()
    line_5 = input_file.readline()
    line_6 = input_file.readline()


# See what they look like.
print(line_1)
print(line_2)
print(line_3)
print(line_4)
print(line_5)
print(line_6)



# Now make your function with this example.
def get_obs_row(line_2, line_3, line_4, line_5):
    
    # Code goes here.
    row_out = [get_obs(line_2),get_obs(line_3),get_obs(line_4),get_obs(line_5)]
    
    return row_out


"""
##################################################
# TEST FOR get_obs()
##################################################

get_obs_row(line_2, line_3, line_4, line_5)

"""


##################################################
# Question 2 c) 
# Get all rows of observations from the entire file.

### NOTES TO SELF FOR FUTURE REFERENCE
##################################################

housing_data = pd.DataFrame([],columns=['house_price','income','in_cali','earthquake'])

### THIS STEP CREATES THE EMPTY DATAFRAME FOR HOUSING_DATA


# Use this code block to obtain an example of a 
# set of lines for a row in the file.
# input_file = open('html_files/week_1.html', 'r')
with open('html_files/week_1.html', 'r') as input_file:
    
    # Pull the header (not useful information).
    # The header is in the first 23 rows:
    # Loop on the lines in the dataset.
    for line_num in range(22):
        line = input_file.readline()
        # print(line)
    # Note that we only skip the first 22 
    # because of the pattern in the data. 
        
    # Now take the very next line as a sample for your function.
    for row in range(20):
        line_1 = input_file.readline()
        line_2 = input_file.readline()
        line_3 = input_file.readline()
        line_4 = input_file.readline()
        line_5 = input_file.readline()
        line_6 = input_file.readline()
        
        next_row = get_obs_row(line_2, line_3, line_4, line_5)
            
        # More code goes here.
        
        housing_data_row = pd.DataFrame([next_row],columns=['house_price','income','in_cali','earthquake'])

        ### THIS CREATES A VECTOR (SMALL DATAFRAME) FOR THE DATA 
        ### OBTAINED BY PARSING EACH LINE FROM THE HTML FILE
        
        housing_data = housing_data.append([housing_data_row])
        
        ### THIS APPENDS EACH NEW VECTOR CREATED TO THE ORIGINAL 
        ### HOUSING_DATA DATAFRAME SO IT BECOMES A TABLE OF VALUES
        
        print(housing_data)

##################################################
# Question 2 d) 
# Get all observations from all 5 files.
##################################################


# Code goes here.
path = r'C:\\Users\\jorda\\OneDrive\\Documents\\UCF\\QMB6358\\QMB6358F20\\assignment_06\\html_files'
files = glob.glob(os.path.join(path, "*.html"))

housing_data = pd.DataFrame([],columns=['house_price','income','in_cali','earthquake'])

for file in files:
    with open(file, 'r') as input_file:
    
        for line_num in range(22):
            line = input_file.readline()
        
        for row in range(20):
            line_1 = input_file.readline()
            line_2 = input_file.readline()
            line_3 = input_file.readline()
            line_4 = input_file.readline()
            line_5 = input_file.readline()
            line_6 = input_file.readline()
        
            next_row = get_obs_row(line_2, line_3, line_4, line_5)
            housing_data_row = pd.DataFrame([next_row],columns=['house_price','income','in_cali','earthquake'])
            housing_data = housing_data.append([housing_data_row])


# Replace this with the final dataset.
housing_data = pd.read_csv('housing_data/housing_data_1.csv')
# For now, this is just an example from Question 1
# to see what the result should look like. 



##################################################
# Inspect the final dataset
##################################################


# Calculate summary statistics for your data.
housing_data.describe()
# Use this to check whether your data handling is working correctly.


##################################################
# Fit the Regression Model (for data from original file)
##################################################

# After the full dataset is obtained:

# Fit the regression model.
reg_model_full_sm = sm.ols(formula = "house_price ~ income + in_cali + earthquake", 
                           data = housing_data).fit()



# Display a summary table of regression results.
print(reg_model_full_sm.summary())




##################################################
# End
##################################################




