module AdventureGame.World where

data Room = Room {
  roomName :: String,
  roomDescription :: String,
  north :: Maybe Room,
  south :: Maybe Room,
  east :: Maybe Room,
  west :: Maybe Room
  }

instance Show Room where
  show room = "Room " ++
              show (roomName room) ++ " " ++
              "North: " ++ show (fmap roomName $ north room) ++ " " ++
              "South: " ++ show (fmap roomName $ south room) ++ " " ++
              "East: " ++ show (fmap roomName $ east room) ++ " " ++
              "West: " ++ show (fmap roomName $ west room)

data Direction = North | South | East | West
  deriving (Enum, Show)
directions = [North .. West]

exitTo :: Direction -> Room -> Maybe Room
exitTo North = north
exitTo South = south
exitTo East = east
exitTo West = west


