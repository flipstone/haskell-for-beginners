-- Define a Carton type that is similar to your
-- Box type from earlier, but which is recursive.
--
-- Instead of being able to contain two items, it
-- should be able to contain a divider with a Carton
-- on each side.

data Carton a = Empty | Item a | Divider (Carton a) (Carton a)
  deriving (Show)

-- Define a version of map for Cartons.

cartonMap :: (a -> b) -> Carton a -> Carton b
cartonMap _ Empty = Empty
cartonMap f (Item a) = Item (f a)
cartonMap f (Divider c1 c2) = Divider (cartonMap f c1) (cartonMap f c2)

-- Define a version of filter for Cartons

cartonFilter :: (a -> Bool) -> Carton a -> Carton a
cartonFilter _ Empty = Empty
cartonFilter f c@(Item a) | f a = c
                          | otherwise = Empty
cartonFilter f (Divider c1 c2) = Divider (cartonFilter f c1) (cartonFilter f c2)

-- Define a version of find for Cartons

cartonFind :: (a -> Bool) -> Carton a -> Maybe a
cartonFind _ Empty = Nothing
cartonFind f (Item a) | f a = Just a
                      | otherwise = Nothing
cartonFind f (Divider c1 c2) =
  case cartonFind f c1 of
    (Just a) -> Just a
    Nothing -> cartonFind f c2

