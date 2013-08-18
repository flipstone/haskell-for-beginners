-- Implement a program to count the number of vowels
-- that appear in text read from stdin. Do this 3 times,
-- once using plain lists, once with strict bytestrings,
-- and once with lazy byte strings. Compare how they
-- perform on small and large input and thing about when
-- each my be appropriate to use.
--
-- You can test you program by running a command like:
--   time cat /dev/urandom | tr -dc _A-Z-a-z-0-9 | head -c <bytes> | runhaskell <your program>
--
-- Try varying the number of bytes from as low as 1000 to
-- as high as 20000000 and see how each version of your
-- program performs. Also trying using top to observe
-- your program's memory usage as it runs.
--

import qualified Data.ByteString.Lazy.Char8 as LBS
import qualified Data.ByteString.Char8 as BS

main = countVowelsList

countVowelsList = undefined

countVowelsLazyByteString = undefined

countVowelsByteString = undefined

