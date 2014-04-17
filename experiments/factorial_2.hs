factorial :: (Integral a) => a -> a
factorial n
    | n < 0 = error "n must be greater than or equal to 0."
    | otherwise = foldl (*) 1 [1..n]
