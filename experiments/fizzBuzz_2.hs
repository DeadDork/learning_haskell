-- Fizz Buzz with list comprehension

fizzBuzz :: (Integral a, Show a) => [a] -> [String]
fizzBuzz xs = [fB x | x <- xs]

fB :: (Integral a, Show a) => a -> String
fB x
    | x `mod` 15 == 0 = "Fizz Buzz"
    | x `mod` 3 == 0 = "Fizz"
    | x `mod` 5 == 0 = "Buzz"
    | otherwise = show x
