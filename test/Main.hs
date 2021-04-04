module Main where

import           Test.Hspec (hspec)

import qualified GuessSpec

main :: IO ()
main = hspec $ do GuessSpec.spec
