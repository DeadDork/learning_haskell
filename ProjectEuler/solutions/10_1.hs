-- Too slow.

-- The Sieve of Erastosthenes uses up too much memory.

import Primes

main :: IO ()
main = print $ f 2000000

f :: Natural -> Natural
f n = f' primes n

f' :: [Natural] -> Natural -> Natural
f' (x:xs) n | x > n = 0
            | otherwise = x + (f' xs n)
