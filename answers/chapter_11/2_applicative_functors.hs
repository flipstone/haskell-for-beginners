import Control.Applicative
import Data.Char

-- Define getIntLine as in the previous
-- problems, but use Applicative functions
-- instead of fmap (no cheating and using
-- <$> either!)
--
getIntLine :: IO Int
getIntLine = pure read <*> getLine

-- Define addition on Applicative Functors.
-- Exercise your definition with different Applicatives
-- in GHCI to see how it behaves. Try Maybe, lists,
-- IO, and functions.

aPlus :: (Num a, Applicative f) => f a -> f a -> f a
aPlus x y = (+) <$> x <*> y

aPlus' :: (Num a, Applicative f) => f a -> f a -> f a
aPlus' = liftA2 (+)

-- Use lists an Applicatives to calculate the chances
-- of rolling 15 or better on a roll of 1d6 + 1d10 + 1d4.
--
p = num15OrOver / numPossibilities
  where allPossibilities = [1..6] `aPlus` [1..10] `aPlus` [1..4]
        _15OrOver = filter (>=15) allPossibilities
        num15OrOver = fromIntegral (length _15OrOver)
        numPossibilities = fromIntegral (length allPossibilities)

-- Reimplement the encrypt and decrypt functions from
-- Chapter 7, problem set 2 using ZipLists as Applicatives.
--
encrypt :: String -> String -> String
encrypt pad plainText = getZipList $ padOne <$>
                        ZipList (cycle pad) <*>
                        ZipList plainText
  where padOne p c = chr (ord c + digitToInt p)

decrypt :: String -> String -> String
decrypt pad plainText = getZipList $ padOne <$>
                        ZipList (cycle pad) <*>
                        ZipList plainText
  where padOne p c = chr (ord c - digitToInt p)

cipherText = "Xiss-us-pr\128tr\128-\131i\129v-fi}Zv\DELt\128/"
key = "c0ded"


-- Pick an Applicative and demonstrate that all the Applicative laws
-- are satisfied for it.

fmapProof = (pure (+1) <*> [3,4]) == fmap (+1) [3,4]
idProof = (pure id <*> [3,4]) == [3,4]
compositionProof = (pure (.) <*> [(+1),(+2)] <*> [(*2),(*3)] <*> [4,5]) ==
                   ([(+1),(+2)] <*> ([(*2),(*3)] <*> [4,5]))
purityProof = (pure (+1) <*> pure 3) == (pure (3 + 1) :: [Int])
dollarProof = ([(+1),(+3)] <*> pure 3) == (pure ($3) <*> [(+1),(+3)])

