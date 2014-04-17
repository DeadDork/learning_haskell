sum' :: (Num a) => [a] -> a
sum' xs = foldl (\ a  x -> a + x) 0 xs
