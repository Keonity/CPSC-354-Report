-- File generated by the BNF Converter (bnfc 2.9.4).

{-# LANGUAGE GeneralizedNewtypeDeriving #-}

-- | The abstract syntax of language hw5.

module AbsHw where

import Prelude (String)
import qualified Prelude as C (Eq, Ord, Show, Read)
import qualified Data.String

data Exp = EAbs Ident Exp | EApp Exp Exp | EVar Ident
  deriving (C.Eq, C.Ord, C.Show, C.Read)

newtype Ident = Ident String
  deriving (C.Eq, C.Ord, C.Show, C.Read, Data.String.IsString)

