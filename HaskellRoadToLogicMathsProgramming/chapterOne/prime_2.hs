-- Checks if a natural number is a prime number.

-- Mega recursive. Honestly, I'm not really getting this.

prime :: Integer -> Bool
prime n | n < 1 = error "Not a natural number."
        | n == 1 = False
        | otherwise = ldp n == n

ldp :: Integer -> Integer
ldp n = ldpf primes1 n

ldpf :: [Integer] -> Integer -> Integer
ldpf (p:ps) n | n `mod` p == 0 = p
              | p^2 > n = n
              | otherwise = ldpf ps n

primes1 :: [Integer]
primes1 = 2 : filter prime [3..]
