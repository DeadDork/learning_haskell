factorial :: (Integral a) => a -> a
factorial n
    | n < 0 = error "n must be equal to or greater than 0"
    | otherwise = foldl (\ a x -> a * x) 1 [1..n]
