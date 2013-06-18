-- Write a function to tell whether a triangle
-- is big or not. A triangle should be called
-- big if its hypoteneuse is longer than 10.
--    (be sure to use where to make your function
--     more readable)
bigTriangle :: Float -> Float -> Bool
bigTriangle length width = hypoteneuse > 10
  where hypoteneuse = sqrt (length*length + width*width)

-- Write a function that classifies rectangles
-- into at least 5 size categories based their
-- area. The pair given is the rectangle's length
-- and width.
rectSize :: (Integer, Integer) -> String
rectSize (length, width)
    | area > 25 = "Super Sized"
    | area > 20 = "Large"
    | area > 15 = "Medium"
    | area > 10 = "Small"
    | otherwise = "Why Bother"
  where area = length*width

-- Write a function that constructs a rect from a
-- list of 2 elements, length and width. Assume
-- there will always be exactly 2 elements
-- in the list. Use your where and pattern
-- matching skills to write the most readable
-- function you can.
listToRect :: [Integer] -> (Integer, Integer)
listToRect list = (length, width)
  where [length, width] = list

-- Write a function that calculates the area of
-- each rectangle in a list.
areas rects = [ area rect | rect <- rects ]
  where area (length,width) = length * width

