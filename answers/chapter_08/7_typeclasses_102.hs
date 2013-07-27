data Actor = DeNiro | Ferell | Stewart deriving (Eq, Show)

-- Define an instance of Ord for Actor that will
-- sort the Actors by how cool they are.

instance Ord Actor where
  compare a b | a == b = EQ
  compare Stewart _ = GT
  compare _ Stewart = LT
  compare DeNiro _ = GT
  compare _ DeNiro = LT

-- Using your Complex type from earlier, explicitly
-- define an instance of Eq for it
--
data Complex a = Complex a a deriving (Show)

instance Eq a => Eq (Complex a) where
  (Complex a b) == (Complex c d) = a == c && b == d


-- Define a Container typeclass that defines an interface
-- for unpacking a single item from any container type.
-- Define instances of Container for Maybe, [], Box, and Carton.
--
data Box a = Zero | One a | Two a a deriving (Show)
data Carton a = Empty | Item a | Divider (Carton a) (Carton a)
  deriving (Show)

class Container c where
  unpack :: c a -> Maybe a

instance Container Maybe where
  unpack = id

instance Container [] where
  unpack [] = Nothing
  unpack (x:_) = Just x

instance Container Box where
  unpack Zero = Nothing
  unpack (One x) = Just x
  unpack (Two x _) = Just x

instance Container Carton where
  unpack Empty = Nothing
  unpack (Item x) = Just x
  unpack (Divider c c') =
    case unpack c of
      Just x -> Just x
      Nothing -> unpack c'

