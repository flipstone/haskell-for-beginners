-- For all the problems here, try to write
-- the type signature first to understand
-- the problem. If you can't figure it out,
-- use GHCI to help you.
--

-- Use IO as a Functor to define an IO action
-- that reads a line from stdin as an Int
--
getIntLine :: IO Int
getIntLine = fmap read getLine


-- Define a function that will read an Int
-- from a String within any Functor, not
-- just IO. You are 'lifting' the read
-- function into the Functor.
--
readIntF :: Functor f => f String -> f Int
readIntF = fmap read


-- Define a new version of getIntLine that
-- uses readIntF
--
getIntLine' :: IO Int
getIntLine' = readIntF getLine


-- Define a function that doubles an Int
-- read from a String, using Functions as
-- Functors.
--
readDoubleInt :: String -> Int
readDoubleInt = fmap (*2) read


-- Define a function that doubles an Int,
-- which is lifted any Functor.
--
doubleIntF :: Functor f => f Int -> f Int
doubleIntF = fmap (*2)


-- Define a new version of readDoubleInt
-- using doubleIntF
--
readDoubleInt' :: String -> Int
readDoubleInt' = doubleIntF read


-- Define an IO Action that reads a line
-- from stdin as an Int and doubles it,
-- using your functions above
--
getDoubleIntLine :: IO Int
getDoubleIntLine = doubleIntF getIntLine


-- Define a function that doubles an Int
-- read from a String lifted into any
-- Functor. Use functions from above to
-- make your definition as simple as possble.
--
readDoubleIntF :: Functor f => f String -> f Int
readDoubleIntF = doubleIntF . readIntF


-- Define a new version of getDoubleIntLine
-- using readDoubleIntF
--
getDoubleIntLine' :: IO Int
getDoubleIntLine' = readDoubleIntF getLine


