-- For all the problems here, try to write
-- the type signature first to understand
-- the problem. If you can't figure it out,
-- use GHCI to help you.
--

-- Use IO as a Functor to define an IO action
-- that reads a line from stdin as an Int
--
getIntLine = undefined


-- Define a function that will read an Int
-- from a String within any Functor, not
-- just IO. You are 'lifting' the read
-- function into the Functor.
--
readIntF = undefined


-- Define a new version of getIntLine that
-- uses readIntF
--
getIntLine' = undefined


-- Define a function that doubles an Int
-- read from a String, using Functions as
-- Functors.
--
readDoubleInt = undefined


-- Define a function that doubles an Int,
-- which is lifted any Functor.
--
doubleIntF = undefined


-- Define a new version of readDoubleInt
-- using doubleIntF
--
readDoubleInt' = undefined


-- Define an IO Action that reads a line
-- from stdin as an Int and doubles it,
-- using your functions above
--
getDoubleIntLine = undefined


-- Define a function that doubles an Int
-- read from a String lifted into any
-- Functor. Use functions from above to
-- make your definition as simple as possble.
--
readDoubleIntF = undefined


-- Define a new version of getDoubleIntLine
-- using readDoubleIntF
--
getDoubleIntLine' = undefined


-- Define a Functor instance for the Graph
-- type below. Demonstrate that it satisfies
-- the functor laws.
--
data Graph a = Node a [Graph a] deriving (Show, Eq)

sampleGraph = Node "Whiskey" [
    Node "Tango" [Node "Foxtrot" []],
    Node "Bang" []
  ]

idProof = False
compositionProof = False


