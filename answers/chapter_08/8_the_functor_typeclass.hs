-- Define a functions encrypt and decrypt character
-- data inside *any* Functor using Caesar cipher with
-- a shift 13.
--

import Data.Char

encrypt :: Functor f => f Char -> f Char
encrypt = fmap (chr . (+13) . ord)

decrypt :: Functor f => f Char -> f Char
decrypt = fmap (chr . (subtract 13) . ord)

-- Define instances for Functor for your Box and Carton
-- types. Once you've done that, try out using encrypt
-- on some Boxes and Cartons to protect their contents.
--

data Box a = Zero | One a | Two a a deriving (Show)
data Carton a = Empty | Item a | Divider (Carton a) (Carton a)
  deriving (Show)

instance Functor Box where
  fmap _ Zero = Zero
  fmap f (One x) = One (f x)
  fmap f (Two x y) = Two (f x) (f y)

protectedBox = encrypt (Two 'h' 'i')

instance Functor Carton where
  fmap _ Empty = Empty
  fmap f (Item x) = Item (f x)
  fmap f (Divider c c') = Divider (fmap f c) (fmap f c')

protectedCarton = encrypt (Divider (Divider (Item 'h') (Item 'e'))
                                   (Item 'y'))

