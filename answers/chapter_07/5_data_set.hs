-- import the Data.Set module and solve the following problems
--   (You may use other modules as well if you wish)
--
-- See the url below for the list of functions in Data.Set
--   http://www.haskell.org/ghc/docs/7.6-latest/html/libraries/containers-0.5.0.0/Data-Set.html
--

import Data.List (foldl')
import Data.Char (toLower)
import qualified Data.Set as Set

-- Find the set of all letters that appear in Sonnet CXXX.
-- Find the set of all letters that do not appear in the sonnet.
-- Find the set of all letters that appear on every line of the sonnet.

sonnetCXXX =
 "My mistress' eyes are nothing like the sun;\n" ++
 "Cornal is far more red, than her lips red:\n" ++
 "If snow be white, why then her breasts are dun;\n" ++
 "If hairs be wires, black wires grow on her head.\n" ++
 "I have seen roses damasked, red and white,\n" ++
 "But no such roses see I in her cheeks;\n" ++
 "And in some perfumes is there more delight\n" ++
 "Than in the breath that from my mistress reeks.\n" ++
 "I love to hear her speak, yet well I know\n" ++
 "That music hath a far more pleasing sound:\n" ++
 "I grant I never saw a goddess go,\n" ++
 "My mistress, when she walks, treads on the ground:\n" ++
 "   And yet by heaven, I think my love as rare,\n" ++
 "   As any she belied with false compare."

sonnetLineLetters :: [Set.Set Char]
sonnetLineLetters = map Set.fromList $
                    lines $
                    filter (`elem` '\n':['a'..'z']) $
                    map toLower sonnetCXXX

allLetters = Set.fromList ['a'..'z']

lettersInSonnet :: Set.Set Char
lettersInSonnet = Set.unions sonnetLineLetters

lettersNotInSonnet :: Set.Set Char
lettersNotInSonnet = Set.difference allLetters lettersInSonnet

lettersOnEveryLine :: Set.Set Char
lettersOnEveryLine = foldl' Set.intersection allLetters sonnetLineLetters

