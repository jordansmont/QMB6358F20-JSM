#!/usr/bin/bash

################################################################################
#
# QMB 6358: Software Tools for Business Analytics
# Shell Script for Business Analytics Term Project
#
# Name: Jordan Montgomery
# College of Business
# University of Central Florida
#
# Date: 12/10/2020
#
################################################################################
#
# This shell script reads the datasets, summarizes the data, plots figures
#   and estimates a regression model. It creates files to collect these
#   results in a document built by LaTeX.
#
# Note: The top line tells where your bash program is located
#     and should match the result you get when you
#     type the command "which bash".
#     To run this script you have to navigate to this folder in
#     a terminal window, such as GitBash, and execute
#     ./my_shell_script.sh
#     where the name of the .sh file corresponds to the name of this file.
#
################################################################################

# Bash commands before running R
# e.g. making directory for output, etc.

echo "##################################################"
echo ""
echo "Running my Business Analytics Final Exam..."
echo ""

################################################################################
# Perform data handling or modelling in R
################################################################################

export PATH='/c/Program Files/R/R-3.6.1/bin'

echo "#-------------------------------------------------"
echo ""
echo "Running data wrangling, analysis, and modeling in R..."
echo ""

Rscript assignment_09.R > assignment_09.out

echo ""
echo "Finished working in R."
echo ""
echo "#-------------------------------------------------"
echo ""

################################################################################
# If you made it here without error, it worked.
################################################################################

echo "Finished my Business Analytics Final Exam!"
echo ""
echo "##################################################"

################################################################################
# End
################################################################################
