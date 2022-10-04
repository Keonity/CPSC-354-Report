module Interpreter where

import AbsNumbers
    ( Exp(..) )

eval :: Exp -> Integer
eval (Num n) = n
eval (Plus n m) = (eval n) + (eval m)
eval (Minus n m) = (eval n) - (eval m)
eval (Times n m) = (eval n) * (eval m)
eval (IntDivision n m) = div (eval n) (eval m) 
eval (Modulus n m) = mod (eval n) (eval m)
eval (Negative n) = -(eval n)
eval (Exponent n m) = (eval n) ^ (eval m)
eval (Paranth n) = (eval n)

main = do
    print "Num"
    print $ eval(Num 1)

    print "Plus"
    print $ eval(Plus (Num 2) (Num 3))

    print "Minus"
    print $ eval(Minus (Num 2) (Num 3))

    print "Times"
    print $ eval(Times (Num 2) (Num 3))

    print "Integer Division"
    print $ eval(IntDivision (Num 2) (Num 3))    

    print "Modulus"
    print $ eval(Modulus (Num 2) (Num 3)) 

    print "Negative"
    print $ eval(Negative (Num 1))

    print "Exponent"
    print $ eval(Exponent (Num 2) (Num 3))    

    print "Parantheses"
    print $ eval(Plus (Num 1) (Paranth (Plus(Num 2) (Num 3))))

    print "Instructor-Given Test Cases"
    print $ eval(Plus (Paranth (Exponent (Num 2) (Num 3))) (Num 4))

    print "Instructor-Given Test Cases"
    print $ eval(IntDivision (Paranth (Exponent (Num 2) (Num 3))) (Paranth (Exponent (Num 4) (Num 5))))