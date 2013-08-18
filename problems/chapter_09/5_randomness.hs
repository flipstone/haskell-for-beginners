import qualified Data.Map as Map
import System.Random

type Distribution = Map.Map Int Int

-- Define a function to simulate a roll of a
-- single 6 sided die by "rolling" it n times
-- and returning how many times each result appeared.
--
dieResults :: (RandomGen g) => g -> Int -> Distribution
dieResults g n = undefined

-- Define a function to simulate a roll of a
-- n 6 sided dice once, adding the results
-- together, and returning a new random generator.
--
--
rollDice :: (RandomGen g) => g -> Int -> (Int, g)
rollDice g n = undefined

-- Define a function to simulate a any number
-- of rolls of n 6 sided by returning an infinite
-- list of roll results.
--
-- (use your rollDice function from above)
--
diceRolls :: (RandomGen g) => g -> Int -> [Int]
diceRolls g n = undefined

-- Define a function to simulate a roll of a
-- n 6 sided die by "rolling" it m times
-- and returning how many times each result appeared.
--
-- (use your diceRolls function from above)
--
diceResults :: (RandomGen g) => g -> Int -> Int -> Distribution
diceResults g n m = undefined

-- Define a function that accepts a number of dice
-- to roll and uses your diceResults function to build
-- an IO action that will simulate 1000 dice rolls and
-- print the results.
--
-- Make sure that the action runs a new simulation each
-- time it is run!
--
simulateDice :: Int -> IO ()
simulateDice n = undefined

