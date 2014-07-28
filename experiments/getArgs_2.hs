-- Explores whether you can call getArgs more than once.

-- Conclusion: you can!

import System.Environment

main = do
    args <- getArgs
    putStrLn $ args !! 0
    (arg1:_) <- getArgs
    putStrLn arg1
