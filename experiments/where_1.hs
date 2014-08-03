-- Explores the use of `where` in an if-then-else function

-- Conclusion: works!

test :: Int -> String
test x = if z > 0
    then "Positive!"
    else "Negative or zero!"
    where z = x
