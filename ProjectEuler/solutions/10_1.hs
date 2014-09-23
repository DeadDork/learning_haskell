import Primes

main :: IO ()
main = print $ primeSumBelow 2000000

primeSumBelow :: Natural -> Natural
primeSumBelow n = sum $ takeWhile (< n) primes
