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

## Questions I Have
I am mostly interested in where I have gone wrong in implementing reverse and weave in Lambda Calculus. I have been trying what feels like just about everything under the sun in solving this problem, but getting wrong outputs while testing and sometimes not being able to understand what it means, specifically with it printing all of those weird variables and expressions, has made it difficult. I am also interested in learning more about EFix, because I believe that a better understanding of that could possibly lead me to my solution. Lastly, I would like to know the limits of our language so far. For example, it seems that through ERec being in the grammar, we have a way to create loops, but I want to know if it is missing some core functionality as I feel it is or if I am overlooking something in the grammar or interpreter.

## Answers to Discussion Questions

1. I believe that `#:#` doesn't parse because according to our grammar, we cannot have two nils form a list. However, `(#):#` is able to parse because the parantheses allow our interpreter to interpret `(#)` as a variable or id according to our grammar. I do not believe it makes sense to change the grammar unless we want to rule out the user's ability to use `(#)` as a variable or name. I think that programming languages that are minimal have strength in a shorter number of keywords and in turn, more freedom in name choice for users.

2. The following additions to LambdaNat.cf are what allowed multiple test cases in one file.

`Prog.      Program ::= [Exp] ;  `
`separator Exp ";;" ;`

These changes allow users to express a program in the grammar as a list of expressions separated by ;;. Additionally the execCBN function as shown below also allows for this same functionality in the interpreter.

`execCBN :: Program -> [Exp]`
`execCBN (Prog []) = []`
`execCBN (Prog (e:es)) = (evalCBN e):(execCBN (Prog es))`

3. We cannot implement the plus function in LambdaNat5 using `evalCBN (EPlus e1 e2) = (evalCBN e1) + (evalCBN e2)` because it could result in incorrect results if incompatible expressions are used as parameters, mainly EInts with non EInts. This is due to Lambda Calculus using call-by-name functionality, which is useful in this case because it ensures EInts added to EInts have the correct result.

4. Currently, the differences in LambdaNat5 and Haskell are huge. I found it much easier to program in Haskell than in LambdaNat5. Personally, I think we made good progress in implementing a functional programming language. It could be made more easily usable if we had an easier way to create loops, end loops/programs, and reference data types or types according to our grammar. I believe finding a way to implement these would go a long way in making our language more powerful.

5. I did notice this in the assignment specification. I was able to prove this in solutions.hs, because weaving unsorted lists with any other list gave an unsorted list. This is because the function only compares the heads of the two lists with each iteration of the function. On the other hand, weaving sorted lists together yielded a sorted list. According to our definition which compares the heads of both input lists, as long as the lists are sorted beforehand, the resulting list will also be sorted.