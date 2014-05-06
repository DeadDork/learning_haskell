import qualified Control.Monad as Ctrl

main = do
    colors <- Ctrl.forM [1,2,3,4] (\a -> do
        putStrLn $ "What color do you associate with the number " ++ show a ++ "?"
        getLine)
    putStrLn "You associate the numbers 1, 2, 3 and 4 with the colors"
    mapM_ putStrLn colors
