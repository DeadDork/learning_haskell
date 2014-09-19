import Data.List
import Data.Natural
import Primes

main :: IO ()
main = putStrLn $ show $ smallestMultiple [1..20]

smallestMultiple :: [Natural] -> Natural
smallestMultiple xs = smallestMultiple' xs

smallestMultiple' :: [Natural] -> Natural
smallestMultiple' xs
    | xs == []    = error "Empty list"
    | 0 `elem` xs = 0
    | otherwise   = product . foldl (\ a x -> (x \\ a) ++ a) [1] $ map factors xs
