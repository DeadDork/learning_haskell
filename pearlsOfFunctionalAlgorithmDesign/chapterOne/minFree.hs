import NaturalArray

{- Runs in O(n^2).
minFree :: [Natural] -> Natural
minFree xs = head $ [0..] \\ xs
-}

--{- Runs in O(n)
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
