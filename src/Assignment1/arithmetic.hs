-- A Virtual Machine (VM) for Arithmetic (template)
-- Copyright: Alexander Kurz 2022

-----------------------
-- Data types of the VM
-----------------------

-- Natural numbers
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use camelCase" #-}
{-# OPTIONS_GHC -Wno-overlapping-patterns #-}
{-# HLINT ignore "Redundant bracket" #-}
data NN = O | S NN
  deriving (Eq,Show) -- for equality and printing

-- Integers
data II = II NN NN
  deriving Show -- for printing

-- Positive integers (to avoid dividing by 0)
data PP = I | T PP
  deriving Show -- for printing

-- Rational numbers
data QQ =  QQ II PP

------------------------
-- Arithmetic on the  VM
------------------------

----------------
-- PP Arithmetic
----------------

addP :: PP -> PP -> PP
addP I I = T I
addP I (T m) = T (addP m I)
addP (T m) I = T (addP m I)
addP (T m) (T n) = T (T (addP m n))

multP :: PP -> PP -> PP
multP I I = I
multP I (T m) = addP (multP I m) m
multP (T m) I = addP (multP I m) m
multP (T m) (T n) = T (T (multP m (T n)))

nn_pp :: PP -> NN
nn_pp I = S O
nn_pp (T m) = S (nn_pp m)

ii_pp :: PP -> II
ii_pp I = II (S O) O
ii_pp (T m) = II (S (nn_pp m)) O 
----------------
-- NN Arithmetic
----------------

-- add natural numbers
addN :: NN -> NN -> NN
addN O m = m
addN (S n) m = S (addN n m)

-- multiply natural numbers
multN :: NN -> NN -> NN
multN O m = O
multN (S n) m = addN (multN n m) m

subN :: NN -> PP -> NN
subN O m = O
subN (S m) I = m
subN (S m) (T n) = subN m n
-- subN 7 4 = subN 6 3
-- subN 6 3 = subN 5 2
-- subN 5 2 = subN 4 1
-- subN 4 1 = 3

divN :: NN -> PP -> NN
divN O m = O
divN (S m) I = S m
divN (S O) m = S O
divN (S m) (T n) = divN (subN (S m) (T n)) (T n)
-- divN 7 4 = divN (subN 7 4) 4
-- divN (subN 7 4) 4 = divN (subN 6 3) 3
-- divN (subN 6 3) 3 = divN (subN 5 2) 2
-- divN (subN 5 2) 2 = divN (subN 4 1) 1
-- divN (subN 4 1) 1 = subN 4 1
-- subN 4 1 = 3

-- divN 3 4 = divN (subN 3 4) 4
-- divN (subN 3 4) 4 = divN (subN 2 3) 4
-- divN (subN 2 3) 4 = divN (subN 1 2) 4
-- divN (subN 1 2) 4 = divN (subN 0 2) 4
-- divN (subN 0 2) 4 = divN 0 4 = 0

-- How to prevent divN from making (S n) go to zero?
-- How to prevent divN the left side of the equation from reaching zero?

----------------
-- II Arithmetic
----------------

-- (a-b)+(c-d)=(a+c)-(b+d)
addI :: II -> II -> II
addI (II O O) (II O O) = II O O
addI (II (S m) O) (II O O) = II (S m) O
addI (II (S m) O) (II (S n) O) = II (addN (S m) (S n)) O
addI (II (S m) O) (II O (S n)) = II (S m) (S n)
addI (II (S m) O) (II (S n) (S p)) = II (addN (S m) (S n)) (S p)
addI (II O (S m)) (II O O) = II (O) (S m)
addI (II (S m) (S n)) (II O O) = II (S m) (S n)
addI (II O (S m)) (II (S n) O) = II (S n) (S m)
addI (II O (S m)) (II (S n) (S p)) = II (S n) (addN(S m) (S p))
addI (II O O) (II (S m) O) = II (addN (S m) O) O
addI (II O O) (II (S m) (S n)) = II (S n) (S m)
addI (II O O) (II O (S m)) = II O (S m)
addI (II O (S m)) (II O (S n)) = II O (addN (S m) (S n))
addI (II (S m) (S n)) (II (S p) (S q)) = II (addN(S m) (S p)) (addN(S n) (S q))
addI (II _ _) (II _ _) = II O O

----------------
-- QQ Arithmetic
----------------


----------------
-- Normalisation
----------------


----------------------------------------------------
-- Converting between VM-numbers and Haskell-numbers
----------------------------------------------------

nn_int :: Integer -> NN
nn_int 0 = O
nn_int 1 = S O
nn_int x = S (nn_int (x-1))

int_nn :: NN -> Integer
int_nn O = 0
int_nn (S O) = 1
int_nn (S n) = 1 + int_nn(n)

-- INTEGERS & CUSTOM INTEGERS
{-
ii_int :: Integer -> II
ii_int 1 = II O (S O)
ii_int 0 = II O O
ii_int x = II (S (ii_int (x-1))) O

int_ii :: II -> II -> Integer
int_ii II O (S O) = -1
int_ii II O O = 0
int_ii II n m = O */
-}

-- POSITIVE NUMBERS

pp_int :: Integer -> PP
pp_int 1 = I
pp_int 2 = (T I)
pp_int x = T (pp_int (x-1))

int_pp :: PP -> Integer
int_pp I = 1
int_pp (T I) = 2
int_pp (T n) = 1 + int_pp(n)

----------------
-- Normalisation by evaluation
----------------
{-
nbe :: II -> II
nbe n = ii_int(int_ii(n))
-}

----------
-- Testing
----------
main = do
    print $ addN (S (S O)) (S O) -- S (S (S O))
    print $ multN (S (S O)) (S (S (S O))) -- S (S (S (S (S (S O)))))

    print $ addP I I -- (T I)
    print $ addP (T I) I -- T (T I)
    print $ addP I (T I) -- T (T I)
    print $ addP (T (T I)) (T I) -- T (T (T (T I))))
    
    print $ multP I I -- I
    print $ multP I (T I) -- (T I)
    print $ multP (T I) I -- (T I)
    print $ multP (T I) (T I) -- T (T (T I))
    print $ multP (T (T I)) (T I) -- T (T (T (T (T I))))
    print $ multP (T I) (T (T I)) -- T (T (T (T (T I))))
    
    print $ nn_pp I -- S (O)
    print $ nn_pp (T I) -- S (S O)
    
    print $ ii_pp I -- II (S O) O
    print $ ii_pp (T I) -- II (S (S O)) O
    
    print $ subN (S (S O)) I -- S O
    print $ subN (S (S O)) (T I) -- O
    print $ subN (S (S (S (S (S O))))) (T (T I)) -- S (S O)
    print $ subN (S (S (S (S (S (S (S O))))))) (T (T (T I))) -- S (S (S O))
    

    print "Incorrect divN tests"
    print $ divN (S (S (S (S (S (S (S O))))))) (T (T (T I))) -- S (S (S O))
    print $ divN (S (S (S O))) (T (T (T I))) -- S (S (S O))
    print $ divN (S (S O)) (T (T I)) -- S (S O)
    print "Correct divN tests"
    print $ divN (S (S O)) I -- S (S O)
    print $ divN (S (S (S (S (S O))))) (T (T (T I))) -- (S O)
    print $ divN (S O) (T (T (T I))) -- S O
    print $ divN (S O) I -- S O

    print "NN to Integers"
    print $ nn_int 3 -- (S (S (S O)))
    print "Integers to NN"
    print $ int_nn (S (S (S O))) -- 3
    print "PP to Integers"
    print $ pp_int 3 -- (T (T I))
    print "Integers to PP"
    print $ int_pp (T (T I)) -- 3

    print "Integer Addition"
    print $ addI (II O O) (II (S (S O)) O) -- II (S (S O)) O
    print $ addI (II O O) (II O (S (S O))) -- II O (S (S O))
    print $ addI (II O O) (II (S O) (S (S O))) -- II (S O) (S (S O))
    print $ addI (II (S O) (S (S O))) (II (S (S (S O))) (S (S (S (S O))))) -- II (S (S (S (S O)))) (S (S (S (S (S (S O))))))
    
    