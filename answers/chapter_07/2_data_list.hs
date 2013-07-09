-- import the Data.List module and solve the following problem
--
-- See the url below for the list of in Data.List
--   http://www.haskell.org/ghc/docs/7.6-latest/html/libraries/base-4.6.0.1/Data-List.html
--
-- Write a function to find the longest word in a sentence.
--
import Data.List

sentence =  "Don't use a big word where a diminutive word will suffice"
longestWord = maximumBy longer . words
  where longer word1 word2 = compare (length word1) (length word2)

