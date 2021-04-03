module Main
  ( main
  ) where

import           Guess
import           IO

main :: IO ()
main = do
  a <- promptUser 1
  b <- promptUser (a + 1)
  let result = guess b (a + 1)
  putStrLn "Your polynomial is:"
  putStr $ showPolynomial result
