module Main where

import           Test.Hspec (hspec)

import qualified GuessSpec
import qualified IOSpec

main :: IO ()
main =
  hspec $ do
    GuessSpec.spec
    IOSpec.spec
