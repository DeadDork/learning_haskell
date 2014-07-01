str2Int :: String -> Int -- shortcut so I don't need to add type annotations everywhere
str2Int = read

main = do
  print (str2Int "3") -- ok
  -- print (str2Int "a") -- raises exception
  eVal <- try (print (str2Int "a")) :: IO (Either SomeException ())
  case eVal of
    Left e -> do -- couldn't parse input, try again
    Right n -> do -- could parse the number, go ahead
