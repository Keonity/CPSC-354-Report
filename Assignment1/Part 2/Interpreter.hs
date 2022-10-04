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
    print $ eval(Plus (Num 2) (Num 3))