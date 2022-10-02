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
  deriving Show -- for printing

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

pp_nn :: NN -> PP
pp_nn (S O) = I
pp_nn (S n) = T (pp_nn(n))

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
divN m I = m 
divN (S O) m = S O
divN (S m) (T n)
  | (int_nn(S m) < int_pp(T n)) = S m
  | otherwise = divN(subN(m) (n)) (T n)
-- divN 7 4 = divN (subN 7 4) 4
-- divN (subN 7 4) 4 = divN (subN 6 3) 3
-- divN (subN 6 3) 3 = divN (subN 5 2) 2
-- divN (subN 5 2) 2 = divN (subN 4 1) 1
-- divN (subN 4 1) 1 = subN 4 1
-- subN 4 1 = 3

-- divN 3 4 = divN (subN 3 4) 4
-- divN (subN 3 4) 4 = divN (subN 2 3) 4
-- divN (subN 2 3) 4 = divN (subN 1 2) 4
-- divN (subN 1 2) 4 = divN (subN 0 1) 4
-- divN (subN 0 1) 4 = divN 0 4 = 0

-- How to prevent divN from making (S n) go to zero?
-- How to prevent divN the left side of the equation from reaching zero?

modN :: NN -> PP -> NN
modN O I = O
modN O (T m) = O
modN (S m) I = O
modN (S m) (T n) = subN(nn_pp(T n)) (pp_nn(divN(S m) (T n)))
----------------
-- II Arithmetic
----------------

-- (a-b)+(c-d)=(a+c)-(b+d)
addI :: II -> II -> II
addI (II O O) (II O O) = II O O
addI (II (S m) O) (II O O) = II (S m) O
addI (II O (S m)) (II O O) = II (O) (S m)
addI (II O O) (II (S m) O) = II (addN (S m) O) O
addI (II O O) (II O (S m)) = II O (S m)
addI (II (S m) (S n)) (II O O) = II (S m) (S n)
addI (II (S m) O) (II (S n) O) = II (addN (S m) (S n)) O
addI (II (S m) O) (II O (S n)) = II (S m) (S n)
addI (II O (S m)) (II (S n) O) = II (S n) (S m)
addI (II O O) (II (S m) (S n)) = II (S n) (S m)
addI (II O (S m)) (II O (S n)) = II O (addN (S m) (S n))
addI (II (S m) (S n)) (II (S p) O) = II (addN(S m) (S p)) (S n)
addI (II (S m) (S n)) (II O (S p)) = II (S m) (addN(S n) (S p))
addI (II (S m) O) (II (S n) (S p)) = II (addN (S m) (S n)) (S p)
addI (II O (S m)) (II (S n) (S p)) = II (S n) (addN(S m) (S p))
addI (II (S m) (S n)) (II (S p) (S q)) = II (addN(S m) (S p)) (addN(S n) (S q))

-- Multiplication: (a-b)*(c-d)=(ac+bd)-(ad+bc)
multI :: II -> II -> II
multI (II O O) (II O O) = II O O
multI (II (S m) O) (II O O) = II O O
multI (II (S m) (S n)) (II O O) = II O O
multI (II (S m) O) (II (S n) O) = II (multN(S m) (S n)) O
multI (II (S m) O) (II O (S n)) = II O (multN(S m) (S n))
multI (II O (S m)) (II O O) = II O O
multI (II (S m) (S n)) (II O O) = II O O
multI (II O (S m)) (II (S n) O) = II O (multN (S m) (S n))
multI (II O (S m)) (II O (S n)) = II (multN (S m) (S n)) O
multI (II O O) (II (S n) O) = II O O
multI (II O O) (II (S n) (S m)) = II O O
multI (II O O) (II O (S n)) = II O O
multI (II (S m) (S n)) (II (S p) O) = II (multN(S m) (S p)) (multN(S n) (S p))
multI (II (S m) (S n)) (II O (S p)) = II (multN(S n) (S p)) (multN(S m) (S p))
multI (II (S m) O) (II (S n) (S p)) = II (multN(S m) (S n)) (multN(S m) (S p))
multI (II O (S m)) (II (S n) (S p)) = II (multN (S m) (S p)) (multN (S m) (S n))
multI (II (S m) (S n)) (II (S p) (S q)) = II (addN(multN(S m) (S p)) (multN(S n) (S q))) (addN(multN(S n) (S p)) (multN(S m) (S q)))

-- Negation: -(a-b)=(b-a)
negI :: II -> II
negI (II O O) = II O O
negI (II (S n) O) = II O (S n)
negI (II O (S n)) = II (S n) O
negI (II (S n) (S m)) = II (S m) (S n)

-- Equality of Integers
instance Eq II where
  (II a b) == (II c d) = int_ii(II a b) == int_ii(II c d)

----------------
-- QQ Arithmetic
----------------

-- Addition: (a/b)+(c/d)=(ad+bc)/(bd)
addQ :: QQ -> QQ -> QQ
addQ (QQ (II O O) I) (QQ (II O O) I) = QQ (II O O) I
addQ (QQ (II O O) (T I)) (QQ (II O O) (T I)) = QQ (II O O) (T I)
addQ (QQ (II (S O) O) I) (QQ (II O O) I) = QQ (II O O) I
addQ (QQ n m) (QQ p q) = QQ (addI(multI(n) (ii_pp(q))) (multI(p) (ii_pp(m)))) (multP(m) (q))

-- Multiplication: (a/b)*(c/d)=(ac)/(bd)
multQ :: QQ -> QQ -> QQ
multQ (QQ (II O O) I) (QQ (II O O) I) = QQ (II O O) I
multQ (QQ (II O O) (T I)) (QQ (II O O) (T I)) = QQ (II O O) (T I)
multQ (QQ n m) (QQ p q) = (QQ (multI n p) (multP m q))

-- Equality of Fractions
instance Eq QQ where
  (QQ a b) == (QQ c d) = float_qq(QQ a b) == float_qq(QQ c d)

----------------
-- Normalisation
----------------

normalizeI :: II -> II
normalizeI (II O O) = II O O
normalizeI (II n O) = (II n O)
normalizeI (II O n) = (II O n)
normalizeI (II (S n) (S m)) = normalizeI (II n m)

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

ii_int :: Integer -> II
ii_int (-1) = II O (S O)
ii_int 1 = II (S O) O
ii_int 0 = II O O
ii_int x = II (S (nn_int(x-1))) O

int_ii :: II -> Integer
int_ii (II (O) (S O)) = -1
int_ii (II O O) = 0
int_ii (II (S n) O) = 1 + int_ii(II n O)
int_ii (II (S n) (S m)) = int_ii(II (n) (m))

-- POSITIVE NUMBERS

pp_int :: Integer -> PP
pp_int 1 = I
pp_int 2 = (T I)
pp_int x = T (pp_int (x-1))

int_pp :: PP -> Integer
int_pp I = 1
int_pp (T I) = 2
int_pp (T n) = 1 + int_pp(n)

float_qq :: QQ -> Float
float_qq (QQ (II (O) (O)) I) = 0.0
float_qq (QQ n m) = (fromIntegral (int_ii(n)))/(fromIntegral (int_pp(m)))

----------------
-- Normalisation by evaluation
----------------

nbe :: II -> II
nbe n = ii_int(int_ii(n))

----------
-- Testing
----------
main = do
    print "NN Addition"
    print $ addN (S (S O)) (S O) -- S (S (S O))

    print "NN Multiplication"
    print $ multN (S (S O)) (S (S (S O))) -- S (S (S (S (S (S O)))))

    print "PP Addition"
    print $ addP (T (T I)) (T I) -- T (T (T (T I))))
    
    print "PP Multiplication"
    print $ multP (T (T I)) (T I) -- T (T (T (T (T I))))
    
    print "PP to NN"
    print $ nn_pp (T I) -- S (S O)

    print "PP to II"
    print $ ii_pp (T I) -- II (S (S O)) O
    
    print "Natural Number Division"
    print $ divN (S (S (S (S (S O))))) (T (T (T I))) -- (S O)

    print "Natural Number Modulo"
    print $ divN (S (S (S (S (S O))))) (T (T I)) -- S (S O)

    print "NN to Integers"
    print $ nn_int 3 -- (S (S (S O)))

    print "Integers to NN"
    print $ int_nn (S (S (S O))) -- 3

    print "PP to Integers"
    print $ pp_int 3 -- (T (T I))

    print "Integers to PP"
    print $ int_pp (T (T I)) -- 3

    print "Integer Addition"
    print $ addI (II (S O) (S (S O))) (II (S (S (S O))) (S (S (S (S O))))) -- II (S (S (S (S O)))) (S (S (S (S (S (S O))))))

    print "Integer Multiplication"
    print $ multI (II (S O) (S (S O))) (II (S O) (S (S O))) -- II (S (S (S (S (S O))))) (S (S (S (S O))))
    
    print "Integer Negation"
    print $ negI (II (S (S O)) (O)) -- $ II (O) (S (S O))

    print "Integer Equality"
    print $ (II (S (S O)) O) == (II (S (S (S (S O)))) (S (S O))) -- True

    print "Fraction Addition"
    print $ addQ (QQ (II (S (S O)) O) (I)) (QQ (II (S (S O)) O) (I)) -- QQ (II (S (S (S (S O)))) I) 

    print "Fraction Multiplication"
    print $ multQ (QQ (II (S (S (S O))) O) (I)) (QQ (II (S (S O)) O) (I)) -- QQ (II (S (S (S (S (S (S O) O))))))

    print "Fraction Equality"
    print $ (QQ (II (S (S (S O))) O) (I)) == (QQ (II (S (S (S (S (S (S O)))))) O) (T I)) -- True

    print "II Normalization"
    print $ normalizeI (II (S (S O)) (S O)) -- II (S O) O

    print "Integer to NN"
    print $ nn_int(3) -- (S (S (S O)))

    print "NN to Integer"
    print $ int_nn(S (S (S O))) -- 3

    print "Integer to II"
    print $ ii_int(3) -- (II (S (S (S O))) O)

    print "II to Integer"
    print $ int_ii(II (S (S (S O))) (S (S O))) -- 1

    print "Integer to PP"
    print $ pp_int(3) -- (T (T I))

    print "PP to Integer"
    print $ int_pp(T (T I)) -- 3

    print "QQ to Float"
    print $ float_qq(QQ (II (S (S O)) O) (T I)) -- 1/1

    print "II Normalization by Evaluation"
    print $ nbe (II (S (S O)) (S O)) -- II (S O) O
