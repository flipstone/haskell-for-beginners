three, four, seven, seven', sevenDo :: Maybe Int
three = Just 3
four = Just 4

-- Add three and four from above. Use >>=
-- and lambdas to extract the Monadic values.
--
seven = three >>= (\x -> four >>= (\y -> Just (x + y)))

-- Do the same addition as above, but format
-- the definition so each Maybe value starts
-- a new line.
--
seven' =
 three >>= (\x ->
 four >>= (\y ->
 Just (x + y)))

-- Do the same addition as above, using do notation.
--
sevenDo = do
 x <- three
 y <- four
 Just (x + y)

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
disarmed = do
  redWasCut <- cutWire Red bomb
  greenWasCut <- cutWire Green redWasCut
  blueWasCut <- cutWire Blue greenWasCut
  wait blueWasCut

-- Define a safeHead function that returns Nothing for empty
-- lists. Use Monad pattern match failure handling to do it.
--
safeHead :: [a] -> Maybe a
safeHead list = do
  (head:_) <- Just list
  return head

--
