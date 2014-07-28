-- Explores having a lambda that has a dummy paramater.

-- Conclusion: works.

main = do
    putStrLn $ show ((\x -> 5) 1)
