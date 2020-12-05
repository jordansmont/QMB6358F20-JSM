
##################################################
#
# QMB 6358: Software Tools for Business Analytics
#
# Project Analysis
#
# Name: Jordan Montgomery
# College of Business Administration
# University of Central Florida
#
# Due Date:12/6/2020
#
#
##################################################

rm(list = ls(all=TRUE))

install.packages("xtable", repos = "http://cran.us.r-project.org")

library(xtable)

install.packages("texreg", repos = "http://cran.us.r-project.org")

library(texreg)

install.packages("tinytex", repos = "http://cran.us.r-project.org")

library(tinytex)

##################################################
# Loading data and transforming it to work with 
# statistical functions in R
##################################################


# Data directory
data_dir <- 'C:/Users/jorda/OneDrive/Documents/UCF/QMB6358/QMB6358F20-JSM/Term Project/Data'

setwd(data_dir)

getwd()

# Figures directory
fig_dir <- 'C:/Users/jorda/OneDrive/Documents/UCF/QMB6358/QMB6358F20-JSM/Term Project/Figures'

# Tables directory
tab_dir <- 'C:/Users/jorda/OneDrive/Documents/UCF/QMB6358/QMB6358F20-JSM/Term Project/Tables'

# Text directory
text_dir <- 'C:/Users/jorda/OneDrive/Documents/UCF/QMB6358/QMB6358F20-JSM/Term Project/Text'


ResumeNames = read.csv(file = 'ResumeNames.csv')

# Removing data which will not be used in analysis:
# honors,volunteer,military,school,email,special,requirements,reqcomm,reqorg
ResumeNames = ResumeNames[,-c(1,10,11,12,14,15,17,22,24,27)]


# Changing "no" to "0" and "yes" to "1" in "call" column to use in histogram

install.packages("dplyr", repos = "http://cran.us.r-project.org")

library(dplyr)

ResumeNames$call = ResumeNames$call %>% recode('yes'=1, 'no'=0)

# Call is going to be the dependent variable in this analysis.
# Since the Call data is binary (yes/no >>> 1/0),
# I'm going to use a logistic regression model as instructed.


##################################################
# Summary statistics for dependent variable. 
##################################################

# Histogram of Calls for all resume names
hist(ResumeNames$call,col = c("green","red"),xlab = "Calls",ylim = c(0,5000),main = "Histogram of Calls")

# Saving histogram in Figures folder
fig_file_name = 'HistogramCallsforAllNames.eps'
out_file_name = sprintf('%s/%s', fig_dir, fig_file_name)
setEPS()
postscript(out_file_name)
hist(ResumeNames$call,col = c("green","red"),xlab = "Calls",ylim = c(0,5000),main = "Histogram of Calls")
dev.off()


# Histogram of Calls for Caucasian names
cauc_names = ResumeNames[c(ResumeNames$ethnicity=="cauc"),]
hist(cauc_names$call,col = c("green","red"),xlab = "Calls",ylim = c(0,5000),main = "Histogram of Calls for Caucasian Names")

# Saving histogram in Figures folder
fig_file_name = 'Histogram-CallsforCaucasianNames.eps'
out_file_name = sprintf('%s/%s', fig_dir, fig_file_name)
setEPS()
postscript(out_file_name)
hist(cauc_names$call,col = c("green","red"),xlab = "Calls",ylim = c(0,5000),main = "Histogram of Calls for Caucasian Names")
dev.off()


# Histogram of Calls for African American names
afam_names = ResumeNames[c(ResumeNames$ethnicity=="afam"),]
hist(afam_names$call,col = c("green","red"),xlab = "Calls",ylim = c(0,5000),main = "Histogram of Calls for African American Names")

# Saving histogram in Figures folder
fig_file_name = 'Histogram-CallsforAfricanAmericanNames.eps'
out_file_name = sprintf('%s/%s', fig_dir, fig_file_name)
setEPS()
postscript(out_file_name)
hist(afam_names$call,col = c("green","red"),xlab = "Calls",ylim = c(0,5000),main = "Histogram of Calls for African American Names")
dev.off()


##################################################
# Summary of the explanatory variables
##################################################

str(ResumeNames[,-c(5)])


summary(ResumeNames[,c(1,2,3,4,6,7)])

# Output as Tex table file
out_xtable <- xtable(summary(ResumeNames[,c(1,2,3,4,6,7)]),
                     digits = 2, label = 'tab:summary1',
                     caption = 'Summary of Variables - 1')
tab_file_name <- sprintf('%s/summary1.tex', tab_dir)
cat(print(out_xtable), file = tab_file_name, append = FALSE)


summary(ResumeNames[,c(8,9,10,11,13,12)])

# Output as Tex table file
out_xtable <- xtable(summary(ResumeNames[,c(8,9,10,11,13,12)]),
                     digits = 2, label = 'tab:summary2',
                     caption = 'Summary of Variables - 2')
tab_file_name <- sprintf('%s/summary2.tex', tab_dir)
cat(print(out_xtable), file = tab_file_name, append = FALSE)


summary(ResumeNames[,c(14,15,16,17,18)])

# Output as Tex table file
out_xtable <- xtable(summary(ResumeNames[,c(14,15,16,17,18)]),
                     digits = 2, label = 'tab:summary3',
                     caption = 'Summary of Variables - 3')
tab_file_name <- sprintf('%s/summary3.tex', tab_dir)
cat(print(out_xtable), file = tab_file_name, append = FALSE)




install.packages("wesanderson", repos = "http://cran.us.r-project.org")
library(wesanderson)

# Histogram of 'Caucasian' Names
barplot(table(cauc_names$name),col = wes_palette("IsleofDogs2",type = "continuous") ,main = "Histogram of Caucasian Names",horiz = T,las=1)

# Saving in Figures folder
fig_file_name = 'Histogram - Names, Caucasian.eps'
out_file_name = sprintf('%s/%s', fig_dir, fig_file_name)
setEPS()
postscript(out_file_name)
barplot(table(cauc_names$name),col = wes_palette("IsleofDogs2",type = "continuous") ,main = "Histogram of Caucasian Names",horiz = T,las=1)
dev.off()


# Histogram of 'African American' Names
barplot(table(afam_names$name),col = wes_palette("IsleofDogs2",type = "continuous") ,main = "Histogram of African American Names",horiz = T,las=1)

# Saving in Figures folder
fig_file_name = 'Histogram - Names, African American.eps'
out_file_name = sprintf('%s/%s', fig_dir, fig_file_name)
setEPS()
postscript(out_file_name)
barplot(table(afam_names$name),col = wes_palette("IsleofDogs2",type = "continuous") ,main = "Histogram of African American Names",horiz = T,las=1)
dev.off()


# Histogram of 'Male' Names
male_names = ResumeNames[c(ResumeNames$gender=="male"),]
barplot(table(male_names$name),col = wes_palette("Darjeeling1",type = "continuous") ,main = "Histogram of Male Names",horiz = T,las=1)

# Saving in Figures folder
fig_file_name = 'Histogram - Names, Male.eps'
out_file_name = sprintf('%s/%s', fig_dir, fig_file_name)
setEPS()
postscript(out_file_name)
barplot(table(male_names$name),col = wes_palette("Darjeeling1",type = "continuous") ,main = "Histogram of Male Names",horiz = T,las=1)
dev.off()


# Histogram of 'Female' Names
female_names = ResumeNames[c(ResumeNames$gender=="female"),]
barplot(table(female_names$name),col = wes_palette("GrandBudapest2",type = "continuous") ,main = "Histogram of Female Names",horiz = T,las=1)

# Saving in Figures folder
fig_file_name = 'Histogram - Names, Female.eps'
out_file_name = sprintf('%s/%s', fig_dir, fig_file_name)
setEPS()
postscript(out_file_name)
barplot(table(female_names$name),col = wes_palette("GrandBudapest2",type = "continuous") ,main = "Histogram of Female Names",horiz = T,las=1)
dev.off()


# Looking at a sample of resumes with a single person's name, one can see that
# no two resumes contain the same criteria. All 4870 resumes are completely randomized.

sampledata = ResumeNames[c(ResumeNames$name=="Tanisha"),]

# Output as Tex table file
out_xtable <- xtable(ResumeNames[c(ResumeNames$name=="Tanisha"),],
                     digits = 2, label = 'tab:SampleData',
                     caption = 'Resumes under one name are randomized')
tab_file_name <- sprintf('%s/SampleData.tex', tab_dir)
cat(print(out_xtable), file = tab_file_name, append = FALSE)




##################################################
# Estimate logistic regression model
##################################################


log_model <- glm(data = ResumeNames,
                     formula = name ~ gender + ethnicity + quality + city +
                       jobs + experience + holes + computer + college + minimum + 
                       equal + wanted + reqexp + reqeduc + reqcomp + industry,
                     family = 'binomial')

# Output the results to screen.
summary(log_model)

# Output as Tex table file
out_xtable <- xtable(summary(log_model),
                     digits = 2, label = 'tab:Model_Summary',
                     caption = 'Logistic Regression Model Summary')
tab_file_name <- sprintf('%s/Model_Summary.tex', tab_dir)
cat(print(out_xtable), file = tab_file_name, append = FALSE)


# Creating script of analysis and comments on the model results
text_file_name <- 'Regression_Analysis.tex'
out_file_name <- sprintf('%s/%s', text_dir, text_file_name)
# Start a new file with append = FALSE.
cat('\n%% Logistic Regression Model Analysis:\n\n',
    file = out_file_name, append = FALSE)

# Append new lines of text with append = TRUE.
cat('\n\nBased on the p values of the model, ethnicity or gender had no significance in determining \n',
    file = out_file_name, append = TRUE)
cat('(the likelihood of receiving a call back from the employers. The most significant independent \n',
    file = out_file_name, append = TRUE)
cat('(variables were the city (primarily if the city was Chicago), the years of experience listed on \n',
    file = out_file_name, append = TRUE)
cat('(resume, and if the employer wanted to fill an office support position.\n',
    file = out_file_name, append = TRUE)
cat('( \n',
    file = out_file_name, append = TRUE)

# Creating script of analysis and comments on the model results
text_file_name <- 'Explanation_of_Variables.tex'
out_file_name <- sprintf('%s/%s', text_dir, text_file_name)
# Start a new file with append = FALSE.
cat('\n%% Explanations and Definitions of Variables:\n\n',
    file = out_file_name, append = FALSE)

# Append new lines of text with append = TRUE.
cat('\n\nName, gender, ethnicity, city, and industry are self-explanatory so I will not list those definitions.\n',
    file = out_file_name, append = TRUE)
cat('(quality = quality of resume \n',
    file = out_file_name, append = TRUE)
cat('(jobs = number of jobs listed on resume), the years of experience listed on \n',
    file = out_file_name, append = TRUE)
cat('(experience = number of years of work experience\n',
    file = out_file_name, append = TRUE)
cat('(holes = does resume have some employment holes?\n',
    file = out_file_name, append = TRUE)
cat('(computer = does resume mention some computer skills?\n',
    file = out_file_name, append = TRUE)
cat('(college = does applicant have a college degree or more?\n',
    file = out_file_name, append = TRUE)
cat('(minimum = minimum experience requirement of employer\n',
    file = out_file_name, append = TRUE)
cat('(equal = is the employer EOE (Equal Opportunity Employment)?\n',
    file = out_file_name, append = TRUE)
cat('(wanted = type of position desired by employer\n',
    file = out_file_name, append = TRUE)
cat('(reqexp = does ad mention some experience requirement?\n',
    file = out_file_name, append = TRUE)
cat('(reqeduc = does ad mention some educational requirement?\n',
    file = out_file_name, append = TRUE)
cat('(reqcomp = does ad mention some computer skills requirement?\n',
    file = out_file_name, append = TRUE)
cat('( \n',
    file = out_file_name, append = TRUE)

##################################################
# End
##################################################