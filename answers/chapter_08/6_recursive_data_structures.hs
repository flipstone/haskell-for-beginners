-- Define a Carton type that is similar to your
-- Box type from earlier, but which is recursive.
-- Instead of being able to contain two items, it
-- should be able to contain two Cartons.

data Carton a = Empty | One a | Two (Carton a) (Carton a)
  deriving (Show)

-- Define a version of map for Cartons.

cartonMap :: (a -> b) -> Carton a -> Carton b
cartonMap _ Empty = Empty
cartonMap f (One a) = One (f a)
cartonMap f (Two c1 c2) = Two (cartonMap f c1) (cartonMap f c2)

-- Define a version of filter for Cartons

cartonFilter :: (a -> Bool) -> Carton a -> Carton a
cartonFilter _ Empty = Empty
cartonFilter f c@(One a) | f a = c
                         | otherwise = Empty
cartonFilter f (Two c1 c2) = Two (cartonFilter f c1) (cartonFilter f c2)

-- Define a version of find for Cartons

cartonFind :: (a -> Bool) -> Carton a -> Maybe a
cartonFind _ Empty = Nothing
cartonFind f (One a) | f a = Just a
                     | otherwise = Nothing
cartonFind f (Two c1 c2) =
  case cartonFind f c1 of
    (Just a) -> Just a
    Nothing -> cartonFind f c2

