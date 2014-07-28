-- Explores using a catchIOError to have error outputs.
-- (I suspect a Maybe type might be more appropriate?)

-- Conclusion: works!

import System.Environment
import System.IO.Error

main = do
    n <- getN
    putStrLn $ show n

getN :: IO Int
getN = do
    getNArg `catchIOError` (\e -> return 0)

getNArg :: IO Int
getNArg = do
    (arg1:_) <- getArgs
    return (read arg1 :: Int)
