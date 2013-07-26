-- Implement a (very) simple text adventure game. Your game
-- will be able to load game data files like the adventure
-- files in this directory and allow the player to play the game
-- described in the file. A UI module has been provided handle
-- all the file and player interaction. You need to provide
-- file parsing, game representation, and game play pieces.
--
-- Each adventure consists of a series of locations. The player
-- always starts the game in the first room listed in the adventure
-- file. The only gameplay commands available are north,
-- south, east, and west. These commands move between locations
-- based on the exits defined in the adventure file. The player
-- also needs to be able to quit the game. The game goes on forever
-- until the player quits, although the data in an adventure file
-- might lead a player to a location where quitting is the only
-- option available.
--
-- You may use any Haskell you find in the platform documentation,
-- and you may use any Haskell techniques you have learned. Good luck!
-- Once you load your module, you can play the game by running a command
-- like this in GHCI:
--
--   runGame "problems/midterm/simple.adventure"
--
module AdventureGame where

import AdventureGame.UI

gameEngine = undefined
gameLoader = undefined

runGame :: String -> IO ()
runGame = run gameLoader gameEngine

