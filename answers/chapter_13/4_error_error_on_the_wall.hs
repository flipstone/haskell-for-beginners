import Control.Monad.Error

-- Rebuild the Bomb defusing example from
-- Chapter 12, but when the Bomb explodes,
-- provide a taunting message from the
-- villain for the hero to see before his
-- gruesome end.
--
type Bomb = [Wire]
type Defusing a = Either String a
data Wire = Red | Blue | Green deriving (Show, Eq)

cutWire :: Wire -> Bomb -> Defusing Bomb
cutWire _ [] = Left "Looks like you should've stopped while you were ahead!"
cutWire cut (w:ws)
 | cut == w = Right ws
 | otherwise = Left $ "Uh oh... you should have cut the " ++ show w ++ " wire"

wait :: Bomb -> Defusing String
wait [] = Right "Saved again!"
wait (w:_) = Left $ "Too bad, you could have cut the " ++ show w ++ " one!"

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
takeOutBombMaker :: Defusing Bomb
takeOutBombMaker = Left "I reach back from the grave to take you with me!"

-- Try it out! See what happens if someone takes
-- out the Bomb's maker while you are disarming it.
--
takeEmOut = return bomb >>=
              cutWire Red >>=
              cutWire Green >>
              takeOutBombMaker >>=
              cutWire Blue >>=
              wait

