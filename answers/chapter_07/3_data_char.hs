-- import the Data.Char module and solve the following problem
--   (You may use other modules as well if you wish)
--
-- See the url below for the list of in Data.Char
--   http://www.haskell.org/ghc/docs/7.6-latest/html/libraries/base-4.6.0.1/Data-Char.html
--
-- You have acquired through separate channels an encrypted message
-- and what appears a message key. You suspect the key was used as
-- part to encrypt the message using a simple variation of a one
-- time pad, with each key digit being added to the message digits.
-- Write a function to recover the encrypted message.
--
import Data.Char

encrypt :: String -> String -> String
encrypt pad plainText = map chr $ zipWith (+) textNums padNums
  where padNums = cycle (map digitToInt pad)
        textNums = map ord plainText

decrypt :: String -> String -> String
decrypt pad cipherText = map chr $ zipWith (-) cipherNums padNums
  where padNums = cycle (map digitToInt pad)
        cipherNums = map ord cipherText

cipherText = "[pr\128n\128i||-3F|wy,Hn\129xqlys\DEL\DEL'-q|ypys\129q.-`r}ur\129\129,o\DELrr~s;"
key = "c0ded"


