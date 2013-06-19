-- Write a function to tell whether a triangle
-- is big or not. A triangle should be called
-- big if its hypoteneuse is longer than 10.
--    (be sure to use *let* to make your function
--     more readable)
bigTriangle :: Float -> Float -> Bool
bigTriangle length width =
  let hypoteneuse = sqrt (length*length + width*width)
  in hypoteneuse > 10

-- Write a function that constructs a rect from a
-- list of 2 elements, length and width. Assume
-- there will always be exactly 2 elements
-- in the list. Use your *let* and pattern
-- matching skills to write the most readable
-- function you can.
listToRect :: [Integer] -> (Integer, Integer)
listToRect list =
  let [length, width] = list
  in (length, width)

-- Write a function that calculates the area of
-- each rectangle in a list. Write two versions
-- of it, one with with let *outside* the list,
-- and one with let *inside* the list.
areas rects =
  let area (length,width) = length * width
  in [ area rect | rect <- rects ]

areas' rects = [ area |
                 (length, width) <- rects,
                 let area = length * width ]

-- Write a function to calculate the area of a
-- square donut based on its size and thickness.
-- For instance, the square below has size 5,
-- thinkness 1, area 16.
--
--                   █████
--                   █   █
--                   █   █
--                   █   █
--                   █████
--
donutArea :: Num a => a -> a -> a
donutArea size thickness =
  let emptySize = size - thickness*2
      enclosedArea = size * size
      emptyArea = emptySize * emptySize
  in enclosedArea - emptyArea

