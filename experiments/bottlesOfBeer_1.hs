main :: IO ()
main = mapM_ _99bob [100, 99 .. 1]

_99bob :: Int -> IO ()
_99bob n = do
  bottlesOfBeer n >> putStrLn " on the wall."
  bottlesOfBeer n >> putStrLn "."
  putStrLn "Take one down."
  putStrLn "Pass it around."
  bottlesOfBeer (n - 1) >> putStrLn " on the wall."
    where
      bottlesOfBeer x
        | x == 0     = putStr "No more bottles of beer"
        | x == 1     = putStr "1 bottle of beer"
        | otherwise = putStr $ show x ++ " bottles of beer"
