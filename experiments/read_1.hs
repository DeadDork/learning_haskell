main = do
    s <- getLine
    let i = read s :: Int -- poor error handling
    putStrLn $ show (i + 1)
    main
