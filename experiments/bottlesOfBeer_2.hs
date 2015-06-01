module Main where
  import Control.Monad.Writer

  songString :: String
  songString =
    let
      sing = tell
      someBottles n
        | n == 0     = "No more bottles of beer"
        | n == 1     = "1 bottle of beer"
        | otherwise = show n ++ " bottles of beer"
      bottlesOfBeer n = (someBottles n ++)
      verse n = do
        sing $ n `bottlesOfBeer` " on the wall.\n"
        sing $ n `bottlesOfBeer` ".\n"
        sing "Take one down, pass it around.\n"
        sing $ (n - 1) `bottlesOfBeer` " on the wall.\n"
      song = execWriter $ mapM_ verse [100, 99 .. 1]
    in song

  main :: IO ()
  main = putStr songString
