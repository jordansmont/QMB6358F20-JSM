##################################################
#
# QMB 6358: Software Tools for Business Analytics
#
# Name: Jordan Montgomery
# College of Business
# University of Central Florida
#
# Date: 12/10/2020
#
#
# Final Exam
#
##################################################


##################################################
# Setting the workspace
##################################################


# Clear workspace.
rm(list=ls(all=TRUE))

# Libraries required:

wd_path <- "C:/Users/jorda/OneDrive/Documents/UCF/QMB6358/QMB6358F20-JSM/assignment_09"

setwd(wd_path)


##################################################
# Part A: Data Handling and Regression Modeling
##################################################

# 1A

airplane_sales <- read.csv(file = 'airplane_sales.csv')

# 1B

summary(airplane_sales)

# 1C

lm_airplanes = lm(price ~ age, data = airplane_sales)

print(summary(lm_airplanes))

# 2A

airplane_specs <- read.csv(file = 'airplane_specs.csv')

names(airplane_sales)[names(airplane_sales) == "X0Sale_ID"] <- "SaleID"

names(airplane_specs)[names(airplane_specs) == "X0Sale_ID"] <- "SaleID"

airplane_specs <- airplane_specs[order(airplane_specs$SaleID),]

# 2B & 2C

airplane_sales_specs = cbind.data.frame(airplane_sales,airplane_specs)

airplane_sales_specs = airplane_sales_specs[,-4]

write.csv(airplane_sales_specs,"C:\\Users\\jorda\\Documents\\airplane_sales_specs.csv")

# 2D

summary(airplane_sales_specs)

# 2E

lm_airplanes2 = lm(price ~ age + pass + wtop + fixgear + tdrag, data = airplane_sales_specs)

print(summary(lm_airplanes2))

# 3A

airplane_perf <- read.csv(file = 'airplane_perf.csv')

names(airplane_perf)[names(airplane_perf) == "X0Sale_ID"] <- "SaleID"

airplane_perf <- airplane_perf[order(airplane_perf$SaleID),]

# 3B & 3C

airplane_full = cbind.data.frame(airplane_sales_specs,airplane_perf)

airplane_full = airplane_full[,-8]

write.csv(airplane_sales_specs,"C:\\Users\\jorda\\Documents\\airplane_full.csv")

# 3D

summary(airplane_full)

# 3E

lm_airplanes3 = lm(price ~ age + pass + wtop + fixgear + tdrag + horse + fuel + ceiling + cruise, data = airplane_full)

print(summary(lm_airplanes3))

# 4A

airplane_full$log_price = log(airplane_full$price)

airplane_full$log_age = log(airplane_full$age)

airplane_full$log_horse = log(airplane_full$horse)

airplane_full$log_fuel = log(airplane_full$fuel)

airplane_full$log_ceiling = log(airplane_full$ceiling)

airplane_full$log_cruise = log(airplane_full$cruise)

# 4B

summary(airplane_full[,12:17])

# 4C

lm_airplanes4 = lm(log_price ~ log_age + pass + wtop + fixgear + tdrag + log_horse + log_ceiling + log_cruise, data = airplane_full)

print(summary(lm_airplanes4))


##################################################
# Part B: Function Design and Optimization
##################################################

# 5A
# The last model, lm_airplanes4, was the best model with an R-squared of 0.94 - meaning 94% of the variables are significant.

SSR <- function(beta, y, x1, x2, x3, x4, x5, x6, x7, x8) {
    beta_0 <- beta[1]
    beta_1 <- beta[2]
    beta_2 <- beta[3]
    beta_3 <- beta[4]
    beta_4 <- beta[5]
    beta_5 <- beta[6]
    beta_6 <- beta[7]
    beta_7 <- beta[8]
    
    ssr <- sum((y - beta_0 - beta_1*x1 - beta_2*x2 - beta_3*x3 - beta_4*x4 - beta_5*x5 - beta_6*x6 - beta_7*x7 - beta_8*x8)^2)
    
    return(SSR)
}

# 5B

SSR()

sum(lm_airplanes4$residuals^2)


# 5C




# 5D




##################################################
# End
##################################################
