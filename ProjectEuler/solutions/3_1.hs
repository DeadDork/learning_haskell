-- Curious to try out the Sieve of Erastosthenes + lazy evaluation on this.

sieve :: (a -> a -> Bool) -> [a] -> [a]
sieve f [] = []
sieve f (x:xs) = x : sieve f (filter (f x) xs)

primes :: [Integer]
primes = sieve (\ x y -> y `mod` x /= 0) [2..]

-- Largest Prime Factor
-- (many breaking edge cases, so be sure to be
-- smart about the inputs)
lpt :: Integer -> [Integer] -> Integer
lpt n (x:xs) | x == n = x
             | n `mod` x == 0 = lpt (n `div` x) (x:xs)
             | otherwise = lpt n xs

-- Demo:
-- ghci> primeFactor 13195 primes
-- 29
-- ghci> primeFactor 600851475143 primes
-- 6857
