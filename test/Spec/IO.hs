module Spec.IO
  ( spec
  ) where

import           Test.Hspec

import           IO         (showPolynomial)
import           Polynomial (Polynomial (Polynomial))

spec :: Spec
spec =
  describe "showPolynomial" $ do
    it "renders 0 correctly" $
      showPolynomial (Polynomial [0]) `shouldBe` unlines ["", "0"]
    it "renders x correctly" $
      showPolynomial (Polynomial [0, 1]) `shouldBe` unlines [" ", "x"]
    it "renders x^2 + 3x + 9 correctly" $
      showPolynomial (Polynomial [9, 3, 1]) `shouldBe`
      unlines [" 2         ", "x  + 3x + 9"]
    it "renders x^100 + 50" $
      showPolynomial (Polynomial $ 50 : replicate 99 0 ++ [1]) `shouldBe`
      unlines [" 100     ", "x    + 50"]
