--Did not work
fizzBuzz :: (Integral a) => [a] -> [String]
fizzBuzz xs = [fb x | x <- xs]
    where fb x
        | x `mod` 15 == 0 = "Fizz Buzz"
        | x `mod` 3 == 0  = "Fizz"
        | x `mod` 5 == 0  = "Buzz"
        | otherwise       = show x
