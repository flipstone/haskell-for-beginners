-- Implement your complex number solution yet again, but
-- this time use a type synonym and represent complex
-- numbers using a tuple.
--

type Complex a = (a,a)

add :: Num a => Complex a -> Complex a -> Complex a
add (a,b) (c,d) = ((a + c),(b + d))

sub :: Num a => Complex a -> Complex a -> Complex a
sub (a,b) (c,d) = ((a - c),(b - d))

mult :: Num a => Complex a -> Complex a -> Complex a
mult (a,b) (c,d) = ((a*c - b*d),(b*c + a*d))

divide :: Fractional a => Complex a -> Complex a -> Complex a
divide (a,b) (c,d) = (real,imaginary)
  where real = (a*c + b*d) / denom
        imaginary = (b*c - a*d) / denom
        denom = c*c + d*d

-- Create a Result type based on Either that assumes the
-- left side is a String containing an error message. If you're
-- cool, partially apply the type constructor to get new
-- type.
--
type Result = Either String

-- Define a version of Data.List.find that returns a Result.
-- It should return an error if the list is no matching element
-- is found, with appropriate messages in each case.

find :: (a -> Bool) -> [a] -> Result a
find _ [] = Left "Unable to find item in empty list"
find f xs = find' f xs
  where find' _ [] = Left "No such item found"
        find' f (x:xs) | f x = Right x
                       | otherwise = find' f xs


