{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use camelCase" #-}
module Main where

is_empty :: [a] -> Bool
is_empty [] = True
is_empty a = False



main = do
    --putStrLn ""
    print $ is_empty [] 
    print $ is_empty [1,2,3]
    print $ is_empty [-1,-2,-3]