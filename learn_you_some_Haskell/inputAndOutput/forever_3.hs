-- Figured this out, kinda: putStr is executed after getLine, but not putStrLn.
main = do
    putStr "Enter some input: "
    l <- getLine
    putStrLn l
