-- I was having a bit of an issue with my intuition for the lazy evaluation here.
-- It's kosher, though!

import Debug.Trace

primes :: [Integer]
primes = sieve (\ x y -> trace ("(" ++ show x ++ "," ++ show y ++ ")") $ y `mod` x /= 0) [2..]

sieve :: (a -> a -> Bool) -> [a] -> [a]
sieve f [] = []
sieve f (x:xs) = x : sieve f (filter (f x) xs)

-- E.G.
-- ghci> take 5 primes
-- [2(2,3) -- 2 : sieve (3 `mod` 2 /= 0 && no more primes, so 3)
-- ,3(2,4) -- 3 : sieve (4 `mod` 2 == 0, so next N)
-- (2,5)   -- sieve (5 `mod` 2 /= 0, so check with next prime)
-- (3,5)   -- sieve (5 `mod` 3 /= 0 && no more primes, so 5)
-- ,5(2,6) -- 5 : sieve (6 `mod` 2 == 0, so next N)
-- (2,7)   -- sieve (7 `mod` 2 /= 0, so check with next prime)
-- (3,7)   -- sieve (7 `mod` 3 /= 0, so check with next prime)
-- (5,7)   -- sieve (7 `mod` 5 /= 0 && no more primes, so 7)
-- ,7(2,8) -- 7 : sieve (8 `mod` 2 == 0, so next N)
-- (2,9)   -- sieve (9 `mod` 2 /= 0, so check with next prime)
-- (3,9)   -- sieve (9 `mod` 3 == 0, so check with next N)
-- (2,10)  -- sieve (10 `mod` 2 == 0, so check with next N)
-- (2,11)  -- sieve (11 `mod` 2 /= 0, so check with next prime)
-- (3,11)  -- sieve (11 `mod` 3 /= 0, so check with next prime)
-- (5,11)  -- sieve (11 `mod` 5 /= 0, so check with next prime)
-- (7,11)  -- sieve (11 `mod` 7 /= 0 && no more primes, so 11)
-- ,11]    -- 11 : []
