module Main where

import           Test.Hspec (hspec)

import qualified Spec.Guess as Guess
import qualified Spec.IO    as IO

main :: IO ()
main =
  hspec $ do
    Guess.spec
    IO.spec
