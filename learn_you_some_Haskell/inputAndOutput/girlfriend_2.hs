import System.IO

main = do
    withFile "girlfriend_1.txt" ReadMode (\handle -> do
        contents <- hGetContents handle
        putStr contents)
