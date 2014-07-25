-- Explores whether a let variable in one line can be used in another line of
-- a let statement.

-- Conclusion: it can!

x :: Int
x =
    let y = 1
        z = y + 2
    in y + z

main = do putStrLn $ show x
