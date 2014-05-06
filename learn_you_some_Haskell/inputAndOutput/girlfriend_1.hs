import qualified System.IO as Sys

main = do
    handle <- Sys.openFile "girlfriend_1.txt" Sys.ReadMode
    contents <- Sys.hGetContents handle
    putStr contents
    Sys.hClose handle
