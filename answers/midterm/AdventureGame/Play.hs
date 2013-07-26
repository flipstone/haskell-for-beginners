module AdventureGame.Play
  ( Game(..)
  , play
  , showRoom
  , parseCommand
  )
   where

import AdventureGame.UI
import AdventureGame.World

data Game = Game {
  currentRoom :: Room
}

data Command = Go Direction | Quit

play :: Command -> Game -> Action Game
play Quit = Action Done
play (Go dir) = takeExit dir

showRoom :: Game -> Action Game
showRoom game = Action (Print (description game)) game
  where description = roomDescription . currentRoom

takeExit :: Direction -> Game -> Action Game
takeExit direction game =
  case exitTo direction (currentRoom game) of
    Just room -> showRoom $ Game room
    Nothing -> Action (Print "You can't go that way") game

parseCommand :: String -> Maybe Command
parseCommand "north" = Just $ Go North
parseCommand "south" = Just $ Go South
parseCommand "east" = Just $ Go East
parseCommand "west" = Just $ Go West
parseCommand "quit" = Just Quit
parseCommand _ = Nothing

