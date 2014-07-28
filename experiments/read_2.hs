-- Solved a bug in the RWG program.

import System.Environment

main = do
    n <- getN
    putStrLn $ show n

getN :: IO Int
getN = do
    (arg1:_) <- getArgs
    --return 1 -- works
    --return $ read arg1 :: Int -- doesn't work
    return (read arg1 :: Int) -- works!
