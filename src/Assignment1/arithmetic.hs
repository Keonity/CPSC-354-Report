-- A Virtual Machine (VM) for Arithmetic (template)
-- Copyright: Alexander Kurz 2022

-----------------------
-- Data types of the VM
-----------------------

-- Natural numbers
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
multP I (T m) = addP (multP I m) (m)
multP (T m) I = addP (multP I m) (m)
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

----------------
-- II Arithmetic
----------------


----------------
-- QQ Arithmetic
----------------


----------------
-- Normalisation
----------------


----------------------------------------------------
-- Converting between VM-numbers and Haskell-numbers
----------------------------------------------------


----------
-- Testing
----------
main = do
    print $ addN (S (S O)) (S O) -- S (S (S O))
    print $ multN (S (S O)) (S (S (S O))) -- S (S (S (S (S (S O)))))
    print $ addP (I) (I) -- (T I)
    print $ addP (T I) (I) -- T (T I)
    print $ addP (I) (T I) -- T (T I)
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