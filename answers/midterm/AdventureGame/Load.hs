module AdventureGame.Load
  ( load )
  where

import AdventureGame.World
import Data.Maybe (listToMaybe)

type Lines = [String]
type Rooms = [(String,Room)]
type ExitLine = (String,String)

load :: String -> Maybe Room
load string = listToMaybe (map snd rooms)
  where roomSections = breakRooms . removeBlanks . lines $ string
        rooms = map (makeRoom rooms) roomSections

removeBlanks :: Lines -> Lines
removeBlanks = filter (not . null)

breakRooms :: Lines -> [Lines]
breakRooms [] = []
breakRooms lines = filter (not . null) sections
  where sections = roomLines : breakRooms (drop 1 rest)
        (roomLines, rest) = break (== "-- Room --") lines

makeRoom :: Rooms -> Lines -> (String, Room)
makeRoom rooms lines = (name, room)
  where (text,exits) = break (== "-- Exits --") lines
        name = concat $ take 1 text
        description = unlines $ drop 1 text
        lookupExit = findExit (map tokenize exits) rooms
        room = Room {
                roomName = name,
                roomDescription = description,
                north = lookupExit North,
                south = lookupExit South,
                east = lookupExit East,
                west = lookupExit West
               }

tokenize :: String -> ExitLine
tokenize line = (directionName,roomName)
  where (label, rest) = break (== ' ') line
        directionName = init label
        roomName = drop 1 rest

findExit :: [ExitLine] -> Rooms -> Direction -> Maybe Room
findExit exitLines rooms direction =
  case lookup (show direction) exitLines of
    Just name -> lookup name rooms
    Nothing -> Nothing

