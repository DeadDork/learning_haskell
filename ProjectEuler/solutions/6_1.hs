import Data.Natural

main :: IO ()
main = print $ sumSquareDifference 100

sumSquareDifference :: Natural -> Natural
sumSquareDifference 0 = 0
sumSquareDifference n = (sum [1..n])^2 - sum [x^2 | x <- [1..n]]
