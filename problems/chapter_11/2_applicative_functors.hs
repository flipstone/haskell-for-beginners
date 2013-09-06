import Control.Applicative
import Data.Char

-- Define getIntLine as in the previous
-- problems, but use Applicative functions
-- instead of fmap (no cheating and using
-- <$> either!)
--
getIntLine :: IO Int
getIntLine = undefined


-- Define addition for Applicatives using
-- the 'Applicative style'. Exercise your
-- definition with different Applicatives
-- in GHCI to see how it behaves. Try Maybe, lists,
-- IO, and functions.
--
aPlus = undefined

-- Use lists an Applicatives to calculate the chances
-- of rolling 15 or better on a roll of 1d6 + 1d10 + 1d4.
--
p = undefined

-- Reimplement the encrypt and decrypt functions from
-- Chapter 7, problem set 2 using ZipLists as Applicatives.
--
encrypt :: String -> String -> String
encrypt = undefined

decrypt :: String -> String -> String
decrypt = undefined

cipherText = "Xiss-us-pr\128tr\128-\131i\129v-fi}Zv\DELt\128/"
key = "c0ded"


-- Pick an Applicative and demonstrate that all the Applicative laws
-- are satisfied for it.
--
fmapProof = undefined
idProof = undefined
compositionProof = undefined
purityProof = undefined
dollarProof = undefined


-- Redefine addition on Applicatives using lifting
--
aPlus' = undefined


-- Define a function to find the sum of a list
-- of Ints that are wrapped in an Applicative.
-- Try it out on some Applicatives in GHCI.
--
sumA = undefined


-- Define a left folding function for Applicatives
-- that accepts an unlifted folding function and
-- initial value, but operates on a list of Applicatives
--
foldlA :: Applicative f => (a -> b -> a) -> a -> [f b] -> f a
foldlA = undefined

-- Redefine sum for Applicatives using your new fold
-- function for Applicatives.
--
sumA' = undefined

