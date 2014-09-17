-- I thought this would be faster. It's not.

main = putStrLn $ show $ largestPrimeFactor 600851475143

largestPrimeFactor :: Integer -> Integer
largestPrimeFactor n = lpf n primes

lpf :: Integer -> [Integer] -> Integer
lpf n (x:xs) | n `mod` x == 0 && x >= n `div` x = x
             | n `mod` x == 0 && x >= lpf (n `div` x) primes = x
             | n `mod` x == 0 && x < lpf (n `div` x) primes = lpf (n `div` x) primes
             | otherwise = lpf n xs

primes :: [Integer]
primes = sieve (\ x y -> y `mod` x /= 0) [2..]

sieve :: (a -> a -> Bool) -> [a] -> [a]
sieve f [] = []
sieve f (x:xs) = x : sieve f (filter (f x) xs)
