module Spec.Guess
  ( spec
  ) where

import           Numeric.Natural                   (Natural)
import           Test.Hspec
import           Test.QuickCheck                   (Testable (property))
import           Test.QuickCheck.Instances.Natural ()

import           Guess                             (guess)
import           Polynomial                        (Polynomial (..))

spec :: Spec
spec =
  describe "guess" $ do
    it "guesses 0 correctly" $ guess 0 0 `shouldBe` Polynomial []
    it "guesses x^2 + 3x + 9 correctly" $
      guess 247 14 `shouldBe` Polynomial [9, 3, 1]
    it "guesses x^100 + x" $
      guess 515377520732011331036461129765621272702107522004 3 `shouldBe`
      Polynomial (0 : 1 : replicate 98 0 ++ [1])
    it "guesses an arbitrary polynomial" $
      property $ \p ->
        let n = succ $ evaluatePolynomial p 1
         in guess (evaluatePolynomial p n) n `shouldBe` p

evaluatePolynomial :: Polynomial -> Natural -> Natural
evaluatePolynomial (coefficients -> []) n = 0
evaluatePolynomial (coefficients -> (c:cs)) n =
  sum $ c : zipWith (\c p -> c * (n ^ p)) cs [1 ..]
