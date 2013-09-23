-- A Bomb is defined by the order in
-- which its wires must be cut to disable
-- it. If a wire is cut out of order, the
-- bomb explodes.
--
type Bomb = [Wire]
data Wire = Red | Blue | Green deriving (Show, Eq)

-- Define a function that cuts a Wire of a
-- Bomb, returning Just the Wires remaining
-- to be cut. If the incorrect Wire is cut,
-- the Bomb expodes, leaving Nothing to return.
-- If any attempt is made to cut a Wire on
-- a Bomb with no Wires remaining, the Bomb
-- explodes.
--
cutWire :: Wire -> Bomb -> Maybe Bomb
cutWire cut (w:ws) | cut == w = Just ws
cutWire _ _ = Nothing

-- Define a function that waits to see if the
-- Bomb will explode. If there are no remaining
-- wires, return Just a happy message. If any
-- wires remain uncut, the Bomb explodes.
--
wait :: Bomb -> Maybe String
wait [] = Just "Saved again!"
wait _ = Nothing

-- Quick, disarm the Bomb! (Be sure sure to use
-- Monad functions)
--
bomb = [Red, Green, Blue]
disarmed = return bomb >>=
           cutWire Red >>=
           cutWire Green >>=
           cutWire Blue >>=
           wait

-- Now see what happens if you accidentally cut the Blue
-- wire second.
--
boomed = return bomb >>=
           cutWire Red >>=
           cutWire Blue >>=
           cutWire Green >>=
           wait

-- All good Bombs are equipped with a dead man switch to
-- protect their creators. Define a disarming operation
-- to make the Bomb explode if someone takes out its maker.
--
takeOutBombMaker :: Maybe Bomb
takeOutBombMaker = Nothing

-- Try it out! See what happens if someone takes
-- out the Bomb's maker while you are disarming it.
--
takeEmOut = return bomb >>=
              cutWire Red >>=
              cutWire Green >>
              takeOutBombMaker >>=
              cutWire Blue >>=
              wait

-- Pick one of the 3 disarming examples above and re-write it
-- without using the Maybe Monad. Just use pattern matching at
-- each step of the sequence.
--
boomed' =
  case cutWire Red bomb of
    Nothing -> Nothing
    Just bomb' -> case cutWire Blue bomb' of
      Nothing -> Nothing
      Just bomb'' -> case cutWire Green bomb'' of
        Nothing -> Nothing
        Just bomb''' -> wait bomb'''

