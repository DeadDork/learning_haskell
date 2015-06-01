module Main where
  import Control.Monad.Writer

  main :: IO ()
  main = putStr songString

  songString :: String
  songString =
    let
      verse n = do
        tell $ n `bottlesOfBeer` " on the wall.\n"
        tell $ n `bottlesOfBeer` ".\n"
        tell "Take one down, pass it around.\n"
        tell $ (n - 1) `bottlesOfBeer` " on the wall.\n\n"
      bottlesOfBeer n = (someBottles n ++)
      someBottles n
        | n == 0     = "No more bottles of beer"
        | n == 1     = "1 bottle of beer"
        | otherwise = show n ++ " bottles of beer"
    in execWriter $ mapM_ verse [100, 99 .. 1]
