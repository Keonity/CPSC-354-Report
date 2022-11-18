{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use camelCase" #-}
module Main where
import Prelude hiding (reverse, even, length)

is_empty :: [a] -> Bool
is_empty [] = True
is_empty a = False

fib :: Integer -> Integer
fib a =
    if a <= 0 then 0
    else if a == 0 then 0
    else if a == 1 then 1
    else fib(a-1) + fib(a-2)

length :: [a] -> Integer
length [] = 0
length a = 1 + length(tail a)

even :: [a] -> Bool
even [] = False
even a = 
    if mod (length(a)) (2) == 0 then True
    else False

reverse :: [a] -> [a]
reverse [] = []
reverse (x:xs) = (reverse (xs)) ++ [x]

weave :: [Integer] -> [Integer] -> [Integer]
weave [] [] = []
weave (x:xs) [] = [x] ++ weave(xs) []
weave [] (y:ys) = [y] ++ weave[] (ys) 
weave (x:xs) (y:ys) = 
    if (x < y) then [x] ++ weave(xs) (y:ys)
    else [y] ++ weave(x:xs) (ys)

main = do
    --putStrLn ""
    print $ is_empty [] 
    print $ is_empty [1,2,3]
    print $ is_empty [-1,-2,-3]
    print $ fib 14
    print $ length [1,2,3]
    print $ even [1,2,3]
    print $ even [1,2,3,4]
    print $ reverse [1,2,3,4]
    print $ weave [0,1,4] [2,3,5]