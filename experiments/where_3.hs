-- Explores type casting in a where.

-- Conclusion: works!

f :: String -> Integer -> Char
f s i = show s !! ii
    where ii = fromIntegral i :: Int
