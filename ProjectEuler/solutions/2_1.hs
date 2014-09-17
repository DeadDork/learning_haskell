iterate2 :: (a -> a -> a) -> a -> a -> [a]
iterate2 f x y = y : iterate2 f y (x `f` y)

fibList :: [Integer]
fibList = iterate2 (+) 0 1

sumEvenFib :: Integer -> Integer
sumEvenFib n = sum . filter even . takeWhile (\ x -> x < n) $ fibList
