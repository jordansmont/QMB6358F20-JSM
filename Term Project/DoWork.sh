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
# Due Date: 12/6/2020
#
################################################################################
#
# This shell script reads a dataset, summarizes the data, plots figures
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
echo "Running my Business Analytics Term Project..."
echo ""

################################################################################
# Perform data handling or modelling in R
################################################################################

export PATH='/c/Program Files/R/R-3.6.1/bin'

echo "#-------------------------------------------------"
echo ""
echo "Running data wrangling and modeling in R..."
echo ""

Rscript Code/Project_Analysis.R > Code/Project_Analysis.out

echo ""
echo "Finished data wrangling and modeling in R."
echo ""
echo "#-------------------------------------------------"
echo ""


################################################################################
# Build the pdf Document with LaTeX
################################################################################

echo "#-------------------------------------------------"
echo ""
echo "Building the pdf Document with LaTeX..."
echo ""

export PATH='/c/Program Files/texlive/2020/bin/win32'

cd Papers

pdflatex Paper.tex

cd ..

echo ""
echo "Finished building the pdf document with LaTeX."
echo ""
echo "#-------------------------------------------------"
echo ""


################################################################################
# If you made it here without error, it worked.
################################################################################

echo "Finished my Business Analytics Term Project!"
echo ""
echo "##################################################"

################################################################################
# End
################################################################################
