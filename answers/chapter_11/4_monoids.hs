import Data.Monoid

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


