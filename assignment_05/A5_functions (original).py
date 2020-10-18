# -*- coding: utf-8 -*-
"""
Created on Fri Oct 16 02:46:13 2020

@author: Jordan
"""
###############################
# Question 1
def letter_grade(num):
    if num >=93:
        print('A')
    if num <93 and num >=90:
        print('A-')
    if num <90 and num >=87:
        print('B+')
    if num <87 and num >=83:
        print('B')
    if num <83 and num >=80:
        print('B-')
    if num <80 and num >=77:
        print('C+')
    if num <77 and num >=73:
        print('C')
    if num <73 and num >=70:
        print('C-')
    if num <70 and num >=67:
        print('D+')
    if num <67 and num >=63:
        print('D')
    if num <63 and num >=60:
        print('D-')
    if num <60:
        print('F')
        
        
letter_grade(5)
letter_grade(65)
letter_grade(75)
letter_grade(85)
letter_grade(95)
letter_grade(105)
letter_grade(-5)


###############################
# Question 2
def path_to_data_file(path,prefix,file_num,extension):
    print(path + prefix + "_" + file_num + "." + extension)
    

path_to_data_file('~/QMB6358F20/QMB6358F20_iris/','iris','1','txt')
path_to_data_file('~/UCF/QMB6358','test_doc','7','csv')
path_to_data_file('~/Documents/Career/','Resume','v3','doc')
path_to_data_file('~/STA5735/datasets/','populations_of_the_world','','xlsx')


###############################
# Question 3
def cyl_vol(height,radius):
    import math
    pi = math.pi 
    print(height*pi*radius*radius)
    
    
cyl_vol(10,3)
cyl_vol(0,3)
cyl_vol(10,3.5)
import math
cyl_vol((1/math.pi),4)


###############################
# Question 4
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
    print(count)
        

number_of_vowels('test')
# 1
number_of_vowels('teat')
# 2
number_of_vowels('teAchEr')
# 3
number_of_vowels('I am an excellent coder')
# 8