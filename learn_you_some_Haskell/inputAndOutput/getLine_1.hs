-- Trying to write a simple program that reads a number and determines if it
-- really *is* a number

-- No success...

import Control.Exception

main = do
    putStrLn "Enter a number: "
    numberString <- getLine
    eVal <- try (str2int numberString) :: IO (Either SomeException ())
    case eVal of
        Right () -> do
            putStrLn "It's a number :)"
        Left e -> do
            putStrLn "Not a number :("

str2int :: String -> Int
str2int = read
