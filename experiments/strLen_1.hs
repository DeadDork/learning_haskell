main = do
    putStrLn "Enter a string"
    str <- getLine
    putStrLn ("String [" ++ str ++ "] is " ++ (show $ length str) ++ " characters long")
