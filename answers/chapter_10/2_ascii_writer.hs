-- Implement a drawing machine that processes commands
-- given as single characters on stdin and then shows
-- the picture drawn by the commands. The commands
-- are:
--  l,r,u,d - move pen left,right,up,down
--  ^,v - pen up, pen down
--
-- All other characters can be ignored.
--
-- The machine should start at (0,0) with the pen up and
-- trace all points the machine touches while the pen is
-- down. Display all the points between (10,10) and (-10,-10)
-- as a picture to stdout.
--
-- Try this picture as a test:
--   llluuuuvldr^rrrrrrrrvurd^ddddv^dlvl^dlvllll^ulvl^ulv
--

import Data.List (foldl')

main = interact asciiWriter

type Position = (Int,Int)
type Tracing = [Position]

data Pen = Up | Down deriving (Eq,Show)

data Writer = Writer {
    position :: Position,
    pen ::  Pen,
    tracing :: Tracing
  } deriving Show

asciiWriter :: String -> String
asciiWriter = toScreen . foldl' execute initialWriter

toScreen :: Writer -> String
toScreen writer = wrap 21 $ [ mark x y | y <- reverse [-10..10],
                                         x <- [-10..10] ]
  where mark x y = if (x,y) `elem` tracing writer
                   then '*'
                   else ' '

wrap :: Int -> String -> String
wrap _ "" = ""
wrap width string = line ++ "\n" ++ wrap width rest
  where (line,rest) = splitAt width string

execute :: Writer -> Char -> Writer
execute writer name =
  case name of
    'l' -> jump (-1,0) writer
    'r' -> jump (1,0) writer
    'u' -> jump (0,1) writer
    'd' -> jump (0,-1) writer
    '^' -> setPen Up writer
    'v' -> setPen Down writer
    otherwise -> writer

initialWriter = Writer (0,0) Up []

jump :: (Int,Int) -> Writer -> Writer
jump (dx,dy) writer = trace $ writer { position = pos' }
  where pos' = (x + dx, y + dy)
        (x,y) = position writer

trace :: Writer -> Writer
trace writer | pen writer == Up = writer
trace writer = writer { tracing = position writer : tracing writer }

setPen :: Pen -> Writer -> Writer
setPen newPen writer = trace $ writer { pen = newPen }

