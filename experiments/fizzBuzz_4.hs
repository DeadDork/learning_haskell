--Nope, doesn't work either
fizzBuzz :: (Integral a) => [a] -> [String]
fizzBuzz xs = [ fb x | x <- xs ]
    where fb y --I had the not-so-brilliant idea to use a new variable
        | y `mod` 15 == 0 = "Fizz Buzz"
        | y `mod` 3 == 0  = "Fizz"
        | y `mod` 5 == 0  = "Buzz"
        | otherwise         = show y
