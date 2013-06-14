-- write a function that takes a list of lengths
-- as numbers returns a list of all rectangles
-- that can be constructed from sides of those lengths
--
--   You can represent a rectangle by the pair of its dimensions
--
rectangles sides = [ (l, w) | l <- sides, w <- sides ]

-- write a function that takes a list of rectangles
-- and computes the area of each one
--
areas rects = [ fst rect * snd rect | rect <- rects ]

-- Use your two functions above to write a function
-- that takes a list of lengths and returns all
-- the possible rectangles paired with their areas
--
rectsWithAreas sides = zip (rectangles sides)
                           (areas (rectangles sides))

-- Find all the rectangles with integers dimensions
-- whose perimeter is equal to their area. Do not
-- include any rectangles that are equivalent
-- to one another ((2,10) and (10,2) are the
-- same rectangle).
--
--   (It may be more convenient to *not* use your
--    functions from above)
--
specials = [ (l,w) | l <- [1..10], w <- [1..10],
                     l >= w,
                     (l*w) == (2*l + 2*w) ]

