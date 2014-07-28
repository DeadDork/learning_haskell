-- Just making sure this pattern match of getting args works.
-- (It does!)

import System.Environment

main = do
    (arg1:arg2:_) <- getArgs
    putStrLn $ "First argument = " ++ arg1
    putStrLn $ "Second argument = " ++ arg2
