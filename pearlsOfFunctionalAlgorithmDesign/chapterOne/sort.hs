-- Tried to figure out this sort.

-- It works by creating buckets from 0 to n, then goes through the unsorted list
-- and puts each element into its respective bucket (e.g. each list element 2
-- increments the index 2 array element by one). At the end of the list, this is
-- reversed, with each index x array being replicated by the element.

import NaturalArray

sort :: [Natural] -> [Natural]
sort xs = concat [ replicate k x | (x,k) <- assocs $ countList xs]

countList :: [Natural] -> Array Natural Int
countList xs = accumArray (+) 0 (0,n) (zip xs $ repeat 1)
    where n = maximum xs
