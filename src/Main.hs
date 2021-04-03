module Main
  ( main
  ) where

import           Numeric.Natural (Natural)
import           System.IO       (hFlush, stdout)
import           Text.Read       (readMaybe)

import           Guess           (guess)

main :: IO ()
main = do
  a <- promptUser 1
  b <- promptUser (a + 1)
  let result = guess b (a + 1)
  putStrLn $ showPolynomial result

promptUser :: Natural -> IO Natural
promptUser x = do
  putStr ("What is the value of your polynomial for x = " <> show x <> "? ")
  input <- hFlush stdout >> getLine
  case readMaybe input of
    Just n  -> return n
    Nothing -> promptUser x

showPolynomial :: [Natural] -> String
showPolynomial = show
