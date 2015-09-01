module FizzBuzz
  ( fizzBuzz
  ) where

  fizzBuzz :: (Integral a, Show a) => a -> String
  fizzBuzz n
    | n `mod` 15 == 0 = "FizzBuzz"
    | n `mod` 3 == 0 = "Fizz"
    | n `mod` 5 == 0 = "Buzz"
    | otherwise     = show n
