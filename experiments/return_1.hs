-- Explores IO.

-- Conclusions: works!

main = do
    a <- getA
    putStrLn a
    b <- getB
    putStrLn b

getA :: IO String
getA = return "Hi!"

getB :: IO String
getB = return "Bye!"
