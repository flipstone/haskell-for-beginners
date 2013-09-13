import Data.Monoid
import Data.List

-- Using Strings as a Monoid, define a function
-- that will join together a list of strings
-- with a given delimeter string in between.
--
joinS :: String -> [String] -> String
joinS _ [] = mempty
joinS _ [x] = x
joinS delim (x:xs) = x `mappend`
                    delim `mappend`
                    joinS delim xs

-- Using Strings as a Monoid and your
-- joinS function above,  define a function
-- equivalent to mconcat on strings.
--
concatS :: [String] -> String
concatS = joinS mempty


-- Generalize your joinS and concatS functions
-- to work for all Monoids.
--
joinM :: Monoid m => m -> [m] -> m
joinM _ [] = mempty
joinM _ [x] = x
joinM delim (x:xs) = x `mappend`
                    delim `mappend`
                    joinM delim xs

concatM :: Monoid m => [m] -> m
concatM = joinM mempty


-- This function defines an integer sequence called a
-- collatz sequence when provided with a starting number.
--
collatz :: Integer -> [Integer]
collatz 1 = [1]
collatz n = n : collatz m
  where m = if even n
            then n `div` 2
            else n*3 + 1

-- Use concatM (or mconcat) to find the sum of the collatz sequence that
-- starts with 27
--
collatz27Sum = getSum . concatM . map Sum $ collatz 27

-- Use concatM (or mconcat) to find the product of the collatz sequence
-- that starts with 11
--
collatz11Product = getProduct . mconcat . map Product $ collatz 11

-- Use concatM (or mconcat) to find out whether any number in the
-- collatz sequence starting with 27 is a multiple of 7
--
anyMultiplesOf7 = getAny . mconcat . map Any $ map (\x -> x `mod` 7 == 0) (collatz 27)


-- Use concatM (or mconcat) to find out whether all the collatz sequences
-- starting with the numbers 1000 through 2000 are no more than 200 elements
-- length.
--
shorterThan200 = getAll . mconcat . map All $
                 map ((<200) . length . collatz) [1000..2000]


-- Using the Ordering Monoid, define a function that sorts collatz sequences
-- with longest sequences first and sorts sequences that start with a smaller
-- number before others of the same length.
--
collatzSort :: [Integer] -> [Integer] -> Ordering
collatzSort [] [] = EQ
collatzSort _ [] = GT
collatzSort [] _ = LT
collatzSort a@(a1:_) b@(b1:_) =
  (length b `compare` length a) `mappend`
  (a1 `compare` b1)

-- Use your collatz sorting function to sort the collatz sequences start
-- with 1 to 30
sortedCollatz = sortBy collatzSort $ map collatz [1..30]


-- Use Maybe as a monoid to find the first number in a collatz sequence
-- (> 10000) (that is, the first number in the first collatz sequence
-- that is greater than 10000, starting with collatz 1).
--
firstBigOne = getFirst . mconcat . map First $
              map (find (>10000) . collatz) [1..]


--
--
