import Primes

main :: IO ()
main = print $ nthPrime (10001 - 1) -- nthPrime is 0-based index

nthPrime :: Natural -> Natural
nthPrime n = primes !! i
    where i = fromIntegral n :: Int
