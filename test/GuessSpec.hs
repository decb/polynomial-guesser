module GuessSpec
  ( spec
  ) where

import           Numeric.Natural                   (Natural)
import           Test.Hspec
import           Test.QuickCheck
import           Test.QuickCheck.Instances.Natural ()

import           Guess                             (guess)

spec :: Spec
spec =
  describe "guess" $ do
    it "guesses 0 correctly" $ guess 0 0 `shouldBe` []
    it "guesses x^2 + 3x + 9 correctly" $ guess 247 14 `shouldBe` [9, 3, 1]
    it "guesses x^100 + x" $
      guess 515377520732011331036461129765621272702107522004 3 `shouldBe`
      (0 : 1 : replicate 98 0 ++ [1])
    it "guesses an arbitrary polynomial" $
      property $ \p ->
        let p' = takeWhile (/= 0) p
            n = succ $ evaluatePolynomial p' 1
         in guess (evaluatePolynomial p' n) n `shouldBe` p'

evaluatePolynomial :: [Natural] -> Natural -> Natural
evaluatePolynomial [] n = 0
evaluatePolynomial (c:cs) n = sum $ c : zipWith (\c p -> c * (n ^ p)) cs [1 ..]
