-- Wrong

import Data.Natural
import Primes

main = putStrLn $ show $ largestPalindromicNumber 3

largestPalindromicNumber :: Natural -> [Natural]
largestPalindromicNumber n =
    head . filter (factorsLength n) . map reverse . map factors $ palindromicNumbers n

palindromicNumbers :: Natural -> [Natural]
palindromicNumbers 0 = error "Length of palindrome must be greater than 1"
palindromicNumbers 1 = error "Length of palindrome must be greater than 1"
palindromicNumbers n = palindromeList $ biggestPalindrome $ (10^n - 1)^2

palindromeList :: Natural -> [Natural]
palindromeList p | p == 11   = [p]
                 | otherwise = p : palindromeList (nextPalindrome p)

nextPalindrome :: Natural -> Natural
nextPalindrome n = nextPalindrome' (n - 1) 0 (lastIndex n)
    where lastIndex x = toNatural $ (length $ show n) - 1

nextPalindrome' :: Natural -> Natural -> Natural -> Natural
nextPalindrome' n l r
    | n < 11                 = error "11 is the last palindromic natural number"
    | r - l <= 1 && ll == rr = n
    | ll == rr               = nextPalindrome' n (l + 1) (r - 1)
    | otherwise              = nextPalindrome' (n - 10^l) l newRight
    where ll = s !! toInt l
          rr = s !! toInt r
          s  = show n
          newRight =
            let lLength = toNatural $ length $ show n
                rLength = toNatural $ length $ show $ n - 10^l
            in r - (lLength - rLength)

biggestPalindrome :: Natural -> Natural
biggestPalindrome n = nextPalindrome' n 0 (lastIndex n)
    where lastIndex x = toNatural $ (length $ show n) - 1

factorsLength :: Natural -> [Natural] -> Bool
factorsLength _ [] = False
factorsLength _ [x] = False
factorsLength n [x, y] | nLen n x && nLen n y = True
                       | otherwise = False
factorsLength n (x:y:zs)
    | x > y && nLen n x = factorsLength n (x : y * last zs : dropLast zs)
    | otherwise = factorsLength n (x * last zs : y : dropLast zs)
    where dropLast l = take (length l - 1) l

nLen :: Natural -> Natural -> Bool
nLen n x = (toNatural $ length (show x)) == n

toNatural :: (Integral a) => a -> Natural
toNatural x = fromIntegral x :: Natural

toInt :: (Integral a) => a -> Int
toInt x = fromIntegral x :: Int
