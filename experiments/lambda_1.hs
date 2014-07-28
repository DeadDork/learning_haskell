-- Explores a lambda without paramaters.

-- Conclusion: lambdas must have at least one paramater.

main = do
    putStrLn ((\x -> show x) 4) -- works
    --putStrLn (\ -> show 4) -- doesn't work
