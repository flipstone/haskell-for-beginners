-- Re-implement your complex number solution from section
-- 1 to work with complex numbers for any numeric (Num) type.
--

data Complex a = Complex a a deriving (Show)

add :: Num a => Complex a -> Complex a -> Complex a
add (Complex a b) (Complex c d) = Complex (a + c) (b + d)

sub :: Num a => Complex a -> Complex a -> Complex a
sub (Complex a b) (Complex c d) = Complex (a - c) (b - d)

mult :: Num a => Complex a -> Complex a -> Complex a
mult (Complex a b) (Complex c d) = Complex (a*c - b*d) (b*c + a*d)

divide :: Fractional a => Complex a -> Complex a -> Complex a
divide (Complex a b) (Complex c d) = Complex real imaginary
  where real = (a*c + b*d) / denom
        imaginary = (b*c - a*d) / denom
        denom = c*c + d*d


-- Define a Box type that can hold 0, 1 or 2 items of
-- another type. Define a boxMap function analogous to
-- map on lists for the box type.
--
data Box a = Zero | One a | Two a a deriving (Show)

boxMap :: (a -> b) -> Box a -> Box b
boxMap _ Zero = Zero
boxMap f (One a) = One (f a)
boxMap f (Two a a') = Two (f a) (f a')


-- Define a Crate type that can be empty, hold one thing
-- of a type, one thing of another type, or one thing of each
-- of those types. (i.e. it's like a Box, but when holding two
-- items they don't have to be the same type).
--
-- Define a Crate function that flips order of the *types*
-- in the crate. I.E. The type of a Crate holding an Int and
-- a String would change to the type of a Crate holding a String
-- and an Int, even if the Crate was only holding one item.
--
data Crate a b = Empty | ACrate a | BCrate b | ABCrate a b deriving (Show)

flipCrate :: Crate a b -> Crate b a
flipCrate Empty = Empty
flipCrate (ACrate a) = BCrate a
flipCrate (BCrate b) = ACrate b
flipCrate (ABCrate a b) = ABCrate b a

