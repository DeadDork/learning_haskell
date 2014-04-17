sqrtSums :: (Enum a, Floating a, Ord a) => a -> Int -- I had to :t the types for this function
sqrtSums n = length (takeWhile (<n) (scanl1 (+) (map sqrt [1..])))
