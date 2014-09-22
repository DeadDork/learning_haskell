-- Uses Dickson's method to generate pythagorean triples.

import Data.Natural

main :: IO ()
main = print $ f 1000

f :: Natural -> (Natural, (Natural, Natural, Natural))
f n | n < 12    = error "The smallest match is 3 + 4 + 5 = 12"
    | otherwise = head . filter (\ (p, (a, b, c)) -> a + b + c == n) $ triplets

triplets :: [(Natural, (Natural, Natural, Natural))]
triplets = concat . map dicksonMethod . filter (\ x -> x^2 `mod` 2 == 0) $ [2..]

dicksonMethod :: Natural -> [(Natural, (Natural, Natural, Natural))]
dicksonMethod r = map (\ (s, t) -> let x = r + s
                                       y = r + t
                                       z = r + s + t
                                   in (x * y * z, (x, y, z))) $ factorPairs (r^2 `div` 2)

factorPairs :: Natural -> [(Natural, Natural)]
factorPairs 0 = error "All numbers are factors of 0"
factorPairs 1 = [(1,1)]
factorPairs n = factorPairs' n [1..]

factorPairs' :: Natural -> [Natural] -> [(Natural, Natural)]
factorPairs' n (x:xs) | b < a          = []
                      | n `mod` x == 0 = (a, b) : factorPairs' n xs
                      | otherwise      = factorPairs' n xs
    where a = x
          b = n `div` x
