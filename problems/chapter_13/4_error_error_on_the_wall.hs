import Control.Monad.Error

-- Rebuild the Bomb defusing example from
-- Chapter 12, but when the Bomb explodes,
-- provide a taunting message from the
-- villain for the hero to see before his
-- gruesome end.
--
type Bomb = [Wire]
type Defusinge a = Either String a
data Wire = Red | Blue | Green deriving (Show, Eq)

cutWire :: Wire -> Bomb -> Defusing Bomb
cutWire = undefined

wait :: Bomb -> Defusing String
wait = undefined

-- Quick, disarm the Bomb! (Be sure sure to use
-- Monad functions)
--
bomb = [Red, Green, Blue]
disarmed = undefined

-- Now see what happens if you accidentally cut the Blue
-- wire second.
--
boomed = undefined

-- All good Bombs are equipped with a dead man switch to
-- protect their creators. Define a disarming operation
-- to make the Bomb explode if someone takes out its maker.
--
takeOutBombMaker :: Defusing Bomb
takeOutBombMaker = undefined

-- Try it out! See what happens if someone takes
-- out the Bomb's maker while you are disarming it.
--
takeEmOut = undefined

