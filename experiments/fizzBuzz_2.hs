fizzBuzz :: (Integral a, Show a) => [a] -> [[Char]]
fizzBuzz xs = [fB x | x <- xs]
fB :: (Integral a, Show a) => a -> [Char]
fB x
    | x `mod` 15 == 0 = "Fizz Buzz"
    | x `mod` 3 == 0 = "Fizz"
    | x `mod` 5 == 0 = "Buzz"
    | otherwise = show x
