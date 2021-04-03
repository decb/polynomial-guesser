module IO
  ( promptUser
  , showPolynomial
  ) where

import           Data.List       (intercalate)
import           Numeric.Natural (Natural)
import           System.IO       (hFlush, stdout)
import           Text.Read       (readMaybe)

promptUser :: Natural -> IO Natural
promptUser x = do
  putStr ("What is the value of your polynomial for x = " <> show x <> "? ")
  input <- hFlush stdout >> getLine
  case readMaybe input of
    Just n  -> return n
    Nothing -> promptUser x

showPolynomial :: [Natural] -> String
showPolynomial [] = "0"
showPolynomial cs = go (zip cs [0 ..]) [] []
  where
    go [] ps ys = unlines [intercalate "   " ps, intercalate " + " ys]
    go ((c, d):cs) ps xs =
      let x
            | d == 0 = show c
            | c == 1 = "x"
            | otherwise = show c ++ "x"
          p
            | d < 2 = ""
            | otherwise = show d
       in go cs ((spaces (length x) ++ p) : ps) ((x ++ spaces (length p)) : xs)

spaces :: Int -> String
spaces n = replicate n ' '
