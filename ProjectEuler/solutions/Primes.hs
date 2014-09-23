module Primes
( isPrime
, primes
, factors
, Natural
) where

import qualified Data.Map.Lazy as Map
import qualified Data.PQueue.Prio.Min as PQ
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
            Just factors -> sieve' xs (foldl (reinsert x) (Map.delete x table) factors)
        reinsert x table p = Map.insertWith (++) (x + p) [p] table
    in sieve [2..]

-- Uses a more appropriate data structure, but it's less optimized than
-- a map.
primes' :: [Natural]
primes' =
    let sieve [] = []
        sieve (p:xs) = p : sieve' xs (insertPrime p xs PQ.empty)
        sieve' [] _ = []
        sieve' (x:xs) pq | x < nextComposite pq = x : sieve' xs (insertPrime x xs pq)
                         | otherwise            = sieve' xs (adjust x pq)
        insertPrime p xs pq = PQ.insert (p^2) (map (p *) xs) pq
        nextComposite pq = let Just (k, _) = PQ.getMin pq in k
        adjust c pq | c == nextComposite pq = adjust c (updateMin' pq)
                    | otherwise             = pq
        updateMin' pq =
            let ((_, v), newQ) = PQ.deleteFindMin pq
            in PQ.insert (head v) (tail v) newQ
    in sieve [2..]

factors :: Natural -> [Natural]
factors 0 = error "Every number is a factor of zero (e.g. 5 x 0 = 0)"
factors n =
    let factors' 1 _ = [1]
        factors' n (x:xs) | n `mod` x == 0 = x : factors' (n `div` x) (x:xs)
                          | otherwise      = factors' n xs
    in factors' n primes
