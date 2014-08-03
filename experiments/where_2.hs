-- Explores where in if-then-else's.

-- Conclusion: I don't really get it. Something about `where` only being
-- applicable at the end of a declaration.

import System.Environment

main = do
    (arg:_) <- getArgs
    -- Compiles just fine
    {- s <- if arg == "s"
        then getContents
        else readFile arg -}
    --Doesn't compile
    {- s <- if a == "s"
        then getContents
        else readFile a
        where a = arg -}
    -- Does compile
    s <- let a = arg
         in if a == "s"
            then getContents
            else readFile a
    putStrLn s
