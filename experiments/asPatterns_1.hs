test :: String -> String
test [] = "Empty string"
test fullString@(x:xs) = "fullString = " ++ fullString ++
                         " x = " ++ [x] ++
                         " xs = " ++ xs
