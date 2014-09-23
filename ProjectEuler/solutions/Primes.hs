module Primes
( isPrime
, primes
, factors
, Natural
) where

import Data.Map.Lazy as Map
import Data.Natural

isPrime :: Natural -> Bool
isPrime n =
    let isPrime' _ [] = False
        isPrime' n (x:xs) | n == x    = True
                          | n < x     = False
                          | otherwise = isPrime' n xs
    in isPrime' n primes

primes :: [Natural]
primes =
    let sieve xs = sieve' xs Map.empty
        sieve' [] _ = []
        sieve' (x:xs) table = case Map.lookup x table of
            Nothing      -> x : sieve' xs (Map.insert (x^2) [x] table)
            Just factors -> sieve' xs (Prelude.foldl (reinsert x) (Map.delete x table) factors)
        reinsert x table p = Map.insertWith (++) (x + p) [p] table
    in sieve [2..]

factors :: Natural -> [Natural]
factors 0 = error "Every number is a factor of zero (e.g. 5 x 0 = 0)"
factors n =
    let factors' 1 _ = [1]
        factors' n (x:xs) | n `mod` x == 0 = x : factors' (n `div` x) (x:xs)
                          | otherwise      = factors' n xs
    in factors' n primes
