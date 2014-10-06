-- Saddlesort

-- Problem: given an increasing function f that takes two natural numbers
-- and returns a natural number (i.e. f(x,0) > x && f(0,y) > y), find all
-- the pairs that result in a number z.

{- Naive implementation
-- Runs at (z + 1)^2 in the worst case.

import Data.Natural

invert :: (Natural -> Natural -> Natural) -> Natural -> [(Natural,Natural)]
invert f z = [(x,y) | x <- [0..z], y <- [0..z], f x y == z]
-}

{- Minor optimization
-- Runs at ((z + 1)^2)/2 in the worst case.

import Data.Natural

invert :: (Natural -> Natural -> Natural) -> Natural -> [(Natural,Natural)]
invert f z = [(x,y) | x <- [0..z], y <- [0..(z - x)], f x y == z]
-}

{- Saddleback search algorithm
-- Runs at 2z + 1 in the worst case.
-- N.B. Had to switch to Integer here, as I need to use negative numbers.

invert :: (Integer -> Integer -> Integer) -> Integer -> [(Integer,Integer)]
invert f z = find (0,z) f z

find :: (Integer,Integer) -> (Integer -> Integer -> Integer) -> Integer ->
        [(Integer,Integer)] 
find (u,v) f z  | u > z || v < 0    = []
                | z' < z            = find (u + 1, v) f z
                | z' == z           = (u,v) : find (u + 1, v - 1) f z
                | z' > z            = find (u, v - 1) f z
                where z'            = f u v
-}

{- Minor optimization
-- Runs at 2log(z) + m + n

invert :: (Integer -> Integer -> Integer) -> Integer -> [(Integer,Integer)]
invert f z = find (0,m) n f z
    where   m = bsearch (\ y -> f 0 y) (-1, z + 1) z
            n = bsearch (\ x -> f x 0) (-1, z + 1) z

find :: (Integer,Integer) -> Integer -> (Integer -> Integer -> Integer) ->
        Integer -> [(Integer,Integer)]
find (u,v) n f z    | u > n || v < 0    = []
                    | z' < z            = find (u + 1, v) n f z
                    | z' == z           = (u,v) : find (u + 1, v - 1) n f z
                    | z' > z            = find (u, v - 1) n f z
                    where   z'          = f u v

bsearch :: (Integer -> Integer) -> (Integer,Integer) -> Integer -> Integer
bsearch g (a,b) z   | a + 1 == b    = a
                    | g m <= z      = bsearch g (a,m) z
                    | otherwise     = bsearch g (m,b) z
                    where m         = (a + b) `div` 2
-}

--{- Binary search
-- Fastest possible time for combination search, namely O(mlog(n/m)).

invert :: (Integer -> Integer -> Integer) -> Integer -> [(Integer,Integer)]
invert f z = find (0,m) (n,0) f z
    where m = bsearch (\ y -> f 0 y) (-1, z + 1) z
          n = bsearch (\ x -> f x 0) (-1, z + 1) z

find :: (Integer,Integer) -> (Integer,Integer) -> 
        (Integer -> Integer -> Integer) -> Integer -> [(Integer,Integer)] 
find (u,v) (r,s) f z
    | u > r || v < s        = []
    | v - s <= r - u        = rowFind $ bsearch (\ x -> f x q) (u - 1, r + 1) z
    | otherwise             = columnFind $ bsearch (\ y -> f p y) (s - 1, v + 1) z
    where   p               = (u + r) `div` 2
            q               = (v + s) `div` 2
            rowFind p       = (if f p q == z
                               then (p,q) : find (u,v) (p - 1, q + 1) f z
                               else find (u,v) (p, q + 1) f z) ++
                              find (p + 1, q - 1) (r,s) f z
            columnFind q    = find (u,v) (p - 1, q + 1) f z ++
                              (if f p q == z
                               then (p,q) : find (p + 1, q - 1) (r,s) f z
                               else find (p + 1, q) (r,s) f z)

bsearch :: (Integer -> Integer) -> (Integer,Integer) -> Integer -> Integer
bsearch g (a,b) z   | a + 1 == b    = a
                    | g m <= z      = bsearch g (m,b) z
                    | otherwise     = bsearch g (a,m) z
                    where m         = (a + b) `div` 2
--}
