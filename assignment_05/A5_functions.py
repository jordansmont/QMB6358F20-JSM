#!/usr/bin/python
"""
##################################################
#
# QMB 6358: Software Tools for Business Analytics
#
# Sample script for Assignment 5
#
# Name: Jordan Montgomery
# College of Business Administration
# University of Central Florida
#
# Date: 10/18/2020
#
#
##################################################
"""




##################################################
# Import Modules.
##################################################

# These are common modules that are often useful.
# import numpy as np
import math


##################################################
# Question 1
##################################################


#--------------------------------------------------
# Example 1
#--------------------------------------------------

def letter_grade(num):
    if num >=93:
        return('A')
    if num <93 and num >=90:
        return('A-')
    if num <90 and num >=87:
        return('B+')
    if num <87 and num >=83:
        return('B')
    if num <83 and num >=80:
        return('B-')
    if num <80 and num >=77:
        return('C+')
    if num <77 and num >=73:
        return('C')
    if num <73 and num >=70:
        return('C-')
    if num <70 and num >=67:
        return('D+')
    if num <67 and num >=63:
        return('D')
    if num <63 and num >=60:
        return('D-')
    if num <60:
        return('F')


#--------------------------------------------------
# Example 2
#--------------------------------------------------

def path_to_data_file(path,prefix,file_num,extension):
    return(path + prefix + "_" + file_num + "." + extension)
 

#--------------------------------------------------
# Example 3
#--------------------------------------------------

def cyl_vol(height,radius):
    import math
    pi = math.pi 
    return(height*pi*radius*radius)


#--------------------------------------------------
# Example 4
#--------------------------------------------------

def number_of_vowels(string_in):
    count = 0
    for i in string_in:
        if i == 'a':
            count = count + 1
        if i == 'A':
            count = count + 1
        if i == 'e':
            count = count + 1
        if i == 'E':
            count = count + 1
        if i == 'i':
            count = count + 1
        if i == 'I':
            count = count + 1
        if i == 'o':
            count = count + 1
        if i == 'O':
            count = count + 1
        if i == 'u':
            count = count + 1
        if i == 'U':
            count = count + 1
    return(count)


##################################################
# Question 2
##################################################


def main():

    
    #--------------------------------------------------
    # Example 1
    #--------------------------------------------------

    print(letter_grade(-5))
    print(letter_grade(5))
    print(letter_grade(85.9))
    print(letter_grade(105))
        
    #--------------------------------------------------
    # Example 2
    #--------------------------------------------------
    
    print(path_to_data_file('~/QMB6358F20/QMB6358F20_iris/','iris','1','txt'))
    print(path_to_data_file('~/UCF/QMB6358','test_doc','7','csv'))
    print(path_to_data_file('~/Documents/Career/','Resume','v3','doc'))
    print(path_to_data_file('~/STA5735/datasets/','populations_of_the_world','','xlsx'))

        
        
    #--------------------------------------------------
    # Example 3
    #--------------------------------------------------
    
    
    print(cyl_vol(10,3))
    print(cyl_vol(0,3))
    print(cyl_vol(10,3.5))
    print(cyl_vol((1/math.pi),4))
    
    #--------------------------------------------------
    # Example 4
    #--------------------------------------------------
    
    print(number_of_vowels('test'))
    print(number_of_vowels('teat'))
    print(number_of_vowels('teAchEr'))
    print(number_of_vowels('I am an excellent coder'))
    
    
if __name__== '__main__':
    main()
  
  
  
##################################################
# End.
##################################################
