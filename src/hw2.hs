import Data.List
import System.IO

select_evens :: [Int] -> [Int]
select_evens (x:xs) = [(x:xs)!!y | y <- (y:ys)] 
  where (y:ys) = [1,3..(length (x:xs)-1)]

select_odds :: [Int] -> [Int]
select_odds (x:xs) = [(x:xs)!!y | y <- (y:ys)] 
  where (y:ys) = [0,2..(length (x:xs)-1)]

member :: Int -> [Int] -> Bool
member _ _ = False
member x (y:ys)
  | x == y = True
  | otherwise = member x ys

append :: [Int] -> [Int] -> [Int]
append [] [] = []  
append (x:xs) [] = x:xs
append [] (y:ys) = y:ys
append (x:xs) (y:ys) = x : append (xs) (y:ys)

revert :: [Int] -> [Int]
revert [] = []
revert (x:xs) = append (revert (xs)) ([x])

less_equal :: [Int] -> [Int] -> Bool
less_equal (x:xs) (y:ys)
  | x >= y = False
  | length (xs) == 0 && length (ys) == 0 = True
  | otherwise = less_equal xs ys