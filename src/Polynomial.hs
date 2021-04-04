module Polynomial
  ( Polynomial(..)
  ) where

import           Numeric.Natural                   (Natural)
import           Test.QuickCheck                   (Arbitrary (..), listOf)
import           Test.QuickCheck.Instances.Natural ()

newtype Polynomial =
  Polynomial
    { coefficients :: [Natural]
    }
  deriving (Eq, Show)

instance Arbitrary Polynomial where
  arbitrary = Polynomial . takeWhile (/= 0) <$> listOf arbitrary
  shrink (coefficients -> cs) = Polynomial <$> shrink cs
