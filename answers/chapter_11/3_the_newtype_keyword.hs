import Data.List (sort)

-- Declare a new type, DescedingInt, that wraps an Int.
-- Derive an EQ instance for it.
--
newtype DescendingInt = DescendingInt { getInt :: Int } deriving Eq


-- Declare an Ord instance for DescendingInt that will
-- sort the integers in descending order, rather than ascending.
--
instance Ord DescendingInt where
  (DescendingInt n) `compare` (DescendingInt m) = m `compare` n


-- Use sort to sort the list of integers below in descending
-- order using your DescedingInt type.
--
descending :: [Int]
descending = map getInt $ sort $ map DescendingInt $ [5,1,3,10,9,6]


-- Construct a new type, Descending, which is like DescedingInt
-- but can be used with any orderable type.
--
newtype Descending a = Descending { getDesc :: a } deriving Eq

instance Ord a => Ord (Descending a) where
  (Descending n) `compare` (Descending m) = m `compare` n

-- Define a function, sortDescending, that using your Descending
-- type to sort any orderable type in descending order.
--
sortDescending :: Ord a => [a] -> [a]
sortDescending = map getDesc . sort . map Descending


-- Demonstrate the difference in laziness between these two types.
--
data DataType = DataType Int
newtype NewType = NewType Int

lazyDemo1 (DataType _) = "DataType"
lazyDemo2 (NewType _) = "NewType"

anError = lazyDemo1 undefined
noError = lazyDemo2 undefined

