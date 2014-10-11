-- Problem: given two disjoint sets of ordered elements, what is the k-th
-- element of their union?

-- Common functions

-- NB assumes xs & ys are sorted & disjoint, so no case for x == y.
{-
union :: (Ord a) => [a] -> [a] -> [a]
union xs [] = xs
union [] ys = ys
union (x:xs) (y:ys) | x < y = x : union xs (y:ys)
                    | x > y = y : union (x:xs) ys 
-}

{- Naive algorithm
-- Runs in O(k)
smallest :: (Ord a) => Int -> ([a],[a]) -> a
smallest k (xs,ys) = (union xs ys) !! k
-}

{- Divide & conquer algorithm
-- Runs in O(n) on the length of xs or ys.
smallest :: (Ord a) => Int -> ([a],[a]) -> a
smallest k (ws,[]) = ws !! k
smallest k ([],zs) = zs !! k
smallest k (ws,zs) =
    case (a < b, k <= (p + q)) of
        (True,True)     -> smallest k (ws,us)
        (True,False)    -> smallest (k - p - 1) (ys,zs)
        (False,True)    -> smallest k (xs,zs)
        (False,False)   -> smallest (k - q - 1) (ws,vs)
    where   p               = length ws `div` 2
            q               = length zs `div` 2
            (xs, a:ys)  = splitAt p ws
            (us, b:vs)  = splitAt q zs
-}

--{- Divide & conquer algorithm with arrays.
-- Runs in O(log(n)).

import Data.Array

smallest :: (Ord a) => Int -> ([a],[a]) -> a
smallest k (xs,ys) = smallest' k (listArray (0, length xs - 1) xs, listArray (0, length ys - 1) ys)

smallest' :: (Ord a) => Int -> (Array Int a, Array Int a) -> a
smallest' k (xa,ya) = search k (0, m + 1) (0, n + 1)
    where   (0,m)   = bounds xa
            (0,n)   = bounds ya
            search k (lx,rx) (ly,ry)
                | lx == rx  = ya ! k
                | ly == ry  = xa ! k
                | otherwise = case (a < b, k <= mx + my) of
                    (True,True)     -> search k (lx,rx) (ly,my)
                    (True,False)    -> search (k - mx - 1) (mx,rx) (ly,ry)
                    (False,True)    -> search k (lx,mx) (ly,ry)
                    (False,False)   -> search (k - my - 1) (lx,rx) (my,ry)
                    where   mx  = (lx + rx) `div` 2
                            my  = (ly + ry) `div` 2
                            a   = xa ! mx
                            b   = ya ! my
--}
