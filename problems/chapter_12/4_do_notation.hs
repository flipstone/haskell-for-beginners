three, four, seven, seven', sevenDo :: Maybe Int
three = Just 3
four = Just 4

-- Add three and four from above. Use >>=
-- and lambdas to extract the Monadic values.
--
seven = undefined

-- Do the same addition as above, but format
-- the definition so each Maybe value starts
-- a new line.
--
seven' = undefined

-- Do the same addition as above, using do notation.
--
sevenDo = undefined

-- Rewrite the Bomb disarming operation from
-- the previous section using do notation.
--
type Bomb = [Wire]
data Wire = Red | Blue | Green deriving (Show, Eq)

cutWire :: Wire -> Bomb -> Maybe Bomb
cutWire cut (w:ws) | cut == w = Just ws
cutWire _ _ = Nothing

wait :: Bomb -> Maybe String
wait [] = Just "Saved again!"
wait _ = Nothing

bomb = [Red, Green, Blue]
disarmedDo = undefined

-- Define a safeHead function that returns Nothing for empty
-- lists. Use Monad pattern match failure handling to do it.
--
safeHead = undefined

