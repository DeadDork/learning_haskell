import qualified Control.Monad as C

main = do
    c <- getChar
    C.when (c /= ' ') $ do
        putChar c
        main
