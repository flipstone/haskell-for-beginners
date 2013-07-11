module Encryption
  ( encryptCaesar
  , decryptCaesar
  , encryptPad
  , decryptPad
  ) where

import Data.Char

encryptCaesar :: Int -> String -> String
encryptCaesar shift = encryptPad [shift]

decryptCaesar :: Int -> String -> String
decryptCaesar shift = decryptPad [shift]

encryptPad :: [Int] -> String -> String
encryptPad = applyPad (+)

decryptPad :: [Int] -> String -> String
decryptPad = applyPad (-)

applyPad :: (Int -> Int -> Int) -> [Int] -> String -> String
applyPad op pad = toChars . padBytes . toBytes
  where toBytes = map ord
        toChars = map chr
        padBytes = map apply . zip (cycle pad)
        apply (p,b) = b `op` p
