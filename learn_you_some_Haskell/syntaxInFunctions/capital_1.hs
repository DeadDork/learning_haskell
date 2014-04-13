capital :: String -> String
capital "" = "Empty string"
capital fullString@(x:xs) = "The first letter of " ++ fullString ++ " is " ++ [x]
