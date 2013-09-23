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
cutWire = undefined

-- Define a function that waits to see if the
-- Bomb will explode. If there are no remaining
-- wires, return Just a happy message. If any
-- wires remain uncut, the Bomb explodes.
--
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
takeOutBombMaker = undefined

-- Try it out! See what happens if someone takes
-- out the Bomb's maker while you are disarming it.
--
takeEmOut = undefined

-- Pick one of the 3 disarming examples above and re-write it
-- without using the Maybe Monad. Just use pattern matching at
-- each step of the sequence.
--

