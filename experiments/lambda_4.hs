-- Attempt to come up with a way to have a lambda with no arguments.

-- Fuck me, this is impossible: a function, by definition, maps an input to an
-- output.

main = do
    putStrLn $ (\ _ -> "hi there")
