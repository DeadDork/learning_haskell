sumMultiples :: Integer -> Integer
sumMultiples n = sum [x | x <- [1..(n - 1)], 3 `divides` x || 5 `divides` x]

divides :: Integer -> Integer -> Bool
0 `divides` _ = error "Divide by zero"
m `divides` n = n `mod` m == 0
