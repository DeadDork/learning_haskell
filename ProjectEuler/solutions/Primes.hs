module Primes
( prime
, primes
) where

prime :: Integer -> Bool
prime = prime' primes

prime' :: [Integer] -> Integer -> Bool
prime' (x:xs) y | x == y    = True
                | x < y     = prime' xs y
                | otherwise = False
 
primes :: [Integer]
primes = sieve (\ x y -> y `mod` x /= 0) [2..]
 
sieve :: (Integer -> Integer -> Bool) -> [Integer] -> [Integer]
sieve _ [] = []
sieve f (x:xs) = x : sieve f (filter (f x) xs)
