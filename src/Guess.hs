module Guess
  ( guess
  ) where

import           Numeric.Natural (Natural)

import           Polynomial      (Polynomial (Polynomial))

guess :: Natural -> Natural -> Polynomial
guess y n = Polynomial $ guess' y n

guess' :: Natural -> Natural -> [Natural]
guess' 0 n = []
guess' y n =
  let coeff = y `mod` n
   in coeff : guess' ((y - coeff) `div` n) n
