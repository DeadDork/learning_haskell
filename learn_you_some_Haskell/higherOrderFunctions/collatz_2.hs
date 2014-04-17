collatz :: (Integral a) => a -> [a]
collatz x
    | x < 1 = error "Must be a natural number (can't wait to learn how to make custom typeclasses)"
    | x == 1 = [1]
    | odd x = x : collatz (x*3 + 1)
    | even x = x : collatz (x `div` 2)

countChains :: ([a] -> Bool) -> (a -> [a]) -> [a] -> Int
countChains _ _ [] = 0
countChains p f xs = length (filter p (map f xs))

countCollatzChains :: (Integral a) => [a] -> Int
countCollatzChains xs = countChains (\ ys -> length ys > 15) collatz xs
