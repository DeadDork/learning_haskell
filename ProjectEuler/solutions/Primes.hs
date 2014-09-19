module Primes
( prime
, primes
, factors
, Natural
) where

import Data.Natural

prime :: Natural -> Bool
prime 0 = False
prime 1 = False
prime n = prime' primes n

prime' :: [Natural] -> Natural -> Bool
prime' (x:xs) y | x == y    = True
                | x < y     = prime' xs y
                | otherwise = False
 
primes :: [Natural]
primes = sieve (\ x y -> y `mod` x /= 0) [2..]
 
sieve :: (Natural -> Natural -> Bool) -> [Natural] -> [Natural]
sieve _ [] = []
sieve f (x:xs) = x : sieve f (filter (f x) xs)

factors :: Natural -> [Natural]
factors 0 = error "Every number is a factor of zero (e.g. 5 x 0 = 0)"
factors n = factors' n primes

factors' :: Natural -> [Natural] -> [Natural]
factors' 1 _ = [1]
factors' n (x:xs) | n `mod` x == 0 = x : factors' (n `div` x) (x:xs)
                  | otherwise      = factors' n xs
