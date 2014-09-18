-- Tests the Primes library.

import Primes

main = do putStrLn $ primeTest 10
          putStrLn $ primeTest 17

primeTest :: Integer -> String
primeTest x | prime x = show x ++ " is a prime number"
            | otherwise = show x ++ " is not a prime number"
