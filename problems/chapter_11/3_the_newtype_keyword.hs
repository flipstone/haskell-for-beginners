import Data.List (sort)

-- Declare a new type, DescedingInt, that wraps an Int.
-- Derive an EQ instance for it.
--


-- Declare an Ord instance for DescendingInt that will
-- sort the integers in descending order, rather than ascending.
--


-- Use sort to sort the list of integers below in descending
-- order using your DescedingInt type.
--


-- Construct a new type, Descending, which is like DescedingInt
-- but can be used with any orderable type.
--

-- Define a function, sortDescending, that using your Descending
-- type to sort any orderable type in descending order.
--


-- Demonstrate the difference in laziness between these two types.
--
data DataType = DataType Int
newtype NewType = NewType Int

