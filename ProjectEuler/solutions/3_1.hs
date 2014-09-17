-- Curious to try out the Sieve of Erastosthenes + lazy evaluation on this.

main = putStrLn $ show $ largestPrimeFactor 600851475143

largestPrimeFactor :: Integer -> Integer
largestPrimeFactor n = lpf n primes

lpf :: Integer -> [Integer] -> Integer
lpf n (x:xs) | x == n = x
             | n `mod` x == 0 = lpf (n `div` x) (x:xs)
             | otherwise = lpf n xs

primes :: [Integer]
primes = sieve (\ x y -> y `mod` x /= 0) [2..]

sieve :: (a -> a -> Bool) -> [a] -> [a]
sieve f [] = []
sieve f (x:xs) = x : sieve f (filter (f x) xs)
