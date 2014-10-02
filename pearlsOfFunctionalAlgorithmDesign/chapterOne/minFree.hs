import NaturalArray

{- Runs in O(n^2).
minFree :: [Natural] -> Natural
minFree xs = head $ [0..] \\ xs
-}

{- Runs in O(n)
minFree :: [Natural] -> Natural
minFree = search . checklist

search :: Array Natural Bool -> Natural
search = toNatural . length . takeWhile id . elems

checklist :: [Natural] -> Array Natural Bool
checklist xs = accumArray (||) False (0,n) $ zip (filter (<= n) xs) (repeat True)
    where n = toNatural $ length xs

toNatural :: (Integral a) => a -> Natural
toNatural i = fromIntegral i :: Natural
--}

{- More modular.
{- For instance, you can use countList for sort
sort :: [Natural] -> [Natural]
sort xs = concat [ replicate k x | (x,k) <- assocs $ countList xs]
-}

countList :: [Natural] -> Array Natural Int
countList xs = accumArray (+) 0 (0,n) (zip xs $ repeat 1)
    where n = maximum xs

-- Array -> List seems totally redundant, but I can't find a way to filter
-- arrays.
minFree :: [Natural] -> Natural
minFree xs =
    let (k,v) = head $ filter (\ (k,v) -> v == 0) $ assocs $ countList xs
    in k
-}

--{- Best time, but more limited
-- No duplicate values
import Data.List (partition)
minFree :: [Natural] -> Natural
minFree xs = minFrom 0 (lengthn xs, xs)

minFrom :: Natural -> (Natural, [Natural]) -> Natural
minFrom a (n, xs)   | n == 0        = a
                    | m == b - a    = minFrom b (n - m, vs)
                    | otherwise     = minFrom a (m, us)
                      where (us,vs) = partition (< b) xs
                            b       = a + 1 + n `div` 2
                            m       = lengthn us

lengthn :: (Integral a) => [a] -> Natural
lengthn xs =    let l = length xs
                in fromIntegral l :: Natural
--}
