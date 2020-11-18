# -*- coding: utf-8 -*-
"""
##################################################
#
# QMB 6358: Software Tools for Business Analytics
#
# Project Data - summary statistical analysis
#
# Name: Jordan Montgomery
# College of Business Administration
# University of Central Florida
#
# Date:11/7/2020
#
#
##################################################
"""


##################################################
# Import Modules.
##################################################


import os # To set working directory
import pandas as pd # To read and inspect data
import pylab as pl
import seaborn as sns


##################################################
# Set Working Directory.
##################################################


# Find out the current directory.
os.getcwd()
# Change to a new directory.
os.chdir('C:\\Users\\jorda\\OneDrive\\Documents\\UCF\\QMB6358\\QMB6358F20-JSM\\Term Project')
# Check that the change was successful.
os.getcwd()


##################################################
# 1) Load Data.
##################################################


ResumeNames = pd.read_csv('ResumeNames.csv')

print(ResumeNames)

# Removing data which will not be used in analysis
ResumeNames.drop(columns=['honors','volunteer','military','school','email','special','requirements','reqcomm','reqorg'])


##################################################
# 2) Summary statistics for dependent variable. 
##################################################


# Changing "no" to "0" and "yes" to "1" in "call" column to use in histogram
ResumeNames.loc[ResumeNames["call"]=="no","call"] = 0
ResumeNames.loc[ResumeNames["call"]=="yes","call"] = 1

pd.DataFrame.hist(ResumeNames[['call']])
pl.title("Histogram")
pl.xlabel("Call Back - Yes(1) or No(0)")
pl.ylabel("Count")

ResumeNames.call.describe()


##################################################
# 3) Summary statistics for explanatory variables. 
##################################################


# Plotting 'histogram' of Resume Names > 'name' column in dataset
# since it is the primary exploratory variable for the analysis
ResumeNames_plot = sns.factorplot(x="name", kind="count", data=ResumeNames)
ResumeNames_plot.set_xticklabels(rotation=90)

# Summary statistics of other exploratory variables
ResumeNames.name.describe()
ResumeNames.gender.describe()
ResumeNames.ethnicity.describe()
ResumeNames.quality.describe()
ResumeNames.city.describe()
ResumeNames.jobs.describe()
ResumeNames.experience.describe()
ResumeNames.holes.describe()
ResumeNames.computer.describe()
ResumeNames.college.describe()
ResumeNames.minimum.describe()
ResumeNames.equal.describe()
ResumeNames.wanted.describe()
ResumeNames.reqexp.describe()
ResumeNames.reqeduc.describe()
ResumeNames.reqcomp.describe()
ResumeNames.industry.describe()


ResumeNames.describe()
