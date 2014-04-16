-- Protects against errors
collatz :: (Integral a) => a -> [a]
collatz n
    | n < 1 = error "You have to use natural numbers! (I wish I could do this with a custom Natural type...)"
collatz 1 = [1]
collatz n
    | odd n  = n:collatz (n*3 + 1)
    | even n = n:collatz (n `div` 2)

-- More general function
numLongChains :: ([a] -> Bool) -> (a -> [a]) -> [a] -> Int
numLongChains _ _ [] = 0
numLongChains p f xs = length (filter p (map f xs))

-- Specific function
numLongCollatz xs = numLongChains p f xs
    where p ys = length ys > 15
          f x = collatz x
