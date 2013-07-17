-- Define a data type that represents a Complex number:
--   http://en.wikipedia.org/wiki/Complex_number
--   Use Floats simplicity
--

data Complex = Complex Float Float deriving (Show)

-- Define add, sub, mult, and divide for Complex numbers

add :: Complex -> Complex -> Complex
add (Complex a b) (Complex c d) = Complex (a + c) (b + d)

sub :: Complex -> Complex -> Complex
sub (Complex a b) (Complex c d) = Complex (a - c) (b - d)

mult :: Complex -> Complex -> Complex
mult (Complex a b) (Complex c d) = Complex (a*c - b*d) (b*c + a*d)

divide :: Complex -> Complex -> Complex
divide (Complex a b) (Complex c d) = Complex real imaginary
  where real = (a*c + b*d) / denom
        imaginary = (b*c - a*d) / denom
        denom = c*c + d*d


-- Define a set of data types allowing sandwiches to be constructed.
-- A sandwich include a choice of bread (bun or roll), patty (beef,
-- chicke, or veggie) and any numbers of toppings (ketchup, mustard,
-- cheese, lettuce, and tomato).
--
-- When you're done, you should be able to construct a sandwich like this:
--   plain Roll Veggie `with` Cheese `with` Tomato `with` Ketchup
--

data Topping = Ketchup | Mustard | Cheese | Lettuce | Tomato deriving (Show)
data Patty = Beef | Chicken | Veggie deriving (Show)
data Bread = Bun | Roll deriving (Show)
data Sandwich = Sandwich Bread Patty [Topping] deriving (Show)

plain :: Bread -> Patty -> Sandwich
plain b p = Sandwich b p []

with :: Sandwich -> Topping -> Sandwich
with (Sandwich b p ts) t = Sandwich b p (t:ts)


-- Define a function to calculate the damage done (as an int)
-- by a fighter in a fight, at a certain range to their target.
--
--   * A fighter has some amount of strength and is armed in some way.
--   * A sword has a damage value.
--   * A bow has a range value and a damage value.
--   * A fighter armed only fists deals their strength in damage.
--   * A fighter armed with a sword deals their strength + the
--     the damage value for the sword.
--   * A fighter armed with a bow deals the bow's damage value.
--   * A fighter armed with fists or a sword does no damage beyond range 0.
--   * A fighter armed with a bow deals no damage beyond the bow's range.
--

data Weapon = Fists | Sword Int | Bow Range Int
data Strength = Strength Int
data Range = Range Int
data Fighter = Fighter Strength Weapon

damage :: Fighter -> Range -> Int
damage (Fighter (Strength s) Fists) (Range 0) = s
damage (Fighter (Strength s) (Sword w)) (Range 0) = w + s
damage (Fighter _ (Bow (Range r) d)) (Range t) | r >= t = d
damage _ _ = 0

