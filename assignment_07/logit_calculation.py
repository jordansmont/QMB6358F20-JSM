# -*- coding: utf-8 -*-
"""
##################################################
#
# QMB 6358: Software Tools for Business Analytics
#
# Data Analysis with Pandas: Logistic Regression
#
# Name: Jordan Montgomery
# Department of Economics
# College of Business Administration
# University of Central Florida
#
# Due Date: 11/18/2020
#
# This script estimates logistic regression in python, 
# using several numerical methods.
# It uses a sample dataset credit_data.csv with the following variables:
#   default: 1 if borrower defaulted on a loan
#   bmaxrate: Maximum rate of interest on any part of the loan
#   amount: the amount funded on the loan
#   close: borrower takes the option of closing the listing
#     until it is fully funded
#   AA: borrowers FICO score greater than 760
#   A: borrowers FICO score between 720 and 759
#   B: borrowers FICO score between 680 and 719
#   C: borrowers FICO score between 640 and 679
#   D: borrowers FICO score between 600 and 639
#
##################################################
"""

##################################################
# Import Modules.
##################################################


import os # To set working directory
# import numpy as np # Not needed here but often useful
import pandas as pd # To read and inspect data
# from sklearn.linear_model import LogisticRegression

# import statsmodels.formula.api as smf # Another way to estimate logistic regression
import statsmodels.api as sm # Another way to estimate logistic regression

# Need exponential function in likelihood function. 
import numpy as np
# And np arrays are used in calculation. 

# Import scipy package for optimization
from scipy import optimize
from scipy.optimize import minimize

# To plot regression results
import matplotlib.pyplot as plt  



##################################################
# Set Working Directory.
##################################################


# Find out the current directory.
os.getcwd()
# Change to a new directory.
os.chdir('C:\\Users\\jorda\\OneDrive\\Documents\\UCF\\QMB6358\\QMB6358F20\\demo_12_linear_models_in_python')
# Check that the change was successful.
os.getcwd()



##################################################
# Load Data.
##################################################


credit = pd.read_csv('credit_data.csv')



##################################################
# Inspect Data.
##################################################



# Inspect the target variable.
credit['default'].value_counts()


# Look at the explanatory variables in groups.
credit[['bmaxrate','amount','close','bankcardutil']].describe()
credit[['AA','A','B','C']].describe()





##################################################
# Logistic Regression.
##################################################


#--------------------------------------------------
# Fit the Logistic Model (with statsmodels module).
#--------------------------------------------------

# Select the target variable as y.
y = credit['default']
# y = np.array(credit['default'])

# Create a matrix of explanatory variables.
# Add a column of 1s for the constant. 
credit['Intercept'] = 1
# Get names of explanatory variables (in order).
X_cols = credit.columns[[10, 4, 5, 6, 7, 8]]
# Create matrix of explanatory variables.
X = credit[X_cols]
# X = np.array(credit[X_cols])


# Initialize and specify the logistic model.
logit_model_sm = sm.Logit(y, X)

# Fit the model.
logit_model_fit_sm = logit_model_sm.fit()

# Display the parameters.
print(logit_model_fit_sm.params)
# This is the goal: calculate these coefficients.


# Display a summary table of regression results.
print(logit_model_fit_sm.summary())
# Objective is -593.02 in regression output above:
# Log-Likelihood:                -593.02


##################################################
# The likelihood function
##################################################


#--------------------------------------------------
# Define the objective function: 
# The likelihood function
#--------------------------------------------------

def logit_likelihood(beta, y, X):
    X_beta = X.dot(beta)
    exp_X_beta = np.exp(X_beta)
    probs = exp_X_beta/(1 + exp_X_beta)
    like = sum(np.log(probs[y == 1])) + sum(np.log(1 - probs[y == 0]))
    neg_like = - like
    return neg_like



# Test this function with a value of the parameter beta.
beta = logit_model_fit_sm.params
# Objective is -593.02 in regression output above:
# Log-Likelihood:                -593.02
print(logit_likelihood(beta, y, X))
# Check. 

"""
THE RESULT CAME OUT 593.02 INSTEAD OF -593.02
"""

#--------------------------------------------------
# Define the gradient vector of the objective function: 
# The slope of the likelihood function
#--------------------------------------------------

def logit_gradient(beta, y, X):
    X_beta = X.dot(beta)
    exp_X_beta = np.exp(X_beta)
    probs = exp_X_beta/(1 + exp_X_beta)
    error = y - probs
    grad = error.dot(X)
    neg_grad = - grad
    return neg_grad



# Test this function with a value of the parameter beta.
beta = logit_model_fit_sm.params
# Goal is zero when likelihood function is optimized.
print(logit_gradient(beta, y, X))
# Check (almost zero). 

"""

BELOW ARE THE RESULTS. IF THIS IS SUPPOSED TO RETURN A
VECTOR OF VALUES THAT ARE CLOSE TO ZERO, IT WAS SUCCESSFUL


Intercept    2.930989e-14
AA           2.109424e-15
A           -0.000000e+00
B            3.330669e-16
C            1.421085e-14
D            3.108624e-15

"""

##################################################
# Solve the First Order Conditions
# Find the beta such that the gradient vector is zero
##################################################


#--------------------------------------------------
# Use the optimize.root() function.
#--------------------------------------------------

# Start with the zero vector.
# (pretend you don't know it until you calculate it).
beta_0 = np.zeros(len(logit_model_fit_sm.params))


# Complete this command:
soln_grad = optimize.root(logit_gradient, beta_0, (y,X))


# Check the results:

# The parameters:
print(soln_grad.x)
# Compare with the estimates from logit_model_fit_sm:
print(logit_model_fit_sm.params)
# Are they the same?

# The objective function:
print(soln_grad.fun)
print(logit_gradient(soln_grad.x, y, X))
# Is it close to zero?

"""
YEP, THIS VECTOR CAME OUT PRETTY CLOSE TO ZERO AS WELL:
 
Intercept   -5.200310e-09
AA           3.348433e-11
A           -3.728992e-09
B           -3.223344e-09
C            1.068980e-09
D            5.678662e-10

"""
    

##################################################
# Optimize the Likelihood Function
# Find the beta such that the likelihood function is maximized
##################################################


#--------------------------------------------------
# Nelder-Mead Simplex algorithm
# Use the method = 'nelder-mead' algorithm. 
#--------------------------------------------------


# Start with the zero vector.
# (pretend you don't know it until you calculate it).
beta_0 = np.zeros(len(logit_model_fit_sm.params))


# Complete this command:
soln_nm = minimize(logit_likelihood, beta_0, (y,X), 
                   method = 'nelder-mead',
                   options = {'xtol': 1e-8,'maxiter':1000,'disp':True})


# Check the results:

# The parameters:
print(soln_nm.x)
# Compare with the estimates from logit_model_fit_sm:
print(logit_model_fit_sm.params)

# The objective function:
print(soln_nm.fun)
print(logit_likelihood(soln_nm.x, y, X))


"""
Maximum number of iterations has been exceeded.

print(soln_nm.x)
[-2.58889198  0.10921435 -0.52217451  0.75695017  0.2612048   0.34089986]

print(logit_model_fit_sm.params)
Intercept   -1.598568
AA          -2.972700
A           -2.025773
B           -2.208094
C           -1.273111
D           -0.888651

print(soln_nm.fun)
672.4543469420857

print(logit_likelihood(soln_nm.x, y, X))
672.454346942

"""


#--------------------------------------------------
# Powell Method 
# AKA Davidon-Fletcher-Powell (DFP)
# Use the method = 'powell' algorithm. 
#--------------------------------------------------


# Start with the zero vector.
# (pretend you don't know it until you calculate it).
beta_0 = np.zeros(len(logit_model_fit_sm.params))


# Complete this command:
soln_dfp = minimize(logit_likelihood, beta_0, (y,X), 
                   method = 'powell',
                   options = {'xtol': 1e-8,'maxiter':1000,'disp':True})


# Check the results:

# The parameters:
print(soln_dfp.x)
# Compare with the estimates from logit_model_fit_sm:
print(logit_model_fit_sm.params)

# The objective function:
print(soln_dfp.fun)
print(logit_likelihood(soln_dfp.x, y, X))

"""
Optimization terminated successfully.
         Current function value: 593.021591
         Iterations: 4
         Function evaluations: 430

print(soln_dfp.x)
[-1.59433579 -2.96550874 -2.02094748 -2.20281342 -1.2701672  -0.88666711]

print(logit_model_fit_sm.params)
Intercept   -1.598568
AA          -2.972700
A           -2.025773
B           -2.208094
C           -1.273111
D           -0.888651

print(soln_dfp.fun)
593.0215913625455

print(logit_likelihood(soln_dfp.x, y, X))
593.021591363
"""

#--------------------------------------------------
# Broyden-Fletcher-Goldfarb-Shanno algorithm (BFGS)
# First try by only the likelihood function
# Use the method = 'BFGS' algorithm. 
#--------------------------------------------------


# Start with the zero vector.
# (pretend you don't know it until you calculate it).
beta_0 = np.zeros(len(logit_model_fit_sm.params))


# Complete this command:
soln_bfgs = minimize(logit_likelihood, beta_0, (y,X), 
                   method = 'BFGS',
                   options = {'disp':True})


# Check the results:

# The parameters:
print(soln_bfgs.x)
# Compare with the estimates from logit_model_fit_sm:
print(logit_model_fit_sm.params)

# The objective function:
print(soln_bfgs.fun)
print(logit_likelihood(soln_bfgs.x, y, X))

"""
Warning: Desired error not necessarily achieved due to precision loss.
         Current function value: 593.018833
         Iterations: 39
         Function evaluations: 353
         Gradient evaluations: 44

print(soln_bfgs.x)
[-1.59856769 -2.97269766 -2.02577164 -2.20809511 -1.27311004 -0.88865028]

print(logit_model_fit_sm.params)
Intercept   -1.598568
AA          -2.972700
A           -2.025773
B           -2.208094
C           -1.273111
D           -0.888651

print(soln_bfgs.fun)
593.01883287

print(logit_likelihood(soln_bfgs.x, y, X))
593.01883287
"""


#--------------------------------------------------
# Broyden-Fletcher-Goldfarb-Shanno algorithm (BFGS)
# Uses gradient vector, as well as function evaluations
# to reduce number of iterations.
# Use the method = 'BFGS' algorithm
# and supply the argument jac = logit_gradient. 
#--------------------------------------------------

# Start with the zero vector.
# (pretend you don't know it until you calculate it).
beta_0 = np.zeros(len(logit_model_fit_sm.params))


# Complete this command:
soln_bfgs_jac = minimize(logit_likelihood, beta_0, (y,X), 
                   method = 'BFGS', jac=logit_gradient,
                   options = {'disp':True})



# Check the results:
    
# The parameters:
print(soln_bfgs_jac.x)
# Compare with the estimates from logit_model_fit_sm:
print(logit_model_fit_sm.params)

# The objective function:
print(soln_bfgs_jac.fun)
print(logit_likelihood(soln_bfgs_jac.x, y, X))

"""
Optimization terminated successfully.
         Current function value: 593.018833
         Iterations: 30
         Function evaluations: 32
         Gradient evaluations: 32

print(soln_bfgs_jac.x)
[-1.5985683  -2.97270046 -2.0257728  -2.20809424 -1.27311127 -0.88865058]

print(logit_model_fit_sm.params)
Intercept   -1.598568
AA          -2.972700
A           -2.025773
B           -2.208094
C           -1.273111
D           -0.888651
dtype: float64

print(soln_bfgs_jac.fun)
593.01883287

print(logit_likelihood(soln_bfgs_jac.x, y, X))
593.01883287
"""




##################################################
# End
##################################################
