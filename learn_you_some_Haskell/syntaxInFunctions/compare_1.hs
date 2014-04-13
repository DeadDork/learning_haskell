myCompare :: (Ord a) => a -> a -> Ordering
a `myCompare` b
    | a < b      = LT
    | a == b     = EQ
    | otherwise  = GT
