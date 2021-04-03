module Guess
  ( guess
  ) where

import           Numeric.Natural (Natural)

guess :: Natural -> Natural -> [Natural]
guess 0 n = []
guess y n =
  let coeff = y `mod` n
   in coeff : guess ((y - coeff) `div` n) n
