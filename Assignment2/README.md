### Name: Keoni Lanoza
### Student ID: 2344852
### Student Email: lanoza@chapman.edu
### Class: CPSC 354 - 02
### Date Of Submission: 11/17/22

I have currently accomplished what I believe are all parts of the assignment aside from implementing the reverse and weave functions in Lambda Calculus. I have struggled with this part of the assignment for various reasons, but most notable is the lack of a way to identify which data type a parameter is in Lambda Calculus functions, mostly unhelpful error messages, and difficulty in getting functions to stop looping on an empty list or to have them stop printing what seems to be "backend code". The latter issue seems to also present itself by yielding input code in the output of LambdaNat-exe. An example of this can be found below:

Input for the below output: 
`let rec weave = (\x. \y. if ((hd x) less_equal (hd y)) = 1 then (hd x):weave((tl x) (tl y)) else (hd y):f((tl x) (tl y))) in weave 0:1:4:# 2:3:5:#`

Wrong output for weave: `((fix \ weavexy0xy0y000y00000xy0y000y00000y0000000y000000000 . \ xy0y000y00000y0000000y000000000y00000000000 . \ y000000000000 . if (hd xy0y000y00000y0000000y000000000y00000000000) less_equal (hd y000000000000) = 1 then (hd xy0y000y00000y0000000y000000000y00000000000) : (weavexy0xy0y000y00000xy0y000y00000y0000000y000000000 ((tl xy0y000y00000y0000000y000000000y00000000000) (tl y000000000000))) else (hd y000000000000) : f ((tl xy0y000y00000y0000000y000000000y00000000000) (tl y000000000000))) ((tl 0 : 1 : 4 : #) (tl 2 : 3 : 5 : #)))`

I came up with the test cases in solutions.lc(some are commented so that the program will run if you test it, because multiple test cases of the same function cannot run alongside each other without cluttering the file) by trying to come up with at least one test case for every different kind of valid input the user is able to use with each function. This means for example, test cases I would have come up with for the is_empty function is testing the following input: 

`a:b:c:#` to see if it can work on a normal list
Simply `#` to see if it can work on an empty list

I would not have come up with a test case for #:c:b:a because that is not a list according to the definition of a list.

Through the work I've completed so far on this assignment, I've learned how to better manipulate evalCBN and subst, specifically through implementing other functions in our language in them. I feel I have also improved my handling of Lambda Calculus in general. I've additionally learned that it can be very hard to implement some basic functions in Lambda Calculus because of how stripped down Lambda Calculus is in what it offers as a language. This difference stood out especially in creating the solutions.hs file, because I was able to figure out how to implement reverse and weave in that file, but am still struggling to do so in the solutions.lc file.

## Answers to Discussion Questions