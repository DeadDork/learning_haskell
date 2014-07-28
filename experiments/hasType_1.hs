-- Explores whether the "has type" operator (i.e. '::') can be used inside a
-- function.

-- Conclusion: works!

import System.Environment

main = do
    (arg1:_) <- getArgs
    putStrLn $ show ((read arg1 :: Int) + 2)
